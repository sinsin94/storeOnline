package com.store.entity;

/*
 * 管理员表
 */
public class User extends BaseEntity {
	private static final long serialVersionUID = 1L;

	private int id;
	
	//登录名
	private String userName;
	
	//密码
	private String password;
	
	//真实名字
	private String realName;

	
	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

}
