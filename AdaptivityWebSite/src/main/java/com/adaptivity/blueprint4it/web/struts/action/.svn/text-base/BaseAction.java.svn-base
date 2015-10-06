package com.adaptivity.blueprint4it.web.struts.action;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

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
import org.springframework.dao.DataAccessException;

import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.dao.hibernate.Menu;
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.util.SortElementsById;
import com.adaptivity.blueprint4it.web.common.Constants;
import com.adaptivity.blueprint4it.web.struts.form.UserLoginForm;

/**
 * We are setting two values in the session 'email' & 'user' because email are
 * stored as cookies
 * 
 * @author sunila
 * 
 */
public class BaseAction extends Action {
	private static Logger logger = Logger.getLogger(BaseAction.class);

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.info("Base Action is loaded");
		// Create object of ActionMesssages
		ActionMessages errors = new ActionMessages();
		String email = null;
		try {
			com.adaptivity.blueprint4it.dao.SpringHibernateDAO springHibernateDAO = (com.adaptivity.blueprint4it.dao.SpringHibernateDAO) ServiceFinder
					.getContext(request).getBean("SpringHibernateDao");
			HttpSession currentSession = request.getSession();
			List<Menu> headerMenuList = springHibernateDAO.getHeaderMenuItems();
			// setting the values for user details using cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getMaxAge() > 0) {
						if (cookies[i] != null
								&& cookies[i].getName().equalsIgnoreCase(
										"email")) {
							// email = cookies[i].getValue();
							if (form instanceof UserLoginForm) {
								UserLoginForm userform = (UserLoginForm) form;
								if (userform.getEmail() == null
										|| userform.getEmail().equals("")) {
									userform.setEmail(cookies[i].getValue());

								}
							}
							// if the user directly access any page through new
							// browser
							// the values would be send by cookies only once and
							// if
							// he
							// enters values from the login form those would
							// overwrite
							// these values
							if (currentSession.getAttribute(Constants.EMAIL) == null) {
								currentSession.setAttribute(Constants.EMAIL,
										cookies[i].getValue());
							}
							if (currentSession
									.getAttribute(Constants.CURRENT_USER) == null) {
								Login user = springHibernateDAO
										.loadUserByEmail(cookies[i].getValue());
								currentSession.setAttribute(
										Constants.CURRENT_USER, user);
							}
						} else if (cookies[i] != null
								&& cookies[i].getName().equalsIgnoreCase(
										"password")) {
							if (form instanceof UserLoginForm) {
								UserLoginForm userform = (UserLoginForm) form;
								if (userform.getPassword() == null
										|| userform.getPassword().equals("")) {
									userform.setPassword(cookies[i].getValue());
								}
							}//UserLoginForm
						}
					}
				}
			}
			if (currentSession != null) {
				Object userEmailObj = currentSession
						.getAttribute(Constants.EMAIL);
				if (userEmailObj != null) {
					email = (String) userEmailObj;
				}
			}

			if (headerMenuList != null && email != null) {
				boolean flag = false;
				Iterator<Menu> iterator = headerMenuList.iterator();
				while (iterator.hasNext()) {
					Menu menu = iterator.next();
					if (menu.getMenuName().equalsIgnoreCase("Register Now!")) {
						iterator.remove();
						flag = true;
						break;
					}
				}
				if (flag) {
					/*
					 * 
					Menu yourAccountMenu = new Menu();
					yourAccountMenu.setId(-1L);
					yourAccountMenu.setMenuName("Your Account");
					yourAccountMenu.setUrl("");
					yourAccountMenu.setParam("");
					yourAccountMenu.setPageName("");
					yourAccountMenu.setParentId(null);
					headerMenuList.add(yourAccountMenu);
					// todo set other values.
					 * 
					 */
				}

			}
			Collections.sort(headerMenuList, new SortElementsById());
			request.setAttribute(Constants.MENU_LIST, headerMenuList);
		} catch (DataAccessException dae) {
			errors.add("Database Exception", new ActionMessage(
					"data.access.exception"));
			saveErrors(request, errors);
			logger.info(dae.getStackTrace());
			return mapping.findForward("failure");
		} catch (Exception e) {
			errors.add("Exception", new ActionMessage(
					"website.access.exception"));
			saveErrors(request, errors);
			logger.info(e.getStackTrace());
			return mapping.findForward(Constants.WEBSITE_DOWN);
		}
		return executeAction(mapping, form, request, response);
	}

	public ActionForward executeAction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return null;
	}
}
