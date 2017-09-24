package com.store.entity;

/*
 * ����Ա��
 */
public class User extends BaseEntity {
	private static final long serialVersionUID = 1L;

	private int id;
	
	//��¼��
	private String userName;
	
	//����
	private String password;
	
	//��ʵ����
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
