package com.adaptivity.blueprint4it.web.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.web.common.Constants;

public class showUserList {
	
	private static Logger logger = Logger.getLogger(showUserList.class);

	public class IndexAction extends Action {
		public ActionForward execute(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			ActionMessages errors = new ActionMessages();
			// Retrieve the DAO Reference

			try {
				com.adaptivity.blueprint4it.dao.SpringHibernateDAO springHibernateDao = (com.adaptivity.blueprint4it.dao.SpringHibernateDAO) ServiceFinder
				.getContext(request).getBean("SpringHibernateDao");

			} catch (Exception e) {
				errors.add("Exception", new ActionMessage(
				"website.access.exception"));
				saveErrors(request, errors);
				logger.info(e.getStackTrace());
				return mapping.findForward(Constants.WEBSITE_DOWN);
			}

			return mapping.findForward("success");
		}

	}

}
