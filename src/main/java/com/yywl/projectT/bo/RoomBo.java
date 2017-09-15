package com.yywl.projectT.bo;

import com.yywl.projectT.dmo.RoomDmo;

public interface RoomBo {

	/**
	 * 查找房间
	 * 
	 */
	RoomDmo findOne(Long id);

	void delete(RoomDmo room);
	void delete(RoomDmo room,String reason);

	/**
	 * 管理员设置所有人状态为准备
	 * @param roomId
	 * @return 返回失败的人数
	 * @throws Exception 
	 */
	int readyMember(long roomId) throws Exception;
}
