package com.yywl.projectT.bo;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yywl.projectT.dao.PropDao;
import com.yywl.projectT.dmo.PropDmo;
import com.yywl.projectT.dmo.UserDmo;

@Service
@Transactional(rollbackOn = Throwable.class)
public class PropBoImpl implements PropBo {
	@Autowired
	PropDao propDao;

	@Override
	public PropDmo findByUser_Id(long userId) {
		PropDmo propDmo = this.propDao.findByUser_Id(userId);
		if (propDmo == null) {
			propDmo = new PropDmo(null, 1, 1, 1, new Date(System.currentTimeMillis()+1*24*60*60*1000), new UserDmo(userId));
			this.propDao.save(propDmo);
		}
		return propDmo;
	}

	@Override
	public void save(PropDmo prop) {
		this.propDao.save(prop);
	}

}
