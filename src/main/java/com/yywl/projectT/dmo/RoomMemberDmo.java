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
	
	/**
	 * 是否出席
	 */
	private boolean isAttend;

	/**
	 * 是否签到过
	 */
	private boolean isSigned;

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
	private int dealState=0;

	/**
	 * 是否已评价过
	 */
	private boolean isEvaluated=false;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public RoomDmo getRoom() {
		return room;
	}

	public void setRoom(RoomDmo room) {
		this.room = room;
	}

	public UserDmo getMember() {
		return member;
	}

	public void setMember(UserDmo member) {
		this.member = member;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public boolean isRequestNotLate() {
		return requestNotLate;
	}

	public void setRequestNotLate(boolean requestNotLate) {
		this.requestNotLate = requestNotLate;
	}

	public boolean isAttend() {
		return isAttend;
	}

	public void setAttend(boolean isAttend) {
		this.isAttend = isAttend;
	}

	public boolean isSigned() {
		return isSigned;
	}

	public void setSigned(boolean isSigned) {
		this.isSigned = isSigned;
	}

	public GameDmo getGame() {
		return game;
	}

	public void setGame(GameDmo game) {
		this.game = game;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public boolean isReady() {
		return ready;
	}

	public void setReady(boolean ready) {
		this.ready = ready;
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

	public int getDealState() {
		return dealState;
	}

	public void setDealState(int dealState) {
		this.dealState = dealState;
	}

	public boolean isEvaluated() {
		return isEvaluated;
	}

	public void setEvaluated(boolean isEvaluated) {
		this.isEvaluated = isEvaluated;
	}

	public RoomMemberDmo() {
		super();
	}
	
	
	

}
