package com.shijing.dao;

import java.sql.Date;
import java.util.List;

import com.shijing.bean.College;
import com.shijing.bean.Information;
import com.shijing.bean.Question;

public interface UserBaseDao {

	//用户登录
	boolean checkUserLogin(String username,String password,int userIdentify);
    //获取热门资源
	List<Information> hotResource();
	//获取筛选资源
	List<Information> serachResource(int collegeId,int subjectId);
	//获取学院、专业及老师
	List<College> selectCollege();
	List<String> selectSubOrTeac(int select,String value);
	//获取错题
	List<Question> errorSelect(String userName,Date date);
	//获取题库题目
	List<Question> checkItem(String teacherString);
	//将错题放入错题集
	void addExamErrors(int questionId, String userNumber);
}
