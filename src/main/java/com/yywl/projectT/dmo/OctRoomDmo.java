package com.yywl.projectT.dmo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="oct_room")
public class OctRoomDmo implements Serializable{

	private static final long serialVersionUID = 861015639908347379L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private long roomId;
	
	private boolean isReward;
	
	private int signCount;

	private Long rewardAdminId;
	
	public Long getRewardAdminId() {
		return rewardAdminId;
	}

	public void setRewardAdminId(Long rewardAdminId) {
		this.rewardAdminId = rewardAdminId;
	}

	public OctRoomDmo() {
		super();
	}

	public OctRoomDmo(Long id, long roomId, boolean isReward, int signCount) {
		super();
		this.id = id;
		this.roomId = roomId;
		this.isReward = isReward;
		this.signCount = signCount;
	}

	public Long getId() {
		return id;
	}

	public long getRoomId() {
		return roomId;
	}

	public int getSignCount() {
		return signCount;
	}

	public boolean isReward() {
		return isReward;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setReward(boolean isReward) {
		this.isReward = isReward;
	}

	public void setRoomId(long roomId) {
		this.roomId = roomId;
	}

	public void setSignCount(int signCount) {
		this.signCount = signCount;
	}
	
	

	
	

}
