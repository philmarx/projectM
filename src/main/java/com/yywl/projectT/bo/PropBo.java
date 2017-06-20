package com.yywl.projectT.bo;

import com.yywl.projectT.dmo.PropDmo;

public interface PropBo {

	PropDmo findByUser_Id(long userId);

	void save(PropDmo prop);

}
