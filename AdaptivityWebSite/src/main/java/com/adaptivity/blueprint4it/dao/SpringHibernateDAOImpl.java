package com.adaptivity.blueprint4it.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.dao.hibernate.LoginDownloads;
import com.adaptivity.blueprint4it.dao.hibernate.Menu;
import com.adaptivity.blueprint4it.exception.DataAccessExceptionHandler;

/**
 * Hibernate implementation of the JobModule interface.
 * 
 * <p>
 * The mappings are defined in "login.hbm.xml", located in the root of the
 * classpath.
 */
public class SpringHibernateDAOImpl extends HibernateDaoSupport implements
		SpringHibernateDAO {
	private static Logger logger = Logger.getLogger(SpringHibernateDAOImpl.class);
	// check admin login

	@SuppressWarnings("unchecked")
	public boolean checkUserLogin(String strEmail, String strPassword)
			throws DataAccessException, java.sql.SQLException {

		boolean valid = false;
		List<Object> list = new ArrayList<Object>();
		// list = (ArrayList) getHibernateTemplate().find(
		// "from Login where email='" + strEmail + "' and password='"
		// + strPassword + "'");
		String query = "from Login where email='" + strEmail
				+ "' and password='" + strPassword + "'";
		list = load(query);
		if (null != list && list.size() > 0) {
			valid = true;
		}
		return valid;
	}// checkUserLogin

	public void addUser(com.adaptivity.blueprint4it.dao.hibernate.Login obj)
			throws DataAccessException {
		try {
			getHibernateTemplate().save(obj);
		} catch (Exception e) {
			//throw new DataAccessExceptionHandler("Duplicate Email Address");
			logger.info(e.getStackTrace());
			throw new DataAccessExceptionHandler(e.getMessage());
		}
		;
	}

	public void updateUser(com.adaptivity.blueprint4it.dao.hibernate.Login obj)
			throws DataAccessException {
		try {
			getHibernateTemplate().saveOrUpdate(obj);
		} catch (Exception e) {
			logger.info(e.getStackTrace());
			throw new DataAccessExceptionHandler(e.getMessage());
		}
		;
	}

	public com.adaptivity.blueprint4it.dao.hibernate.Login loadUser(String id)
			throws DataAccessException {
		String query = "from Login where id=" + new Integer(id) + "";
		List<Object> result = load(query);
		if (result != null && result.size() > 0) {
			return (Login) result.get(0);
		}
		return null;
		// return (com.adaptivity.blueprint4it.dao.hibernate.Login)
		// getHibernateTemplate().get(
		// Login.class, new Integer(id));
	}

	@SuppressWarnings("unchecked")
	public boolean checkValidEmail(String strEmail) throws DataAccessException,
			java.sql.SQLException {

		boolean valid = false;

		List<Object> list = new ArrayList<Object>();
		// list = (ArrayList) getHibernateTemplate().find(
		// "from Login where email='" + strEmail + "'");
		String query = "from Login where email='" + strEmail + "'";
		list = load(query);
		if (null != list && list.size() > 0) {
			valid = true;
		}
		return valid;
	}

	@SuppressWarnings("unchecked")
	public Login loadUserByEmail(String emailId) throws DataAccessException {

		// List<Object> list = new ArrayList<Object>();
		// list = getHibernateTemplate().find(
		// "from Login where email = '" + emailId + "'");
		//
		// if (list != null && list.size() > 0) {
		// return (Login) list.get(0);
		// }

		String query = "from Login where email = '" + emailId + "'";
		List<Object> result = load(query);
		if (result != null && result.size() > 0) {
			return (Login) result.get(0);
		}
		return null;
	}// loadUserByEmail

	@SuppressWarnings("unchecked")
	public List<Menu> getHeaderMenuItems() throws DataAccessException {

		// List<Menu> menuList = new ArrayList<Menu>();
		// menuList = getHibernateTemplate().find(
		// "from Menu where parentId = null");
		// return menuList;

		String query = "from Menu where parentId = null order by id";
		List result = load(query);
		if (result != null && result.size() > 0) {
			return result;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public boolean validateEmailDomain(String strEmail)
			throws DataAccessException, SQLException {

		String delim = "@";
		// 1) Split the email id with '@' and store it in array
		// 2) Check if the size of the array is more then 2 then its invalid id,
		// since this means there are more then 1 '@'
		// 3) Retrieve the domain of the email id from the collection
		// 4) Check if the domain exists in database
		// 5) If yes then return 'false' since this means the domain is not
		// allowed.
		// -- Div

		String[] arrEmail = strEmail.split(delim);
		String domain;
		if (arrEmail.length == 2) {
			domain = arrEmail[1];
			// List<InvalidDomains> list = new ArrayList<InvalidDomains>();
			// list = getHibernateTemplate().find(
			// "from InvalidDomains where domainName='" + domain + "'");
			String query = "from InvalidDomains where domainName='" + domain
					+ "'";
			List list = load(query);
			if (list == null || list.size() == 0) {
				return true;
			}// check the list size
		}// arrEmail.length < 2
		return false;
	}// validateEmailDomain

	// generic CRUD methods
	@SuppressWarnings("unchecked")
	public List<Object> load(Object queryObj) {
		HibernateTemplate hibernateTemplate = getHibernateTemplate();
		List<Object> result = null;
		try {
			if (queryObj != null) {
				String query = queryObj.toString();
				result = hibernateTemplate.find(query);
			}
		} catch (Exception e) {
			logger.info(e.getStackTrace());
			throw new DataAccessExceptionHandler(e.getMessage());
		}
		return result;

	}// load

	public Login activateUser(Login user) throws DataAccessException {
		
		String strEmail	= user.getEmail();
		String strKey	= user.getActivationKey();
		
		String query = "from Login where email = '" + strEmail + "'"
						+ " and activationKey='" + strKey + "'";
		List<Object> result = load(query);
		if (result != null && result.size() > 0) {
			return (Login) result.get(0);
		}
		return null;
	}

	public void saveDownloadDetails(LoginDownloads loginDownloads)
			throws DataAccessException {
		HibernateTemplate hibernateTemplate = getHibernateTemplate();
		hibernateTemplate.save(loginDownloads);
	}

	
}// SpringHibernateDAOImpl
