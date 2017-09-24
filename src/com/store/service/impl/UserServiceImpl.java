package com.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.store.dao.BaseDao;
import com.store.entity.User;
import com.store.service.UserService;
import com.store.util.ValidateUtils;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	@Resource(name = "userDao")
	@Override
	public void setBaseDao(BaseDao<User> baseDao) {
		super.setBaseDao(baseDao);
	}

	
	public User validateInfo(User user) {
		String hql = "from User where userName=? and password=?";
		String password = user.getPassword();
		password = DigestUtils.md5DigestAsHex(password.getBytes());
		
		List<User> users = this.findEntiyByHql(hql, user.getUserName(), password);
		
		return ValidateUtils.isValidate(users) ? users.get(0) : null;
	}


}
