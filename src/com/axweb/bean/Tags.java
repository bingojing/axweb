package com.axweb.bean;

import java.util.Collection;

public class Tags {
	private Integer id;
	private String name;
	private Collection<Video> videos;
	private Collection<Video> videosorder;
	public Collection<Video> getVideosorder() {
		return videosorder;
	}
	public void setVideosorder(Collection<Video> videosorder) {
		this.videosorder = videosorder;
	}
	public Collection<Video> getVideos() {
		return videos;
	}
	public void setVideos(Collection<Video> videos) {
		this.videos = videos;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Tags [id=" + id + ", name=" + name + ", videos=" + videos + ", videosorder=" + videosorder + "]";
	}
	public Tags(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Tags() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
