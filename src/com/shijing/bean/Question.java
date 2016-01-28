package com.shijing.bean;

/**
 * Question entity. @author MyEclipse Persistence Tools
 */

public class Question implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer questionId;
	private String questionTitle;
	private String questionA;
	private String questionB;
	private String questionC;
	private String questionD;
	private String questionAnswer;
	private Integer teacherId;

	// Constructors

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	/** default constructor */
	public Question() {
	}

	/** minimal constructor */
	public Question(Integer questionId) {
		this.questionId = questionId;
	}

	/** full constructor */
	public Question(Integer questionId, String questionTitle, String questionA,
			String questionB, String questionC, String questionD,
			String questionAnswer) {
		this.questionId = questionId;
		this.questionTitle = questionTitle;
		this.questionA = questionA;
		this.questionB = questionB;
		this.questionC = questionC;
		this.questionD = questionD;
		this.questionAnswer = questionAnswer;
	}

	// Property accessors

	public Integer getQuestionId() {
		return this.questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public String getQuestionTitle() {
		return this.questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionA() {
		return this.questionA;
	}

	public void setQuestionA(String questionA) {
		this.questionA = questionA;
	}

	public String getQuestionB() {
		return this.questionB;
	}

	public void setQuestionB(String questionB) {
		this.questionB = questionB;
	}

	public String getQuestionC() {
		return this.questionC;
	}

	public void setQuestionC(String questionC) {
		this.questionC = questionC;
	}

	public String getQuestionD() {
		return this.questionD;
	}

	public void setQuestionD(String questionD) {
		this.questionD = questionD;
	}

	public String getQuestionAnswer() {
		return this.questionAnswer;
	}

	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer = questionAnswer;
	}

}