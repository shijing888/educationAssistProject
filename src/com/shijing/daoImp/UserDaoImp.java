package com.shijing.daoImp;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shijing.bean.College;
import com.shijing.bean.Errorset;
import com.shijing.bean.Information;
import com.shijing.bean.Question;
import com.shijing.bean.User;
import com.shijing.dao.UserBaseDao;

public class UserDaoImp implements UserBaseDao {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 用户登录
	@Override
	public boolean checkUserLogin(String username, String password,
			int userIdentify) {
		// TODO Auto-generated method stub
		Session session = getMySession();
		String queryString = "from User user where userNumber=:userName and userPassword=:password";
		Query query = session.createQuery(queryString);
		query.setParameter("userName", username);
		query.setParameter("password", password);
		List<User> list = query.list();
		if (!list.isEmpty())
			return true;
		else
			return false;
	}

	// 获取session
	public Session getMySession() throws HibernateException {
		// SessionFactory sessionFactory=null;
		// Configuration configuration=new Configuration().configure();
		// ServiceRegistryBuilder builder=new
		// ServiceRegistryBuilder().applySettings(configuration.getProperties());
		// ServiceRegistry registry=builder.buildServiceRegistry();
		// sessionFactory=configuration.buildSessionFactory(registry);
		if (sessionFactory.getCurrentSession() != null) {
			return sessionFactory.getCurrentSession();
		} else {
			return sessionFactory.openSession();
		}
	}

	// 获取热门资源
	@SuppressWarnings("unchecked")
	@Override
	public List<Information> hotResource() {
		// TODO Auto-generated method stub
		Session session = getMySession();
		String queryString = "from Information info order by yesterdayClicknum ";
		Query query = session.createQuery(queryString);
		query.setMaxResults(6);
		List<Information> list = query.list();
		return list;
	}

	// 通过选择学院与专业来筛选资源
	@Override
	public List<Information> serachResource(int collegeId, int subjectId) {
		// TODO Auto-generated method stub
		Session session = getMySession();
		String queryString = "from Information info where collegeId=:collegeId and subjectId=:subjectId order by createtime";
		Query query = session.createQuery(queryString);
		query.setParameter("collegeId", collegeId);
		query.setParameter("subjectId", subjectId);
		return query.list();
	}

	// 学院
	@Override
	public List<College> selectCollege() {
		// TODO Auto-generated method stub
		List<College> list = null;
		String queryString = "from College college";

		Session session = getMySession();
		Query query = session.createQuery(queryString);
		list = query.list();
		return list;
	}

	@Override
	public List<String> selectSubOrTeac(int select, String value) {
		// TODO Auto-generated method stub
		List<String> list = null;
		if (select == 1) {
			String queryString = " select subject.subjectName from Subject subject,College college  where subject.collegeId=college.collegeId and college.collegeName=:collegeName";
			Session session = getMySession();
			Query query = session.createQuery(queryString);
			query.setParameter("collegeName", value);
			list = query.list();
		} else {
			String queryString = "select user.userName from User user,Subject subject  where user.userIdentify=1 and user.userSubjectId=subject.subjectId and subject.subjectName=:subjectName";
			Session session = getMySession();
			Query query = session.createQuery(queryString);
			query.setParameter("subjectName", value);
			list = query.list();
		}
		return list;
	}

	@Override
	public List<Question> errorSelect(String userName, Date date) {
		// TODO Auto-generated method stub
		List<Question>list=null;
		String queryString = "select question from Errorset es,User user,Question question where user.userId=es.studentId and user.userNumber=:userNumber and es.questionId=question.questionId";
		Session session = getMySession();
		Query query = session.createQuery(queryString);
		//query.setParameter("date", date);
		query.setParameter("userNumber", userName);
		list=query.list();
		return list;
	}

	@Override
	public List<Question> checkItem(String teacherString) {
		// TODO Auto-generated method stub
		List<Question>list=null;
		String queryString="select question from Question question, User user where user.userName=:teacherString and user.userId=question.teacherId";
		Session session=getMySession();
		Query query=session.createQuery(queryString);
		query.setParameter("teacherString", teacherString);
		list=query.list();System.out.println(list);
		return list;
	}

	@Override
	public void addExamErrors(int questionId, String userNumber) {
		// TODO Auto-generated method stub
		//获取错体人Id
		Session session=getMySession();
		String queryString="select userId from User where userNumber=:userNumber";
		Query query=session.createQuery(queryString);
		query.setParameter("useNumber", userNumber);
        int userId=(Integer) query.list().get(0);	
        //获取错体人的专业Id
        queryString="select user.userSubjectId from User user,Question question where question.questionId=:questionId and question.teacherId=user.userId";
	    query=session.createQuery(queryString);
        query.setParameter("questionId", questionId);
	    int subjectId=(Integer)query.list().get(0);
	   //获取错题日期
	    int year,month,day;
	    year=Calendar.YEAR;
	    month=Calendar.MONTH;
	    day=Calendar.DAY_OF_MONTH;
	    @SuppressWarnings("deprecation")
		Date date=new Date(year, month, day);
	  
	    //将这些信息写入数据库错题集
	    Errorset errorset=new Errorset();
	    errorset.setErrorTime(date);
	    errorset.setQuestionId(questionId);
	    errorset.setStudentId(userId);
	    errorset.setSubjectId(subjectId);
	    session.save(errorset);
	}
}
