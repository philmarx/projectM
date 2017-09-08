package com.yywl.projectT.dao;

import java.sql.ResultSet;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.yywl.projectT.bean.Formatter;
import com.yywl.projectT.bean.Keys;
import com.yywl.projectT.bean.RandomLabels;
import com.yywl.projectT.dmo.RoomDmo;
import com.yywl.projectT.dmo.SpreadUserDmo;
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
		RoomDmo roomDmo = entityManager.find(RoomDmo.class, roomId);
		boolean isScoring = roomDmo.getGame().isScoring() && roomDmo.getMemberCount() > 2;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT rm.member,u.nickname,u.avatar_signature,u.labels,f.evaluate_point point ")
				.append(" from room_member rm ").append(" inner join user u on rm.member=u.id ")
				.append(" inner join friend_connection f on f.owner=? and f.friend=rm.member ")
				.append(" where rm.room=? and rm.member<>?  and rm.ready=1 ");
		List<UserForEvaluatingVo> vos = jdbc.query(sql.toString(), new Object[] { userId, roomId, userId },
				(ResultSet rs, int num) -> {
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
	 * 
	 * @param id
	 * @return
	 */
	public List<com.yywl.projectT.vo.HomeRoomVo.UserVo> findUserVoByRoomId(Long id) {
		String sql = "select u.id,u.avatar_signature from room_member rm inner join user u on u.id=rm.member where rm.room="
				+ id;
		List<UserVo> userVos = this.jdbc.query(sql, (ResultSet rs, int num) -> {
			UserVo userVo = new UserVo();
			userVo.setId(rs.getLong("id"));
			userVo.setAvatarSignature(rs.getString("avatar_signature"));
			return userVo;
		});
		return userVos;
	}

	public List<Map<String, Object>> findLocationList(long userId, int page, int size) {
		StringBuilder sql = new StringBuilder();
		sql.append(
				"select l.id,l.ip,l.longitude,l.latitude,l.place,l.send_time sendTime,r.name roomName, r.id roomId,");
		sql.append("distance_calc(l.longitude,l.latitude,r.longitude,r.latitude)*1000 distance ");
		sql.append("from location l LEFT JOIN room r on l.room_id=r.id ");
		sql.append("where l.user_id=" + userId + " ");
		sql.append("order by sendTime desc limit " + page * size + "," + size + " ");
		List<Map<String, Object>> list = this.jdbc.queryForList(sql.toString());
		return list;
	}

	public List<Map<String, Object>> findLocationAroundBeginTime(long userId, RoomDmo room) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT l.ip,distance_calc(l.longitude,l.latitude,?,?)*1000 distance,l.send_time sendTime,l.place ");
		sql.append(" FROM location l ");
		sql.append(" where l.user_id=? and l.send_time between ");
		sql.append(" date_add(?, interval -2 hour) and date_add(?, interval 2 hour) ");
		sql.append(" order by l.send_time desc ");
		List<Map<String, Object>> list = this.jdbc.queryForList(sql.toString(), room.getLongitude(), room.getLatitude(),
				userId, room.getBeginTime(), room.getBeginTime());
		return list;
	}

	public List<Map<String, Object>> findRecommenders(long userId) {
		StringBuilder findUserSql = new StringBuilder(), findRecommenderSql = new StringBuilder(),
				findAllRecommenderSql = new StringBuilder();
		findUserSql.append("select u.id,u.nickname,s.longitude1,s.longitude2,s.latitude1,s.latitude2 ");
		findUserSql.append(" from spread_user s inner join user u on s.user_id=u.id");
		findUserSql.append(" where u.recommender_id=? and u.is_init=1");
		findRecommenderSql.append("SELECT count(1) as total FROM  ");
		findRecommenderSql.append(" (SELECT DISTINCT user_id FROM location ");
		findRecommenderSql.append(" WHERE user_id IN (SELECT id FROM user WHERE recommender_id=? AND is_init=1) ");
		findRecommenderSql.append(" AND ((longitude BETWEEN ? AND ?) AND (latitude BETWEEN ? AND ?)) ");
		findRecommenderSql.append(" GROUP BY udid	) u");
		findAllRecommenderSql.append("SELECT count(1) from user where recommender_id=? and is_init=1");
		List<Map<String, Object>> list = this.jdbc.query(findUserSql.toString(), new Object[] { userId },
				(ResultSet rs, int num) -> {
					Map<String, Object> map = new HashMap<>();
					long id = rs.getLong("id");
					double longitude1 = rs.getDouble("longitude1");
					double longitude2 = rs.getDouble("longitude2");
					double latitude1 = rs.getDouble("latitude1");
					double latitude2 = rs.getDouble("latitude2");
					map.put("id", id);
					map.put("nickname", rs.getString("nickname"));
					map.put("longitude1", longitude1);
					map.put("longitude2", longitude2);
					map.put("latitude1", latitude1);
					map.put("latitude2", latitude2);
					// 推荐人数
					long recommendCount = jdbc.queryForObject(findRecommenderSql.toString(), Long.class, id, longitude1,
							longitude2, latitude1, latitude2);
					long allCount = this.jdbc.queryForObject(findAllRecommenderSql.toString(), Long.class, id);
					map.put("allCount", allCount);
					map.put("recommendCount", recommendCount);
					return map;
				});
		return list;
	}

	public List<Map<String, Object>> findRecommendersV2(long userId, Date beginTime, Date endTime) {
		StringBuilder findUserSql = new StringBuilder(), findRecommenderSql = new StringBuilder();
		findUserSql.append("select u.id,u.nickname,s.longitude1,s.longitude2,s.latitude1,s.latitude2 ");
		findUserSql.append(" from spread_user s inner join user u on s.user_id=u.id");
		findUserSql.append(" where u.recommender_id=? and u.is_init=1");
		List<Map<String, Date>> dateList = new LinkedList<>();
		Calendar cBegin = Calendar.getInstance(), cEnd = Calendar.getInstance();
		cBegin.setTime(beginTime);
		cEnd.setTime(endTime);
		int count = cEnd.get(Calendar.DAY_OF_YEAR) - cBegin.get(Calendar.DAY_OF_YEAR) + 1;
		for (int i = 0; i < count; ++i) {
			Map<String, Date> map = new HashMap<>();
			Calendar c1 = Calendar.getInstance(), c2 = Calendar.getInstance();
			c1.setTime(cBegin.getTime());
			c2.setTime(cBegin.getTime());
			c2.set(Calendar.HOUR_OF_DAY, 23);
			c2.set(Calendar.MINUTE, 59);
			c2.set(Calendar.SECOND, 59);
			c2.set(Calendar.MILLISECOND, 999);
			map.put("beginTime", c1.getTime());
			map.put("endTime", c2.getTime());
			dateList.add(map);
			cBegin.set(Calendar.DAY_OF_YEAR, cBegin.get(Calendar.DAY_OF_YEAR) + 1);
		}
		findRecommenderSql.append("SELECT count(1) as total FROM  ");
		findRecommenderSql.append(" (SELECT DISTINCT user_id FROM location ");
		findRecommenderSql.append(
				" WHERE user_id IN (SELECT id FROM user WHERE recommender_id=? AND is_init=1 AND (init_time between ? and ?)) ");
		findRecommenderSql.append(" AND ((longitude BETWEEN ? AND ?) AND (latitude BETWEEN ? AND ?)) ");
		findRecommenderSql.append(" GROUP BY udid	) u");

		StringBuilder findAllRecommenderSql = new StringBuilder();
		findAllRecommenderSql.append(
				"SELECT count(1) from user where recommender_id=? and is_init=1 and (init_time between ? and ?)");
		List<Map<String, Object>> list = this.jdbc.query(findUserSql.toString(), new Object[] { userId },
				(ResultSet rs, int num) -> {
					Map<String, Object> map = new HashMap<>();
					long id = rs.getLong("id");
					double longitude1 = rs.getDouble("longitude1");
					double longitude2 = rs.getDouble("longitude2");
					double latitude1 = rs.getDouble("latitude1");
					double latitude2 = rs.getDouble("latitude2");
					map.put("id", id);
					map.put("nickname", rs.getString("nickname"));
					map.put("longitude1", longitude1);
					map.put("longitude2", longitude2);
					map.put("latitude1", latitude1);
					map.put("latitude2", latitude2);
					// 推荐人数
					List<Map<String, Object>> recommendList = new LinkedList<>();
					for (Map<String, Date> d : dateList) {
						Date begin = d.get("beginTime");
						Date end = d.get("endTime");
						long allCount = jdbc.queryForObject(findAllRecommenderSql.toString(), Long.class, id, begin,
								end);
						if (allCount == 0) {
							continue;
						}
						long recommendCount = jdbc.queryForObject(findRecommenderSql.toString(), Long.class, id, begin,
								end, longitude1, longitude2, latitude1, latitude2);
						Map<String, Object> recommand = new HashMap<>();
						recommand.put("recommendCount", recommendCount);
						recommand.put("date", Formatter.dateFormatter.format(begin));
						recommand.put("allCount", allCount);
						recommendList.add(recommand);
					}
					map.put("recommendList", recommendList);
					return map;
				});
		return list;
	}

	public List<SpreadUserDmo> findSpreadUsers(int page, int size) {
		StringBuilder sql = new StringBuilder();
		sql.append("select id, user_id, longitude1, latitude1, longitude2, latitude2 from spread_user s limit ?,?");
		List<SpreadUserDmo> spreadUserDmos = this.jdbc.query(sql.toString(), new Object[] { page * size, size },
				(ResultSet rs, int num) -> {
					SpreadUserDmo dmo = new SpreadUserDmo();
					dmo.setId(rs.getLong("id"));
					dmo.setUserId(rs.getLong("user_id"));
					dmo.setLongitude1(rs.getDouble("longitude1"));
					dmo.setLatitude1(rs.getDouble("latitude1"));
					dmo.setLongitude2(rs.getDouble("longitude2"));
					dmo.setLatitude2(rs.getDouble("latitude2"));
					return dmo;
				});
		return spreadUserDmos;
	}

	public List<Map<String, Object>> findRecommendUsers(long recommendId, Date date)
			throws Exception {
		String sql1 = "select id,user_id,longitude1,longitude2,latitude1,latitude2 from spread_user where user_id="
				+ recommendId;
		List<SpreadUserDmo> spreadList = jdbc.query(sql1, (ResultSet rs, int num) -> {
			SpreadUserDmo dmo = new SpreadUserDmo();
			dmo.setId(rs.getLong("id"));
			dmo.setUserId(rs.getLong("user_id"));
			dmo.setLongitude1(rs.getDouble("longitude1"));
			dmo.setLongitude2(rs.getDouble("longitude2"));
			dmo.setLatitude1(rs.getDouble("latitude1"));
			dmo.setLatitude2(rs.getDouble("latitude2"));
			return dmo;
		});
		if (spreadList.isEmpty()) {
			throw new Exception("推荐人不是推广员");
		}
		SpreadUserDmo spreadUser = spreadList.get(0);
		StringBuilder sql2 = new StringBuilder();
		sql2.append("select u.id,u.nickname,u.phone,!ISNULL(u.wx_uid) weixinExists, ");
		sql2.append("!ISNULL(u.qq_uid) qqExists,u.real_name,u.birthday,u.account,count(l.id) loginTimes ");
		sql2.append("from user u left join location l on u.id=l.user_id and l.room_id=? ");
		sql2.append("where u.recommender_id=? and u.is_init=1 and (u.init_time BETWEEN ? and ?) ");
		sql2.append("group by u.id  ");
		Calendar end = Calendar.getInstance();
		end.setTime(date);
		end.set(Calendar.HOUR_OF_DAY, 23);
		end.set(Calendar.HOUR, 23);
		end.set(Calendar.MINUTE, 59);
		end.set(Calendar.SECOND, 59);
		end.set(Calendar.MILLISECOND, 999);
		Date startDate = date, endDate = end.getTime();
		String sql3 = "select count(1) from location l where l.user_id=? and (l.longitude between ? and ?) and (l.latitude between ? and ?)";
		String sql4="select DISTINCT udid from location where udid is not null and udid !='' and user_id=?";
		List<Map<String, Object>> list = jdbc.query(sql2.toString(),
				new Object[] { Keys.Room.loginRoomId, recommendId, startDate, endDate},
				(ResultSet rs, int num) -> {
					Map<String, Object> m = new HashMap<>();
					long id = rs.getLong("id");
					m.put("nickname", rs.getString("nickname"));// 昵称
					m.put("phone", rs.getString("phone"));// 手机
					m.put("belongCity", null);// 归属地
					m.put("weixinExists", rs.getBoolean("weixinExists"));// 是否绑定微信
					m.put("qqExists", rs.getBoolean("qqExists"));// 是否绑定QQ
					m.put("realName", rs.getString("real_name"));// 实名认证
					m.put("birthday", rs.getDate("birthday"));// 生日
					m.put("account", rs.getString("account"));// 账户
					m.put("loginTimes", rs.getInt("loginTimes"));// 登录次数
					Integer sendCount = jdbc.queryForObject(sql3, new Object[] { id, spreadUser.getLongitude1(),
							spreadUser.getLongitude2(), spreadUser.getLatitude1(), spreadUser.getLatitude2() },
							Integer.class);
					m.put("isInRange", sendCount>0);//是否在范围之内
					List<String> udids=jdbc.queryForList(sql4,String.class,id);
					if (udids.isEmpty()) {
						m.put("hasOther", false);//设备是否有其它账户
					}else {
						StringBuilder sql5Builder=new StringBuilder("");
						for (String udid : udids) {
							sql5Builder.append(",'"+udid+"'");
						}
						String sql5=sql5Builder.toString().replaceFirst(",", "");
						String sql="select count(1) from (select DISTINCT user_id from location where udid in ("+sql5+"))u;";
						int count=jdbc.queryForObject(sql, Integer.class);
						m.put("hasOther", count>1);//设备是否有其它账户
					}
					return m;
				});
		return list;
	}

}
