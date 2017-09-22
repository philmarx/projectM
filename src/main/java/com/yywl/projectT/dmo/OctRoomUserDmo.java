package com.yywl.projectT.dmo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="oct_room_user")
public class OctRoomUserDmo implements Serializable{

	private static final long serialVersionUID = 861015639908347379L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private long roomId;
	
	private long userId;
	
	private boolean hasNoFriend;

	public OctRoomUserDmo() {
		super();
	}

	public OctRoomUserDmo(Long id, long roomId, long userId, boolean hasNoFriend) {
		super();
		this.id = id;
		this.roomId = roomId;
		this.userId = userId;
		this.hasNoFriend = hasNoFriend;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public long getRoomId() {
		return roomId;
	}

	public void setRoomId(long roomId) {
		this.roomId = roomId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public boolean isHasNoFriend() {
		return hasNoFriend;
	}

	public void setHasNoFriend(boolean hasNoFriend) {
		this.hasNoFriend = hasNoFriend;
	}
	
	
}
