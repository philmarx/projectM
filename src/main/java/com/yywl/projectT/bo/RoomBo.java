package com.yywl.projectT.bo;

import com.yywl.projectT.dmo.RoomDmo;

public interface RoomBo {
	

	/**
	 * 查找房间
	 * 
	 */
	RoomDmo findOne(Long id);
	

}
