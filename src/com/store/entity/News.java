package com.store.entity;

public class News extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private String allcontent;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAllcontent() {
		return allcontent;
	}
	public void setAllcontent(String allcontent) {
		this.allcontent = allcontent;
	}


}
