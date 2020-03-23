package com.axweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axweb.bean.User;
import com.axweb.dao.UserDao;

@Service
public class UserService {
	@Autowired
	UserDao userdao;
	public User getUser(Integer id) {
		// TODO Auto-generated method stub
		return userdao.getUserById(id);
	}
	
	public int countUser(Integer id) {
		return userdao.getusernum(id);
	}
	
	public Boolean addUser(User user) {
		int i = userdao.getusernum(user.getId());
		if(i > 0)
			return false;
		else {
			if(user.getId()<100000||user.getName().equals(null)||user.getPassword().length()<6)
				return false;
			else {
				userdao.addUser(user);
			}
		}
		
		return true;
	}
}
