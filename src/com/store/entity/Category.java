package com.store.entity;

import java.util.Date;
import java.util.List;
import java.util.Set;


public class Category extends BaseEntity{
	private static final long serialVersionUID = 1L;
	private int id;	
	private String categoryName;
	private Date joinTime=new Date();
	// �������������һ�Զ�Ĺ�ϵ
	private Set<SecondCategory> secondcategory;
	
	// �������������һ�Զ�Ĺ�ϵ
	private List<SecondCategory> secondcategorys;
	
	//�ǳ־û�����
	private String secondCategoryName;
	
	public Category(){
		super();
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



	public Date getJoinTime() {
		return joinTime;
	}

	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}


	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Set<SecondCategory> getSecondcategory() {
		return secondcategory;
	}

	public void setSecondcategory(Set<SecondCategory> secondcategory) {
		this.secondcategory = secondcategory;
	}

	public String getSecondCategoryName() {
		return secondCategoryName;
	}

	public void setSecondCategoryName(String secondCategoryName) {
		this.secondCategoryName = secondCategoryName;
	}

	public List<SecondCategory> getSecondcategorys() {
		return secondcategorys;
	}

	public void setSecondcategorys(List<SecondCategory> secondcategorys) {
		this.secondcategorys = secondcategorys;
	}


	

}
