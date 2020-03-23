package com.axweb.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axweb.bean.Tags;
import com.axweb.dao.TagsDao;

@Service
public class TagService {
	@Autowired
	TagsDao tagdao;
	
	public Collection<Tags>getalltags(){
		return tagdao.getalltag();
	}
}
