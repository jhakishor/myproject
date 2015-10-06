package com.adaptivity.blueprint4it.web.struts.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.springframework.dao.DataAccessException;

import com.adaptivity.blueprint4it.beans.DownloadProperties;
import com.adaptivity.blueprint4it.dao.SpringHibernateDAO;
import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.util.LoginUtil;
import com.adaptivity.blueprint4it.web.common.Constants;
import com.adaptivity.blueprint4it.web.struts.form.UserLoginForm;

//

public class UserLoginAction extends Action {
	
	private static Logger logger = Logger.getLogger(UserLoginAction.class);
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		// Create object of ActionMesssages
		ActionMessages errors = new ActionMessages();
		String pageOf = request.getParameter(Constants.PAGEOF);
		
		try{
			// Retrieve the DAO Reference
			com.adaptivity.blueprint4it.dao.SpringHibernateDAO springHibernateDAO = (com.adaptivity.blueprint4it.dao.SpringHibernateDAO) ServiceFinder
					.getContext(request).getBean("SpringHibernateDao");
			
			StandardPBEStringEncryptor objStandardPBEStringEncryptor = (StandardPBEStringEncryptor) ServiceFinder
			.getContext(request).getBean("strongEncryptor");
			
			HttpSession session = request.getSession();
	
			UserLoginForm objForm = (UserLoginForm) form;
	
			String strEmail = objForm.getEmail();
			
			if(request.getSession()!= null && request.getSession().getAttribute("LOGGEDIN") != null) {
				logger.info("User logged in");
				if (pageOf != null) {
					if (strEmail != null) {
						Login user = springHibernateDAO.loadUserByEmail(strEmail);
						//If registrationStatus == 0 then the user has not activated the link yet.						
						if(user.getRegistrationStatus() != null && user.getRegistrationStatus().intValue() == Constants.CONFIRMED.intValue()){
							//Its a re-request from account activation link, hence goto home page without download
							return mapping.findForward("successOfDownloadAndAlreadyLoggedIn");
						} else {
							return mapping.findForward("successOfDownload");
						}
					} else {
						//Its a request from my download link, hence goto my downloads page
						return mapping.findForward("successOfDownload");
					}
				} else {
					return mapping.findForward("success");
				}			
			}
			
	
			//String strPassword = objForm.getKey();
			String strPassword 	= objForm.getPassword();
			String strKey	 	= objForm.getKey();
			
			//If strKey is not null that means the user has clicked on link.
			//If strKey is null that means the user has typed in the userid and pwd.			
			//Else the user has typed in the userid and password.
			
			if(null == strKey){
				
				
//				boolean loginStatus = springHibernateDAO.checkUserLogin(strEmail,
//						strPassword);
				
				Login user = springHibernateDAO.loadUserByEmail(strEmail);
				String decryptedPwd = "";
				try {
					decryptedPwd = objStandardPBEStringEncryptor.decrypt(user.getPassword());
				} catch (Exception e) {
					e.getCause();
					e.getMessage();
					logger.warn(e.getMessage());
					decryptedPwd = "";
				}
				boolean loginStatus = decryptedPwd.equalsIgnoreCase(strPassword);
				if (loginStatus == true) {
		
					//Login user = springHibernateDAO.loadUserByEmail(strEmail);
					// session.setAttribute(Constants.EMAIL, strEmail);
					
					//Validate the registrationStatus.
					//If registrationStatus == 0 then the user has not activate the link yet.
					//Throw appropriate error messgae.
					if(user.getRegistrationStatus() != null && user.getRegistrationStatus().intValue() == Constants.CONFIRMED.intValue()){
						// adding the cookies
//						Cookie cookieEmail = new Cookie("email", strEmail);
//						cookieEmail.setMaxAge(3600);
//						Cookie cookiePassword = new Cookie("password", strPassword);
//						cookiePassword.setMaxAge(3600);
//						response.addCookie(cookieEmail);
//						response.addCookie(cookiePassword);
//			
//						session.setAttribute(Constants.EMAIL, strEmail);
//						//resetting the password after decryting it as the value is used to display on change password screen
//						user.setPassword(decryptedPwd);
//						session.setAttribute(Constants.CURRENT_USER, user);
//			
//						session.setAttribute("ID", user.getId());
//			
//						System.out
//								.println("Session value:" + session.getAttribute("email"));
//						// setting this value as a flag for thinkbox.
//						request.setAttribute(Constants.LOGIN_SUCCESS, Constants.LOGIN_SUCCESS);
//						
//						DownloadProperties downloadProperties = (DownloadProperties) ServiceFinder.getContext(request).getBean("downloadProperties");
//						String windowsFileSize = downloadProperties.getWindowsFileSize();
//						String macFileSize = downloadProperties.getMacFileSize();
//						String linuxFileSize = downloadProperties.getLinuxFileSize();
//						
//						session.setAttribute(Constants.FILESIZE_WINDOWS, windowsFileSize);
//						session.setAttribute(Constants.FILESIZE_MAC, macFileSize);
//						session.setAttribute(Constants.FILESIZE_LINUX, linuxFileSize);
//						request.getSession(true).setAttribute(Constants.LOGGEDIN, "1");
						updateResponseAndSession(response,request,user);
						if (pageOf != null) {
							return mapping.findForward("successOfDownload");
						} else {
							return mapping.findForward("success");
						}
					}else{
						errors.add("login", new ActionMessage("error.login.activation"));
						saveErrors(request, errors);
						request.setAttribute(Constants.LOGIN_FAILURE, Constants.LOGIN_FAILURE);
						request.getSession().removeAttribute(Constants.LOGGEDIN);
						if (pageOf != null) {
							return mapping.findForward("failureOfDownload");
						} else {
							return mapping.findForward("failure");
						}
					}//registrationStatus check
					
				} else {
					// not allowed
		
					errors.add("login", new ActionMessage("error.login.invalid"));
					saveErrors(request, errors);
					request.setAttribute(Constants.LOGIN_FAILURE, Constants.LOGIN_FAILURE);
					request.getSession().removeAttribute(Constants.LOGGEDIN);
					if (pageOf != null) {
						return mapping.findForward("failureOfDownload");
					} else {
						return mapping.findForward("failure");
					}
		
				}//login status
			}else{
				String activationStatus	= activateAccount(request,response,objForm);
				if (activationStatus == Constants.SUCCESS) {
					if(pageOf.equals(Constants.CHANGE_PASSWORD_FROM_LINK)){
						return mapping.findForward(Constants.CHANGE_PASSWORD_FROM_LINK);
					}
					return mapping.findForward("successOfDownload");
				}else{
					if(activationStatus.equalsIgnoreCase(Constants.ACTIVATION_KEY_FAILURE)){
						errors.add("login", new ActionMessage("error.activation.key"));
					}else{
						errors.add("login", new ActionMessage("error.login.activated"));
					}
					saveErrors(request, errors);
					request.setAttribute(Constants.LOGIN_FAILURE, Constants.LOGIN_FAILURE);
					request.getSession().removeAttribute(Constants.LOGGEDIN);
					return mapping.findForward("failureOfDownload");
				}
			}//null chk for strKey i.e. account activation process
		}catch (DataAccessException dae){
			request.setAttribute(Constants.LOGIN_FAILURE,
					Constants.LOGIN_FAILURE);
			errors.add("Database Exception", new ActionMessage(
			"data.access.exception"));
			saveErrors(request, errors);
			logger.error("error occurred while login action", dae);
			return mapping.findForward("failure");
		}
		catch (Exception e){
			errors.add("Exception", new ActionMessage(
					"website.access.exception"));
			saveErrors(request, errors);
			logger.error("error occurred while login action", e);
			request.setAttribute(Constants.LOGIN_FAILURE,
					Constants.LOGIN_FAILURE);
			return mapping.findForward(Constants.WEBSITE_DOWN);
		}
	}//execute
	
	// Method to activate the account by clicking on the link.
	// 1) Validate the activation key by looking up the record with the email
	// address and key
	// 2) User must have a status of “UNCONFIRMED”
	// 3) If the user status is “CONFIRMED” then alert the user about
	// registration status and redirect to the login page
	// 4) On successful validation for UNCONFIRMED users, set the ACTIVATION_KEY
	// to NULL and redirect the user to Download Page (as logged in user).
	
	private String activateAccount(HttpServletRequest request, HttpServletResponse response, UserLoginForm objForm){
		String activationStatus = Constants.FAILURE;
		// Retrieve the DAO Reference
		SpringHibernateDAO springHibernateDAO = (com.adaptivity.blueprint4it.dao.SpringHibernateDAO) ServiceFinder
				.getContext(request).getBean("SpringHibernateDao");
		
		Login user	= new Login();
		user.setEmail(objForm.getEmail());
		user.setActivationKey(objForm.getKey());
		
		user	= springHibernateDAO.activateUser(user);
		if(null != user){
			if(user.getRegistrationStatus()!= Constants.CONFIRMED){
				//set the status as confirmed and key as null and update the object
				user.setActivationKey(null);
				user.setRegistrationStatus(Constants.CONFIRMED);
				springHibernateDAO.updateUser(user);
				activationStatus	= Constants.SUCCESS;
				updateResponseAndSession(response,request,user);
			}else{
				//return code to display message for already activated account
				activationStatus	= Constants.ACTIVATED_ACCOUNT;
			}
		}else{
			//chk the status and key of the user
			user	= springHibernateDAO.loadUserByEmail(objForm.getEmail());
			if(user.getActivationKey() != null
					&& !objForm.getKey().equalsIgnoreCase(user.getActivationKey())){
				activationStatus	= Constants.ACTIVATION_KEY_FAILURE;
			}else if(user.getRegistrationStatus() == Constants.CONFIRMED){
				activationStatus	= Constants.ACTIVATED_ACCOUNT;
			}
			
		}//user == null --> Activation key or email is wrong
		return activationStatus;
	}//activateAccount
	
	private void updateResponseAndSession(HttpServletResponse response,
			HttpServletRequest request, Login user){
		
		StandardPBEStringEncryptor objStandardPBEStringEncryptor = (StandardPBEStringEncryptor) ServiceFinder
		.getContext(request).getBean("strongEncryptor");
		HttpSession session = request.getSession();
		Cookie cookieEmail = new Cookie("email", user.getEmail());
		cookieEmail.setMaxAge(3600);
		Cookie cookiePassword = new Cookie("password", user.getPassword());
		cookiePassword.setMaxAge(3600);
		response.addCookie(cookieEmail);
		response.addCookie(cookiePassword);

		session.setAttribute(Constants.EMAIL, user.getPassword());
		//resetting the password after decryting it as the value is used to display on change password screen
		String decryptedPwd = objStandardPBEStringEncryptor.decrypt(user.getPassword());
		user.setPassword(decryptedPwd);
		session.setAttribute(Constants.CURRENT_USER, user);

		session.setAttribute("ID", user.getId());

		System.out
				.println("Session value:" + session.getAttribute("email"));
		// setting this value as a flag for thinkbox.
		request.setAttribute(Constants.LOGIN_SUCCESS, Constants.LOGIN_SUCCESS);
		
		DownloadProperties downloadProperties = (DownloadProperties) ServiceFinder.getContext(request).getBean("downloadProperties");
		String windowsFileSize = downloadProperties.getWindowsFileSize();
		String macFileSize = downloadProperties.getMacFileSize();
		String linuxFileSize = downloadProperties.getLinuxFileSize();
		
		session.setAttribute(Constants.FILESIZE_WINDOWS, windowsFileSize);
		session.setAttribute(Constants.FILESIZE_MAC, macFileSize);
		session.setAttribute(Constants.FILESIZE_LINUX, linuxFileSize);
		request.getSession(true).setAttribute(Constants.LOGGEDIN, "1");
	}//updateResponseAndSession
}//UserLoginAction
