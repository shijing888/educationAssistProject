package com.shijing.serviceImp;

import java.sql.Date;
import java.util.List;

import com.shijing.bean.College;
import com.shijing.bean.Information;
import com.shijing.bean.Question;
import com.shijing.dao.UserBaseDao;
import com.shijing.service.UserManager;

public class UserManagerImp implements UserManager {

	private UserBaseDao baseDao;
	public void setBaseDao(UserBaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean userLogin(String username,String password,int userIdentify) {
		// TODO Auto-generated method stub
		if(baseDao.checkUserLogin(username,password,userIdentify))
		    return true;
		else {
			return false;
		}
	}

	@Override
	public List<Information> getHotResource() {
		// TODO Auto-generated method stub
		return baseDao.hotResource();
	}

	@Override
	public List<Information> getSearchResource(int collegeId,int subjectId) {
		// TODO Auto-generated method stub
		return baseDao.hotResource();
	}

	@Override
	public List<College> getCollege() {
		// TODO Auto-generated method stub
		
		return baseDao.selectCollege();
	}

	@Override
	public List<String> getSubOrTeac(int select, String value) {
		// TODO Auto-generated method stub
		return baseDao.selectSubOrTeac(select, value);
	}

	@Override
	public List<Question> getErrorSelect(String userName, Date date) {
		// TODO Auto-generated method stub
		
		return baseDao.errorSelect(userName,date);
	}

	@Override
	public List<Question> getCheckItem(String teacherString) {
		// TODO Auto-generated method stub
		return baseDao.checkItem(teacherString);
	}

	@Override
	public void addErrorSet(int questionId, String userNumber) {
		// TODO Auto-generated method stub
		baseDao.addExamErrors(questionId,userNumber);
	}

	
}
