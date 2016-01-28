package com.shijing.bean;

import java.sql.Date;

/**
 * Errorset entity. @author MyEclipse Persistence Tools
 */

public class Errorset implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields

	private Integer errorId;
	private Integer studentId;
	private Integer questionId;
	private Integer subjectId;
	private Date errorTime;

	// Constructors

	/** default constructor */
	public Errorset() {
	}

	/** minimal constructor */
	public Errorset(Integer errorId) {
		this.errorId = errorId;
	}

	/** full constructor */
	public Errorset(Integer errorId, Integer studentId, Integer questionId,
			Integer subjectId, Date errorTime) {
		this.errorId = errorId;
		this.studentId = studentId;
		this.questionId = questionId;
		this.subjectId = subjectId;
		this.errorTime = errorTime;
	}

	// Property accessors

	public Integer getErrorId() {
		return this.errorId;
	}

	public void setErrorId(Integer errorId) {
		this.errorId = errorId;
	}

	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public Integer getQuestionId() {
		return this.questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Date getErrorTime() {
		return this.errorTime;
	}

	public void setErrorTime(Date errorTime) {
		this.errorTime = errorTime;
	}

}