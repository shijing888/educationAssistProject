package com.shijing.bean;

import java.sql.Date;

/**
 * Information entity. @author MyEclipse Persistence Tools
 */

public class Information implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer infoId;
	private Integer teacherId;
	private String title;
	private String content;
	private Date createtime;
	private Date clicktime;
	private Integer yesterdayClicknum;
	private Integer collegeId;
	private Integer subjectId;

	// Constructors

	/** default constructor */
	public Information() {
	}

	/** full constructor */
	public Information(Integer teacherId, String title, String content,
			Date createtime, Date clicktime,
			Integer yesterdayClicknum, Integer collegeId, Integer subjectId) {
		this.teacherId = teacherId;
		this.title = title;
		this.content = content;
		this.createtime = createtime;
		this.clicktime = clicktime;
		this.yesterdayClicknum = yesterdayClicknum;
		this.collegeId = collegeId;
		this.subjectId = subjectId;
	}

	// Property accessors

	public Integer getInfoId() {
		return this.infoId;
	}

	public void setInfoId(Integer infoId) {
		this.infoId = infoId;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getClicktime() {
		return this.clicktime;
	}

	public void setClicktime(Date clicktime) {
		this.clicktime = clicktime;
	}

	public Integer getYesterdayClicknum() {
		return this.yesterdayClicknum;
	}

	public void setYesterdayClicknum(Integer yesterdayClicknum) {
		this.yesterdayClicknum = yesterdayClicknum;
	}

	public Integer getCollegeId() {
		return this.collegeId;
	}

	public void setCollegeId(Integer collegeId) {
		this.collegeId = collegeId;
	}

	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

}