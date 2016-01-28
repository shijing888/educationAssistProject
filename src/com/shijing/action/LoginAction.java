package com.shijing.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shijing.service.UserManager;

public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private String username;
	private String password;
	private int userIdentify;
	
	public int getUserIdentify() {
		return userIdentify;
	}

	//利用setter方法获取前台提交的数据
	public void setUsername(String username) {
		this.username = username;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserIdentify(int userIdentify) {
		this.userIdentify = userIdentify;
	}

	private UserManager userManager;
	
	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}
	
	private static final long serialVersionUID = 1L;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		//get session,and save the username and userIdentify
		Map<String, Object> session=ActionContext.getContext().getSession();
		session.put("username", username);
		session.put("userIdentify", userIdentify);
		if(userManager.userLogin(username,password,userIdentify)){
			return "success";
		}
		   
		else 
			return "error";
		
	}
	
}
