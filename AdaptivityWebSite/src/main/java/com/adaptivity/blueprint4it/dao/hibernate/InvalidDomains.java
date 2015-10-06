package com.adaptivity.blueprint4it.dao.hibernate;

import java.io.Serializable;

public class InvalidDomains implements Serializable {

	/** identifier field */
	private Integer id;
	/** persistent field **/
	private String domainName;

	/** full constructor */
	public InvalidDomains(Integer id, String domainName) {
		this.id = id;
		this.domainName = domainName;
	}

	/** default constructor */
	public InvalidDomains() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the domainName
	 */
	public String getDomainName() {
		return domainName;
	}

	/**
	 * @param domainName
	 *            the domainName to set
	 */
	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}
}
