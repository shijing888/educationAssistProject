package com.shijing.service;

import java.sql.Date;
import java.util.List;

import com.shijing.bean.College;
import com.shijing.bean.Information;
import com.shijing.bean.Question;

public interface UserManager {

	//用户登录
	boolean userLogin(String username,String password,int userIdentify);
    //获取热门资源
	List<Information> getHotResource();
	//根据学院和专业筛选资源
	List<Information> getSearchResource(int collegeId,int subjectId);
	//获取学院
	List<College> getCollege();
	//获取专业及老师姓名
	List<String> getSubOrTeac(int select,String value);
	//获取错题
	List<Question> getErrorSelect(String userName,Date date);
	//获取题库题目
	List<Question> getCheckItem(String teacherString);
	//将错题放入错题集
	void addErrorSet(int questionId, String userNumber);
}
