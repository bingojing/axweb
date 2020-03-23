package com.axweb.bean;

public class User {
	private int id;
	private String password;
	private String name;
	private int gender;
	private int tel;
	private String email;
	private String saying;
	private String headpic;
	private int attention;
	private int fans;
	public int getAttention() {
		return attention;
	}
	public void setAttention(int attention) {
		this.attention = attention;
	}
	public int getFans() {
		return fans;
	}
	public void setFans(int fans) {
		this.fans = fans;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSaying() {
		return saying;
	}
	public void setSaying(String saying) {
		this.saying = saying;
	}
	public String getHeadpic() {
		return headpic;
	}
	public void setHeadpic(String headpic) {
		this.headpic = headpic;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender + ", tel=" + tel
				+ ", email=" + email + ", saying=" + saying + ", headpic=" + headpic + ", attention=" + attention
				+ ", fans=" + fans + "]";
	}
	public User(int id, String password, String name, int gender, int tel, String email, String saying, String headpic,
			int attention, int fans) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.tel = tel;
		this.email = email;
		this.saying = saying;
		this.headpic = headpic;
		this.attention = attention;
		this.fans = fans;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
