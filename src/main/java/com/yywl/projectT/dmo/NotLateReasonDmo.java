package com.yywl.projectT.dmo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name = "not_late_reason")
@Entity
public class NotLateReasonDmo implements Serializable {

	private static final long serialVersionUID = -5788601476386024460L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserDmo user;
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone="GMT+8")
	private Date createTime;
	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@ManyToOne
	@JoinColumn(name = "room_id")
	private RoomDmo room;

	private String reason;

	private String photoUrl;

	private long certifierId;//证明人id
	
	public long getCertifierId() {
		return certifierId;
	}

	public void setCertifierId(long certifierId) {
		this.certifierId = certifierId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public UserDmo getUser() {
		return user;
	}

	public void setUser(UserDmo user) {
		this.user = user;
	}

	public RoomDmo getRoom() {
		return room;
	}

	public void setRoom(RoomDmo room) {
		this.room = room;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public NotLateReasonDmo() {
		super();
	}

	public NotLateReasonDmo(Long id, UserDmo user, RoomDmo room, String reason, String photoUrl,Date createTime,long certifierId) {
		super();
		this.certifierId=certifierId;
		this.createTime=createTime;
		this.id = id;
		this.user = user;
		this.room = room;
		this.reason = reason;
		this.photoUrl = photoUrl;
	}
	
	
}
