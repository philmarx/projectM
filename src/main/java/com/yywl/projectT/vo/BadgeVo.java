package com.yywl.projectT.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BadgeVo {
	private Long id;
	private UserVo user;
	private String description;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm",timezone = "GMT+8")
	private Date createTime;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public UserVo getUser() {
		return user;
	}
	public void setUser(UserVo user) {
		this.user = user;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public BadgeVo() {
		super();
	}
	public BadgeVo(Long id, UserVo user, String description, Date createTime) {
		super();
		this.id = id;
		this.user = user;
		this.description = description;
		this.createTime = createTime;
	}
	
}
