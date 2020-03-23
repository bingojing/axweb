package com.axweb.dao;

import java.util.Collection;

import com.axweb.bean.Video;

public interface VideoDao {
	public int addvideo(Video video); 
	public Collection<Video> getvideobytag(int tag);
	public Collection<Video> getvideorandom(int tag);
	public Collection<Video> getvideoorder(int tag);
}
