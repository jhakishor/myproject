package com.adaptivity.blueprint4it.util;

import java.sql.Timestamp;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.web.struts.form.UserRegisterForm;


public class LoginUtil {
	public static synchronized String generateHashValue(UserRegisterForm objForm) {
		String hashVal = "";
		String email = objForm.getEmail();
		Timestamp createDt = objForm.getCreateDate();
		hashVal = email.hashCode() + createDt.hashCode()
				+ Math.ceil(Math.random()) + "";
		hashVal	= hashVal.replace("-", "N");
		hashVal	= hashVal.replace(".", "D");
		hashVal	= hashVal.substring(0, 10);
		return hashVal;
	}// generateHashValue

	public static synchronized Login generateLoginPojo(UserRegisterForm objForm) {
		
		Login pojoObj = new Login();
		pojoObj.setCompanyName(objForm.getCompanyName());
		pojoObj.setFirstName(objForm.getFirstName());
		pojoObj.setLastName(objForm.getLastName());
		pojoObj.setCompanyTitle(objForm.getCompanyTitle());
		pojoObj.setPassword(objForm.getPassword());
		pojoObj.setPhno(objForm.getPhno());
		pojoObj.setId(objForm.getId());
		pojoObj.setEmail(objForm.getEmail());
		pojoObj.setPromoCode(objForm.getPromoCode());
		return pojoObj;
	}// generateLoginPojo

	public static synchronized UserRegisterForm generateLoginForm(Login objLogin) {

		UserRegisterForm objUserRegisterForm = new UserRegisterForm();
		objUserRegisterForm.setCompanyName(objLogin.getCompanyName());
		objUserRegisterForm.setFirstName(objLogin.getFirstName());
		objUserRegisterForm.setLastName(objLogin.getLastName());
		objUserRegisterForm.setCompanyTitle(objLogin.getCompanyTitle());
		objUserRegisterForm.setPhno(objLogin.getPhno().toString());
		objUserRegisterForm.setId(objLogin.getId());
		objUserRegisterForm.setEmail(objLogin.getEmail());
		objUserRegisterForm.setPassword(objLogin.getPassword());
		objUserRegisterForm.setPromoCode(objLogin.getPromoCode());
		return objUserRegisterForm;
	}// generateLoginForm
}// LoginUtil
