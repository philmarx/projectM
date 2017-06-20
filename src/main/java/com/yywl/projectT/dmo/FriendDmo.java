package com.yywl.projectT.dmo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "friend_connection")
public class FriendDmo implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "owner")
	@JsonIgnore
	private UserDmo owner;
	@ManyToOne
	@JoinColumn(name = "friend")
	private UserDmo friend;
	
	private int evaluatePoint=0;
	
	private int evaluatedPoint=0;
	
	
	public int getEvaluatePoint() {
		return evaluatePoint;
	}

	public void setEvaluatePoint(int evaluatePoint) {
		this.evaluatePoint = evaluatePoint;
	}

	public int getEvaluatedPoint() {
		return evaluatedPoint;
	}

	public void setEvaluatedPoint(int evaluatedPoint) {
		this.evaluatedPoint = evaluatedPoint;
	}

	private Double point = 0.0;

	public FriendDmo() {
		super();
	}

	public UserDmo getFriend() {
		return friend;
	}

	public Long getId() {
		return id;
	}


	public UserDmo getOwner() {
		return owner;
	}

	public Double getPoint() {
		return point;
	}

	public void setFriend(UserDmo friend) {
		this.friend = friend;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setOwner(UserDmo owner) {
		this.owner = owner;
	}

	public void setPoint(Double point) {
		this.point = point;
	}

}
