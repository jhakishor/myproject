package com.adaptivity.blueprint4it.web.struts.form;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class UserRegisterForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2642733007961747150L;
	private String action = "add";
	private String actionUpdateData;

	private Integer id;

	private String companyName;
	private String firstName;
	private String lastName;
	private String companyTitle;
	private String password;
	private String confirmPassword;
	private String email;	
	private String phno;
	private String promoCode;

	private Timestamp createDate;

	public String getPromoCode() {
		return promoCode;  
	}
	
	public void setPromoCode(String promoCode) {
		this.promoCode = promoCode;
	}
	
	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {

		this.id = null;
		this.companyName = null;
		this.firstName = null;
		this.lastName = null;
		this.companyTitle = null;
		this.password = null;
		this.email = null;
		this.phno = null;
		this.promoCode = null;

		this.action = "add";
		this.createDate = null;
		this.actionUpdateData = "";

	}

	public ActionErrors validate(

	ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();

		return errors;
	}

	/**
	 * @return the action
	 */
	public String getAction() {
		return action;
	}

	/**
	 * @param action
	 *            the action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}

	/**
	 * @return the actionUpdateData
	 */
	public String getActionUpdateData() {
		return actionUpdateData;
	}

	/**
	 * @param actionUpdateData
	 *            the actionUpdateData to set
	 */
	public void setActionUpdateData(String actionUpdateData) {
		this.actionUpdateData = actionUpdateData;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName
	 *            the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName
	 *            the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName
	 *            the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the companyTitle
	 */
	public String getCompanyTitle() {
		return companyTitle;
	}

	/**
	 * @param companyTitle
	 *            the companyTitle to set
	 */
	public void setCompanyTitle(String companyTitle) {
		this.companyTitle = companyTitle;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
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

	/**
	 * @return the phno
	 */
	public String getPhno() {
		return phno;
	}

	/**
	 * @return the confirmPassword
	 */
	public String getConfirmPassword() {
		return confirmPassword;
	}

	/**
	 * @param confirmPassword the confirmPassword to set
	 */
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/**
	 * @param phno the phno to set
	 */
	public void setPhno(String phno) {
		this.phno = phno;
	}
	

}
