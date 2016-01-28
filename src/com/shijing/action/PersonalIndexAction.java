package com.shijing.action;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shijing.bean.College;
import com.shijing.bean.Information;
import com.shijing.bean.Question;
import com.shijing.service.UserManager;

public class PersonalIndexAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 用户身份
	private int userIdentify;
	// 定义response对象
	private HttpServletResponse response;
	// 保存资源的list
	private List<Information> resource;
	// 保存学院、专业和老师
	private List<College> college;
	private List<String> subjectOrTeacher;
	// 读取js传来的flag值与value值
	private int flag;
	private String value;
	// 获取js传来的pageNum和date
	private Date date;

	public void setDate(Date date) {
		this.date = date;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getFlag() {
		return flag;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public List<College> getCollege() {
		return college;
	}

	public List<Information> getResource() {
		return resource;
	}

	public int getUserIdentify() {
		return userIdentify;
	}

	// user number
	private String userNumber;

	public String getUserNumber() {
		return userNumber;
	}

	private UserManager userManager;

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		userNumber = (String) ActionContext.getContext().getSession()
				.get("username");
		userIdentify = (Integer) ActionContext.getContext().getSession()
				.get("userIdentify");
		resource = userManager.getHotResource();
		college = userManager.getCollege();
		return "success";
	}

	// 专业与教师联动显示
	public void getST() throws IOException {System.out.println(flag);
		subjectOrTeacher = userManager.getSubOrTeac(flag, value);
		response = (HttpServletResponse) ActionContext.getContext().get(
				org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		// request.setAttribute("subjectOrTeacher", subjectOrTeacher);
		JSONArray jsonArray = JSONArray.fromObject(subjectOrTeacher);
		response.setHeader("content-type", "text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
	}

	// 筛选的搜索内容
	public String searchContent(int collegeId, int subjectId) {

		return userNumber;

	}

	// 检索错题
    public void getError() throws IOException{
    	List<Question> list = userManager.getErrorSelect(userNumber, date);
		response = (HttpServletResponse) ActionContext.getContext().get(
				org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		JSONArray jsonArray = JSONArray.fromObject(list);
		response.setHeader("content-type", "text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
    };
    
    //自我检测
    public String selfCheck() throws IOException{
    	college = userManager.getCollege();
    	return "success";
    }
    
    //根据选择搜索出自我检测的题目
    public void getItem() throws IOException{
    	HttpServletRequest request=ServletActionContext.getRequest();
    	String teacherString=request.getParameter("teacher");
    	List<Question> list = userManager.getCheckItem(teacherString);
    	response = (HttpServletResponse) ActionContext.getContext().get(
				org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		JSONArray jsonArray = JSONArray.fromObject(list);
		response.setHeader("content-type", "text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
    }
    
    //将测试的错题添加到错题集中的
    public void addError(){
    	HttpServletRequest request=ServletActionContext.getRequest();
    	int questionId=Integer.parseInt(request.getParameter("questionId"));
    	userManager.addErrorSet(questionId,userNumber);
    	
    }
}
