package com.adaptivity.blueprint4it.web.struts.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class UserLoginForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3063844444589806295L;
	private String action = "add";
	private String email = null;
	private String key = null;
	private String password = null;

	public void reset(ActionMapping mapping, HttpServletRequest request) {

		this.email = null;
		this.key = null;

		this.action = "add";

	}

	public ActionErrors validate(

	ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		return errors;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

}
