package com.yywl.projectT.dmo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="room_member")
public class RoomMemberDmo implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name="room")
	private RoomDmo room;
	@ManyToOne
	@JoinColumn(name="member")
	private UserDmo member;
	
	private String nickname;
	
	/**
	 * 请求没有迟到
	 */
	private boolean requestNotLate;
	
	public boolean isRequestNotLate() {
		return requestNotLate;
	}

	public void setRequestNotLate(boolean requestNotLate) {
		this.requestNotLate = requestNotLate;
	}

	/**
	 * 是否出席
	 */
	private boolean isAttend;
	
	/**
	 * 是否签到过
	 */
	private boolean isSigned;
	
	public boolean isSigned() {
		return isSigned;
	}

	public void setSigned(boolean isSigned) {
		this.isSigned = isSigned;
	}

	public boolean isAttend() {
		return isAttend;
	}

	public void setAttend(boolean isAttend) {
		this.isAttend = isAttend;
	}



	@ManyToOne
	@JoinColumn(name="game")
	private GameDmo game;

	private int result=0;
	
	private int point=0;
	
	private boolean ready;
	
	private double longitude=0;
	
	private double latitude=0;
	/**
	 * 请求未迟到是否处理
	 */
	private boolean isDeal;
	
	public boolean isDeal() {
		return isDeal;
	}

	public void setDeal(boolean isDeal) {
		this.isDeal = isDeal;
	}

	/**
	 * 是否已评价过
	 */
	private boolean isEvaluated=false;
	
	public boolean isEvaluated() {
		return isEvaluated;
	}

	public void setEvaluated(boolean isEvaluated) {
		this.isEvaluated = isEvaluated;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public RoomMemberDmo() {
		super();
	}

	public GameDmo getGame() {
		return game;
	}

	public Long getId() {
		return id;
	}
	
	public UserDmo getMember() {
		return member;
	}

	public String getNickname() {
		return nickname;
	}
	public Integer getPoint() {
		return point;
	}
	public Boolean getReady() {
		return ready;
	}
	public Integer getResult() {
		return result;
	}
	
	public RoomDmo getRoom() {
		return this.room;
	}
	public void setGame(GameDmo game) {
		this.game = game;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setMember(UserDmo member) {
		this.member = member;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public void setReady(Boolean ready) {
		this.ready = ready;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	
	public void setRoom(RoomDmo room) {
		this.room = room;
	}
	
	

}
