package com.adaptivity.blueprint4it.services;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class ServiceFinder {
	private static ApplicationContext ctx = null;
	private static Logger logger = Logger.getLogger(ServiceFinder.class);

	public static Object getBean(ServletRequest request, String beanName) {
		if (ctx == null) {
			if (!(request instanceof HttpServletRequest)) {
				throw new IllegalArgumentException(
						"Can only process HttpServletRequest");
			}
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			ctx = getContext(httpRequest);
		}

		Object obj = new Object();
		return obj;

	}

	/**
	 * Allows test cases to override where application context obtained from.
	 * 
	 * @param httpRequest
	 *            which can be used to find the <code>ServletContext</code>
	 * 
	 * @return the Spring application context
	 */
	public static ApplicationContext getContext(HttpServletRequest httpRequest) {
		return WebApplicationContextUtils
				.getRequiredWebApplicationContext(httpRequest.getSession()
						.getServletContext());
	}
}
