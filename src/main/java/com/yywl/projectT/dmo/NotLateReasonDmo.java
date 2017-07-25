package com.yywl.projectT.dmo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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

	@ManyToOne
	@JoinColumn(name = "room_id")
	private RoomDmo room;

	private String reason;

	private String photoUrl;

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

	public NotLateReasonDmo(Long id, UserDmo user, RoomDmo room, String reason, String photoUrl) {
		super();
		this.id = id;
		this.user = user;
		this.room = room;
		this.reason = reason;
		this.photoUrl = photoUrl;
	}
	
	
}
