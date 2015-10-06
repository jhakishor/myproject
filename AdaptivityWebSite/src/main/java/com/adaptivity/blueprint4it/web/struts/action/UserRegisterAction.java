package com.adaptivity.blueprint4it.web.struts.action;

import java.sql.Timestamp;

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
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.util.LoginUtil;
import com.adaptivity.blueprint4it.util.MailUtil;
import com.adaptivity.blueprint4it.web.common.Constants;
import com.adaptivity.blueprint4it.web.struts.form.UserRegisterForm;

public class UserRegisterAction extends Action {

	private static Logger logger = Logger.getLogger(UserRegisterAction.class);
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		UserRegisterForm objForm = (UserRegisterForm) form;
		ActionMessages errors = new ActionMessages();
		// Retrieve the DAO Reference
		// By Default show the Add/Edit Page
		String forwardToPage = "input";
		String strError = "";

		try {
			com.adaptivity.blueprint4it.dao.SpringHibernateDAO springHibernateDAO = (com.adaptivity.blueprint4it.dao.SpringHibernateDAO) ServiceFinder
					.getContext(request).getBean("SpringHibernateDao");
			
			StandardPBEStringEncryptor objStandardPBEStringEncryptor = (StandardPBEStringEncryptor) ServiceFinder
			.getContext(request).getBean("strongEncryptor");
			
			DownloadProperties downloadProperties = (DownloadProperties) ServiceFinder
			.getContext(request).getBean("downloadProperties");
			
			boolean validDomain = springHibernateDAO
					.validateEmailDomain(objForm.getEmail());
			if (validDomain) {
				boolean ValidCompanynameStatus = springHibernateDAO
						.checkValidEmail(objForm.getEmail());

				// In case of form submit Add/Update the data
				// if (objForm.getActionUpdateData().equals("update")) {
				// In case of Add, Add the data into database

				if (objForm.getAction().equals("add")) {

					if (ValidCompanynameStatus == false) {

						com.adaptivity.blueprint4it.dao.hibernate.Login pojoObj = new com.adaptivity.blueprint4it.dao.hibernate.Login();

						pojoObj.setCompanyName(objForm.getCompanyName());
						pojoObj.setFirstName(objForm.getFirstName());
						pojoObj.setLastName(objForm.getLastName());
						pojoObj.setCompanyTitle(objForm.getCompanyTitle());
						//pojoObj.setPassword(objForm.getPassword());
						pojoObj.setPassword(objStandardPBEStringEncryptor.encrypt(objForm.getPassword()));
						pojoObj.setPhno(objForm.getPhno());
						pojoObj.setId(objForm.getId());
						pojoObj.setEmail(objForm.getEmail());
						pojoObj.setPromoCode(objForm.getPromoCode());

						objForm.setCreateDate(new Timestamp(System
								.currentTimeMillis()));
//						pojoObj.setPassword(LoginUtil
//								.generateHashValue(objForm));
						
						pojoObj.setActivationKey(LoginUtil
								.generateHashValue(objForm));
						pojoObj.setRegistrationStatus(Constants.UN_CONFIRMED);
						//String mailURL = "http://blueprint4it.com/userlogin.do?pageOf=download&email="
						String registrationUrl = downloadProperties.getRegistrationUrl();
						String bccAddress = downloadProperties.getSalesAddress();
						String mailURL = registrationUrl+"/userlogin.do?pageOf=download&email="
								+ pojoObj.getEmail()
								+ "&key="
								+ pojoObj.getActivationKey();
								//+ pojoObj.getPassword();

						// System.out.println("mailURL -->" + mailURL);
						// Add the data
						springHibernateDAO.addUser(pojoObj);

						// Sending Mail
						String[] reciepent = { objForm.getEmail() };
						String username = objForm.getFirstName();
						String message = "Hi " + username + ",";
						String subject;
						if(objForm.getPromoCode().trim().equalsIgnoreCase(Constants.CLOUD_EXPO_2010)){
							subject	= "Blueprint4IT Account Activation Required for Free iPad Contest";
							message += "\n\nThank you for registering to win a free iPad and joining Adaptivity’s Blueprint4IT community.  Please click on the link below to complete the account activation process so that you can access your downloads and be entered in the iPad giveaway contest. \n\n";
						}else{
							subject = "Blueprint4IT Account Activation Required";
							message += "\n\nThank you for registering to become a member of Adaptivity’s Blueprint4IT community.  Please click on the link below to complete the account activation process so that you can access your downloads \n\n";
						}
							
						//message += 	"\nPlease click on the following link to complete your registration:\n";
						message += 	 mailURL;
						message += "\n \nIf clicking the link above doesn't work, please copy and paste the URL in a  new browser window instead.";
						
						message += MailUtil.getPwdEmailFooter().toString();
						
//						message += "\n\n\nIf you've received this mail in error, it's likely that another user entered your email address by mistake while trying to register or reset their password. If you didn't initiate the request, you don't need to take any further action and can safely disregard this email.";
//						message += "\n\nPlease note that use of the Adaptivity website is governed by its Terms of Use (http://www.adaptivity.com/terms.jsp) and we have a very strict Privacy Policy (http://www.adaptivity.com/privacy.jsp) regarding the gathering, storage and dissemination of your information."; 
//						message += "\n\nAdaptivity is in full compliance with the CAN-SPAM Act of 2003. If you wish to unsubscribe, follow the instructions provided below:";
//						message += "\n\nAn Adaptivity Contact and/or Customer may choose at any time to review, modify or permanently remove the information stored by Adaptivity about that Contact and/or Customer by sending an email to unsubscribe@adaptivity.com to terminate the account.";
//						message += "\n\nThank you for using Adaptivity’s Blueprint4IT!";
//						message += "\nAdaptivity Team";
						
						String from = com.adaptivity.blueprint4it.web.common.Constants.FROM_MAIL;
						MailUtil.sendMail(request, reciepent, subject, message,
								from,bccAddress);

						forwardToPage = Constants.SUCCESS;
						request.setAttribute(Constants.REGISTERATION_SUCCESS,
								Constants.REGISTERATION_SUCCESS);

					} else {

						// Create object of ActionMesssages
						errors.add("duplicateEmailId", new ActionMessage(
								"duplicate.email.id"));
						// saveErrors(request, errors);
						logger.info("duplicateEmailId");
						request.setAttribute(Constants.REGISTERATION_FAILURE,
								Constants.REGISTERATION_FAILURE);
					}

				}// action == add

				// In case of Logout retrieve the data from session and
				// invalidate
				// it
				if (objForm.getAction().equals("Logout")) {

					try {

						HttpSession session = request.getSession(false);
						if (session != null) {
							session.invalidate();
						}

					} catch (Exception e) {
						strError = e.getMessage();					
					}

					forwardToPage = "input";
					// Set the action to update
					// objForm.setAction("update");
				}// action == logout
			} else {
				request.setAttribute(Constants.REGISTERATION_FAILURE,
						Constants.REGISTERATION_FAILURE);
				errors.add("invalidDomainName", new ActionMessage(
						"error.domainName.invalid"));
				 saveErrors(request, errors);
				return mapping.findForward("input");
			}// validDomain
			saveErrors(request, errors);
		} catch (DataAccessException e) {
			forwardToPage = Constants.FAILURE;
			strError = e.getMessage();
			request.setAttribute(Constants.ERROR_MSG, strError);
			request.setAttribute(Constants.REGISTERATION_FAILURE,
					Constants.REGISTERATION_FAILURE);
			errors.add("Database Exception", new ActionMessage(
					"data.access.exception"));
			saveErrors(request, errors);
			logger.info(e.getStackTrace());
		} catch (Exception e) {
			forwardToPage = Constants.FAILURE;
			strError = e.getMessage();
			request.setAttribute(Constants.ERROR_MSG, strError);
			request.setAttribute(Constants.REGISTERATION_FAILURE,
					Constants.REGISTERATION_FAILURE);
			errors.add("Database Exception", new ActionMessage(
					"data.access.exception"));
			saveErrors(request, errors);
			logger.info(e.getStackTrace());
		}
		// Display the registration form to the user
		return mapping.findForward(forwardToPage);
	}
}
