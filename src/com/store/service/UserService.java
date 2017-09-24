package com.store.service;

import java.util.List;

import com.store.entity.User;

public interface UserService extends BaseService<User> {

	User validateInfo(User user);

}
