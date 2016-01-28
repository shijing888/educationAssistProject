package com.shijing.bean;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userNumber;
	private String userPassword;
	private Integer userIdentify;
	private String userName;
	private Integer userSubjectId;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String userNumber, String userPassword, Integer userIdentify,
			String userName, Integer userSubjectId) {
		this.userNumber = userNumber;
		this.userPassword = userPassword;
		this.userIdentify = userIdentify;
		this.userName = userName;
		this.userSubjectId = userSubjectId;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserNumber() {
		return this.userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Integer getUserIdentify() {
		return this.userIdentify;
	}

	public void setUserIdentify(Integer userIdentify) {
		this.userIdentify = userIdentify;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserSubjectId() {
		return this.userSubjectId;
	}

	public void setUserSubjectId(Integer userSubjectId) {
		this.userSubjectId = userSubjectId;
	}

}