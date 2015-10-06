package com.adaptivity.blueprint4it.web.struts.action;

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

import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.web.common.Constants;
import com.adaptivity.blueprint4it.web.struts.form.ChangePasswordForm;

public class ChangePasswordAction extends BaseAction {
	
	private static Logger logger = Logger.getLogger(ChangePasswordAction.class);
	public ActionForward executeAction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.info("ChangePassword Action is loaded");
		// Create object of ActionMesssages
		ActionMessages errors = new ActionMessages();
		try{
			// Retrieve the DAO Reference
			com.adaptivity.blueprint4it.dao.SpringHibernateDAO springHibernateDAO = (com.adaptivity.blueprint4it.dao.SpringHibernateDAO) ServiceFinder
					.getContext(request).getBean("SpringHibernateDao");
	
			StandardPBEStringEncryptor objStandardPBEStringEncryptor = (StandardPBEStringEncryptor) ServiceFinder
			.getContext(request).getBean("strongEncryptor");
			
	
			ChangePasswordForm objChangePasswordForm = (ChangePasswordForm) form;
			HttpSession session = request.getSession();
			if (session != null) {
				Object userObj = session.getAttribute(Constants.CURRENT_USER);
				if (userObj != null) {
					Login user = (Login) userObj;
					objChangePasswordForm.setEmail(user.getEmail());
				}// null chk for userObj
			}// null chk for session
	
			String strEmail = objChangePasswordForm.getEmail();
			// String strEmail = "divyar@drs.com";
	
			boolean isValidEmail = springHibernateDAO.checkValidEmail(strEmail);
			//boolean isValidEmail = true;
			if (isValidEmail) {
				Login objLogin = springHibernateDAO.loadUserByEmail(strEmail);
				String oldPassword = objStandardPBEStringEncryptor.decrypt(objLogin.getPassword());
				//added the check for checking the old password correctly by user.
				if(!objChangePasswordForm.getOldPassword().equals(oldPassword)){
					errors
					.add("oldPasswordIncorrent", new ActionMessage(
							"error.oldpassword.incorrent"));
			        saveErrors(request, errors);
			        return mapping.findForward("failure");
				}
				//objLogin.setPassword(objChangePasswordForm.getNewPassword());
				objLogin.setPassword(objStandardPBEStringEncryptor.encrypt(objChangePasswordForm.getNewPassword()));
				springHibernateDAO.updateUser(objLogin);
				request.setAttribute(Constants.SUCCESS, Constants.SUCCESS);
				return mapping.findForward("success");
	
			} else {
				errors
						.add("invalidEmail", new ActionMessage(
								"error.email.invalid"));
				saveErrors(request, errors);
				

				return mapping.findForward("failure");
			}// if-else valid email
		}catch (DataAccessException dae){
			errors.add("Database Exception", new ActionMessage(
					"data.access.exception"));
			saveErrors(request, errors);
			logger.info(dae.getStackTrace());
			return mapping.findForward("failure");
		}
	}// execute
}