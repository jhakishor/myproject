package com.adaptivity.blueprint4it.web.struts.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class UserForgetPasswordForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 675138602494049890L;

	private String action = "add";

	private String email = null;

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

		this.action = "add";

	}

	public ActionErrors validate(

	ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();

		if ((getEmail() == null || getEmail().length() < 1)) {
			errors.add("email", new ActionMessage("error.email.required"));
		}

		return errors;
	}

}