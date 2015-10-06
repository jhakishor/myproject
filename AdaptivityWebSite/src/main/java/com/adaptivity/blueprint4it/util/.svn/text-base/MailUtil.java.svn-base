package com.adaptivity.blueprint4it.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.web.common.Constants;


public class MailUtil {
	private static Logger logger = Logger.getLogger(MailUtil.class);
	
	public static StringBuffer passwordEmailFooter;
	
	public static StringBuffer getPwdEmailFooter(){
		
		passwordEmailFooter	=	new StringBuffer();
		passwordEmailFooter.append("\n\n\nIf you've received this mail in error, it's likely that another user entered your email address by mistake while trying to register or reset their password. If you didn't initiate the request, you don't need to take any further action and can safely disregard this email.");
		passwordEmailFooter.append("\n\nPlease note that use of the Adaptivity website is governed by its Terms of Use  and we have a very strict Privacy Policy (http://www.adaptivity.com/privacy.jsp) regarding the gathering, storage and dissemination of your information.");
		passwordEmailFooter.append("\n\nAdaptivity is in full compliance with the CAN-SPAM Act of 2003. If you wish to unsubscribe, follow the instructions provided below:");
		passwordEmailFooter.append("\n\nAn Adaptivity Contact and/or Customer may choose at any time to review, modify or permanently remove the information stored by Adaptivity about that Contact and/or Customer by sending an email to unsubscribe@adaptivity.com to terminate the account.");
		passwordEmailFooter.append("\n\nThank you for using Adaptivity's Blueprint4IT!");
		passwordEmailFooter.append("\nAdaptivity Team");
		
		return passwordEmailFooter;
	}//constructor
	public static void sendMail(HttpServletRequest request, String[] reciepent,
			String subject, String message, String from, String bcc) {
		try {
			com.adaptivity.blueprint4it.web.common.SendMail mailBean = (com.adaptivity.blueprint4it.web.common.SendMail) ServiceFinder
					.getContext(request).getBean(
							com.adaptivity.blueprint4it.web.common.Constants.MAIL_BEAN);
			mailBean.sendMail(reciepent, subject, message, from, bcc);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}// sendMail
	public static String getDownloadInfoForSalesDept(Login user, String timeStamp, String fileName){
		StringBuffer sb = new StringBuffer();
		sb.append("Hi Team,\n\n");
		sb.append("Following are the details for the Blueprint4IT installer download:\n\n");
		sb.append("USER INFORMATION :\n");
		sb.append("User Id : "+user.getId().toString()+"\n");
		sb.append("Company Name : "+user.getCompanyName()+"\n");
		sb.append("First Name : "+user.getFirstName()+"\n");
		sb.append("Last Name : "+user.getLastName()+"\n");
		sb.append("Company Title : "+user.getCompanyTitle()+"\n");
		sb.append("Email : "+user.getEmail()+"\n");
		sb.append("Phone No. : "+user.getPhno()+"\n");
		sb.append("Promo Code : "+user.getPromoCode()+"\n");
		sb.append("Registration Status : "+user.getRegistrationStatus()+"\n\n");
		sb.append("DOWNLOADED FILE INFORMATION :\n");
		sb.append("Time Stamp : "+timeStamp+"\n");
		sb.append("Download Type : "+fileName+"\n");
		sb.append("\n\n");
		sb.append("Thanks,\n");
		sb.append("Adaptivity Team");
		return sb.toString();
	}
}// MailUtil
