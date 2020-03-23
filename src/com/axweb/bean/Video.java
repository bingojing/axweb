package com.axweb.bean;

import java.sql.Date;

public class Video {
	private String vid;
	private int uid;
	private String title;
	private String path;
	private String type;
	private Integer click;
	private String imgpath;
	private int tag;
	private Date time;
	private int collect;
	private int comment;
	private int like;
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getClick() {
		return click;
	}
	public void setClick(Integer click) {
		this.click = click;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public int getTag() {
		return tag;
	}
	public void setTag(int tag) {
		this.tag = tag;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getCollect() {
		return collect;
	}
	public void setCollect(int collect) {
		this.collect = collect;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	@Override
	public String toString() {
		return "Video [vid=" + vid + ", uid=" + uid + ", title=" + title + ", path=" + path + ", type=" + type
				+ ", click=" + click + ", imgpath=" + imgpath + ", tag=" + tag + ", time=" + time + ", collect="
				+ collect + ", comment=" + comment + ", like=" + like + "]";
	}
	public Video(String vid, int uid, String title, String path, String type, Integer click, String imgpath, int tag,
			Date time, int collect, int comment, int like) {
		super();
		this.vid = vid;
		this.uid = uid;
		this.title = title;
		this.path = path;
		this.type = type;
		this.click = click;
		this.imgpath = imgpath;
		this.tag = tag;
		this.time = time;
		this.collect = collect;
		this.comment = comment;
		this.like = like;
	}
	public Video() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
