package com.yywl.projectT.dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.yywl.projectT.bean.RandomLabels;
import com.yywl.projectT.dmo.RoomDmo;
import com.yywl.projectT.vo.HomeRoomVo.UserVo;
import com.yywl.projectT.vo.TempEvaluationVo;
import com.yywl.projectT.vo.UserForEvaluatingVo;

@Repository
public class JdbcDao {
	@Autowired
	JdbcTemplate jdbc;

	public List<Long> findMember_IdsByRoom_Id(Long id) {
		String sql = "select member from room_member where room=" + id;
		List<Long> ids = jdbc.query(sql, (ResultSet resultSet, int num) -> {
			return resultSet.getLong("member");
		});
		return ids;
	}

	public String findLables(long userId) {
		String sql = "select labels from user where id=" + userId;
		String labels = jdbc.queryForObject(sql, (ResultSet rs, int num) -> {
			return rs.getString("labels");
		});
		return labels;
	}

	@PersistenceContext
	EntityManager entityManager;

	public List<UserForEvaluatingVo> findFriendsToEvalute(long userId, long roomId) {
		RoomDmo roomDmo=entityManager.find(RoomDmo.class,roomId);
		boolean isScoring=roomDmo.getGame().isScoring()&&roomDmo.getMemberCount()>2;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT rm.member,u.nickname,u.avatar_signature,u.labels,f.evaluate_point point ")
				.append(" from room_member rm ")
				.append(" inner join user u on rm.member=u.id ")
				.append(" inner join friend_connection f on f.owner=? and f.friend=rm.member ")
				.append(" where rm.room=? and rm.member<>?  and rm.ready=1 ");
		List<UserForEvaluatingVo> vos = jdbc.query(sql.toString(), new Object[] { userId, roomId,userId }, (ResultSet rs, int num) -> {
			UserForEvaluatingVo userVo = new UserForEvaluatingVo(rs.getLong("member"), rs.getString("nickname"),
					rs.getString("avatar_signature"));
			userVo.setPoint(rs.getInt("point"));
			userVo.setScoring(isScoring);
			userVo.getLabels().add(RandomLabels.LABELS[new Random().nextInt(RandomLabels.LABELS.length)]);
			userVo.getLabels().add(RandomLabels.LABELS[new Random().nextInt(RandomLabels.LABELS.length)]);
			userVo.getLabels().add(RandomLabels.LABELS[new Random().nextInt(RandomLabels.LABELS.length)]);
			userVo.getLabels().add(RandomLabels.LABELS[new Random().nextInt(RandomLabels.LABELS.length)]);
			userVo.getLabels().add(RandomLabels.LABELS[new Random().nextInt(RandomLabels.LABELS.length)]);
			userVo.getLabels().add(RandomLabels.LABELS[new Random().nextInt(RandomLabels.LABELS.length)]);
			return userVo;
		});
		return vos;
	}

	public void cleanRoom() {
		String sql = "update room set state=3 where date_add(end_time, interval 6 hour)>now() and end_time<now() and state!=4";
		jdbc.execute(sql);
		sql = "update room set state=4 where date_add(end_time, interval 6 hour)<=now() and state!=4";
		jdbc.execute(sql);
	}

	public List<TempEvaluationVo> findTempEvaluationsByRoomId(Long roomId) {
		StringBuilder sql = new StringBuilder(
				"select re.other_id user_id,avg(re.point) avg_point from room_evalutation re ");
		sql.append(" where re.room_id=? group by re.other_id order by avg_point desc");
		List<TempEvaluationVo> temps = jdbc.query(sql.toString(), new Object[] { roomId }, (ResultSet rs, int num) -> {
			TempEvaluationVo vo = new TempEvaluationVo();
			vo.setUserId(rs.getLong("user_id"));
			vo.setAvgPoint(rs.getDouble("avg_point"));
			return vo;
		});
		return temps;
	}

	/**
	 * 查看圈子里经验值最高的用户
	 * 
	 * @param circleId
	 * @return
	 */
	public Long findCircleMaxExperienceUserId(long circleId) {
		String sql = "select user from user_circle where circle=" + circleId + " order by experience DESC LIMIT 0,1 ";
		Long userId = jdbc.queryForObject(sql, Long.class);
		return userId;
	}

	/**
	 * 查询用户在活动中是排名
	 * 
	 * @param userId
	 * @param gameId
	 * @return
	 */
	public long findRankingByUserIdAndGameId(long userId, int gameId) {
		String sql = "select count(1)+1 from game_score where score>(select score from game_score where user_id="
				+ userId + " and game_id=" + gameId + ") and game_id=" + gameId;
		Long ranking = jdbc.queryForObject(sql, Long.class);
		return ranking;
	}

	/**
	 * 查看除了管理员之外的成员id
	 * 
	 * @param roomId
	 * @param managerId
	 * @return
	 */
	public List<Long> findMember_IdsByRoom_IdAndMember_IdNot(Long roomId, Long managerId) {
		String sql = "select member from room_member where room=" + roomId + " and member<>" + managerId;
		List<Long> ids = jdbc.query(sql, (ResultSet resultSet, int num) -> {
			return resultSet.getLong("member");
		});
		return ids;
	}

	public void clearSignCircle() {
		String sql = "update user_circle set is_sign=0";
		jdbc.execute(sql);
	}

	/**
	 * 查看是否是vip会员
	 * 
	 * @param userId
	 * @return
	 */
	public boolean isVip(long userId) {
		String sql = "select p.vip_expire_date>now() is_vip FROM prop p where p.user_id=" + userId;
		List<Boolean> list = jdbc.query(sql, (ResultSet rs, int num) -> {
			return rs.getBoolean("is_vip");
		});
		return list.isEmpty() ? false : list.get(0);
	}

	/**
	 * 查看房间内的成员
	 * @param id
	 * @return
	 */
	public List<com.yywl.projectT.vo.HomeRoomVo.UserVo> findUserVoByRoomId(Long id) {
		String sql="select u.id,u.avatar_signature from room_member rm inner join user u on u.id=rm.member where rm.room="+id;
		List<UserVo> userVos=this.jdbc.query(sql, (ResultSet rs,int num)->{
			UserVo userVo=new UserVo();
			userVo.setId(rs.getLong("id"));
			userVo.setAvatarSignature(rs.getString("avatar_signature"));
			return userVo;
		});
		return userVos;
	}

}
