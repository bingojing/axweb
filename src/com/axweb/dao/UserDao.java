package com.axweb.dao;

import com.axweb.bean.User;

public interface UserDao {
	public User getUserById(Integer id);
	public int getusernum(Integer id);
	public int addUser(User user);
}
