package com.adaptivity.blueprint4it.web.struts.action;

/*
 import java.util.ArrayList;
 import java.util.Collection;
 import java.util.Iterator;
 import java.util.List;
 */
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

import com.adaptivity.blueprint4it.web.common.Constants;

public class LogoutAction extends Action {
	
	private static Logger logger = Logger.getLogger(LogoutAction.class);
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		ActionMessages errors = new ActionMessages();
		try {

			HttpSession session = request.getSession(false);
			if (session != null) {
				// to remove the cookies if the user logs out
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (int i = 0; i < cookies.length; i++) {
						Cookie delCookie = new Cookie(cookies[i].getName(),
								cookies[i].getValue());
						// delCookie.setDomain(cookies[i].getDomain());
						// delCookie.setPath(cookies[i].getPath());
						delCookie.setMaxAge(0);
						response.addCookie(delCookie);

						// cookies[i].setMaxAge(0);
						// cookies[i] = null;
					}
				}
				session.removeAttribute(Constants.CURRENT_USER);
				session.removeAttribute(Constants.EMAIL);
				session.removeAttribute(Constants.LOGGEDIN);

				session.invalidate();
				// to check if the user logout the cookies must be removed
			}

		} catch (Exception e) {
			errors.add("Exception", new ActionMessage(
			"website.access.exception"));
			saveErrors(request, errors);
			logger.info(e.getStackTrace());
			return mapping.findForward(Constants.WEBSITE_DOWN);
		}
		String forward = request.getParameter(Constants.FORWARD);
		if (Constants.CHANGE_PASSWORD_SUCCESS.equalsIgnoreCase(forward)) {
			request.setAttribute(Constants.DISPLAY_MSG,
					"Password change successful.Please Relogin");			
		}
		return mapping.findForward("success");
	}

}
