package com.adaptivity.blueprint4it.web.struts.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.springframework.dao.DataAccessException;

import com.adaptivity.blueprint4it.beans.DownloadProperties;
import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.util.LoginUtil;
import com.adaptivity.blueprint4it.util.MailUtil;
import com.adaptivity.blueprint4it.web.common.Constants;
import com.adaptivity.blueprint4it.web.struts.form.UserForgetPasswordForm;
import com.adaptivity.blueprint4it.web.struts.form.UserRegisterForm;

public class UserForgetPasswordAction extends BaseAction {
	private static Logger logger = Logger.getLogger(UserForgetPasswordAction.class);
	
	public ActionForward executeAction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// Create object of ActionMesssages
		ActionMessages errors = new ActionMessages();
		try{
			// Retrieve the DAO Reference
			com.adaptivity.blueprint4it.dao.SpringHibernateDAO springHibernateDAO = (com.adaptivity.blueprint4it.dao.SpringHibernateDAO) ServiceFinder
					.getContext(request).getBean("SpringHibernateDao");
			
			DownloadProperties downloadProperties = (DownloadProperties) ServiceFinder
			.getContext(request).getBean("downloadProperties");
	
			// Retrieve the DAO Reference
			com.adaptivity.blueprint4it.web.common.SendMail mailBean = (com.adaptivity.blueprint4it.web.common.SendMail) ServiceFinder
					.getContext(request)
					.getBean(
							com.adaptivity.blueprint4it.web.common.Constants.MAIL_BEAN);
	
	
			UserForgetPasswordForm forgetform = (UserForgetPasswordForm) form;
	
			// String strUserName=forgetform.getUsername();
			String strEmail = forgetform.getEmail();
	
			// 1) Validate the email
			// 2) If Invalid email, throw error
			// 3) If valid email then fetch the user details
			// 4) Update the password based on hash value in the Form and update DB
			// 5) Generate email with Hash value and send it to user.
			// -- Div
	
			boolean isValidEmail = springHibernateDAO.checkValidEmail(strEmail);
			if (isValidEmail) {
				Login objLogin = springHibernateDAO.loadUserByEmail(strEmail);
				UserRegisterForm objUserRegisterForm = LoginUtil
						.generateLoginForm(objLogin);
				objUserRegisterForm.setCreateDate(new Timestamp(System
						.currentTimeMillis())); // we can remove this once we start
				// storing user created date in DB
	
				// generating Hash value
//				objUserRegisterForm.setPassword(LoginUtil
//						.generateHashValue(objUserRegisterForm));
				// update the UserObject
				com.adaptivity.blueprint4it.dao.hibernate.Login pojoObj = LoginUtil
						.generateLoginPojo(objUserRegisterForm);
				pojoObj.setActivationKey(LoginUtil.generateHashValue(objUserRegisterForm));
				pojoObj.setRegistrationStatus(Constants.UN_CONFIRMED);
				springHibernateDAO.updateUser(pojoObj);
	
				// generate URL.
				
				String registrationUrl = downloadProperties.getRegistrationUrl();
				String bccAddress = downloadProperties.getSupportAddress();
				String mailURL = registrationUrl+"/userlogin.do?pageOf=changePasswordFromLink&email="
					+ pojoObj.getEmail()
					+ "&key="
					+ pojoObj.getActivationKey();
					//+ pojoObj.getPassword();
				
				String subject = "Blueprint4IT Password Assistance ";
				String message = "Hi " + objLogin.getFirstName() + ",";
				message += "\n\nThank you for resetting your password. To initiate the password reset process for your Blueprint4IT Account, click the link below:\n"
						+ mailURL;
				message += "\n \nIf clicking the link above doesn't work, please copy and paste the URL in a  new browser window instead.";
				
				message += MailUtil.getPwdEmailFooter().toString();
	
				// sending mail
				String[] reciepent = { strEmail };
	
				String from = com.adaptivity.blueprint4it.web.common.Constants.FROM_MAIL;
	
				try {
					mailBean.sendMail(reciepent, subject, message, from, bccAddress);
	
				} catch (Exception e) {
					//e.printStackTrace();
					logger.info(e.getStackTrace());
				}
	
				return mapping.findForward("success");
	
			} else {
				errors.add("invalid", new ActionMessage("error.email.invalid"));
				saveErrors(request, errors);
				logger.info("Invalid Email Address entered");
	
				return mapping.findForward("failure");
			}// if-else valid email
		}catch (DataAccessException dae){
			errors.add("Database Exception", new ActionMessage(
			"data.access.exception"));
			saveErrors(request, errors);
			logger.info(dae.getStackTrace());
			return mapping.findForward("failure");
		}
		catch (Exception e){
			errors.add("Exception", new ActionMessage(
					"website.access.exception"));
			saveErrors(request, errors);
			logger.info(e.getStackTrace());
			return mapping.findForward(Constants.WEBSITE_DOWN);
		}
	}// execute
}