package com.axweb.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axweb.bean.Video;
import com.axweb.dao.VideoDao;

@Service
public class VideoService {
	@Autowired
	VideoDao videoDao;
	
	public int addvideo(Video video) {
		return videoDao.addvideo(video);
	}
	
	public Collection<Video> getvideobytag(int tag){
		return videoDao.getvideobytag(tag);
	}
	public Collection<Video> getvideorandombytag(int tag){
		return videoDao.getvideorandom(tag);
	}
	public Collection<Video> getvideoorderbytag(int tag){
		return videoDao.getvideoorder(tag);
	}
}
