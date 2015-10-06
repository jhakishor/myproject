package com.adaptivity.blueprint4it.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.dao.hibernate.LoginDownloads;
import com.adaptivity.blueprint4it.dao.hibernate.Menu;

/**
 * @author Pawan Gupta
 * 
 */
public interface SpringHibernateDAO {

	/**
	 * Retrieve all <code>true</code>/<code>false</code> from the datastore.
	 * 
	 * @return a <code>true</code> or <code>fasel</code>.
	 */
	public boolean checkUserLogin(String strEmail, String strPassword)
			throws DataAccessException, java.sql.SQLException;

	/**
	 * Saves Article object to the datastore.
	 * 
	 */
	public void addUser(com.adaptivity.blueprint4it.dao.hibernate.Login obj)
			throws DataAccessException;

	/**
	 * Update Article object ot the datastore.
	 * 
	 */
	public void updateUser(com.adaptivity.blueprint4it.dao.hibernate.Login obj)
			throws DataAccessException;

	/**
	 * Retrieve <code>Article</code> from the datastore.
	 * 
	 * @return Article.
	 */
	public com.adaptivity.blueprint4it.dao.hibernate.Login loadUser(String id)
			throws DataAccessException;

	/**
	 * Retrieve all <code>true</code>/<code>false</code> from the datastore.
	 * 
	 * @return a <code>true</code> or <code>fasel</code>.
	 */
	public boolean checkValidEmail(String strEmail) throws DataAccessException,
			java.sql.SQLException;

	/**
	 * Retrieve all <code>true</code>/<code>false</code> from the datastore.
	 * 
	 * @return a <code>true</code> or <code>false</code>.
	 */
	public boolean validateEmailDomain(String strEmail)
			throws DataAccessException, java.sql.SQLException;

	/**
	 * Retrieve <code>Article</code> from the datastore.
	 * 
	 * @return Article.
	 */
	public Login loadUserByEmail(String emailId) throws DataAccessException;

	/**
	 * 
	 * @param id
	 * @return
	 * @throws DataAccessException
	 */
	public List<Menu> getHeaderMenuItems() throws DataAccessException;

	/**
	 * Toa activate the user account on click of link in email
	 * 
	 * @param Login
	 *            user
	 * @return Login
	 * @throws DataAccessException
	 */
	public Login activateUser(Login user) throws DataAccessException;
	/**
	 * Logs the detials of user and file downloaded by the user in table
	 * Login_Downloads
	 * @param loginDownloads
	 * @throws DataAccessException
	 */
	public void saveDownloadDetails(LoginDownloads loginDownloads) throws DataAccessException;
	
}
