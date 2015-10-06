package com.adaptivity.blueprint4it.web.struts.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class ChangePasswordForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3063208011360033544L;

	private String action = "change";

	private String email = null;

	private String oldPassword = null;

	private String newPassword = null;

	private String confirmPassword = null;
	
	private String forward = null;

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getAction() {
		return this.action;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.email = null;
		this.action = "change";
	}

	public ActionErrors validate(

	ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();

		if (getNewPassword() == null || getConfirmPassword() == null) {
			errors.add("passwordNull", new ActionMessage(
					"New Password and Confirm Password cannot be null"));
		}
		if (!getNewPassword().equalsIgnoreCase(getConfirmPassword())) {
			errors.add("passwordMismatch", new ActionMessage(
					"New Password and Confirm Password do not match"));
		}

		return errors;
	}

}