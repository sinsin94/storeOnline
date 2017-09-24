package com.store.entity;


import java.util.Date;
import java.util.Set;



public class SecondCategory extends BaseEntity {


	private static final long serialVersionUID = 1L;
	
	private int id;
	private String secondCategoryName;
	//����ʱ��
	private  Date createTime;
	
	//����һ�����ࣨ�����
	private String firstCategoryId;
	
	//���������������Ʒ�ĵ�һ�Զ��ϵ
	private Set<Product>products;

	//�ǳ־û�����,��action�н���ת��
	private String firstCategoryName;
	
	public SecondCategory(){
		super();
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSecondCategoryName() {
		return secondCategoryName;
	}

	public void setSecondCategoryName(String secondCategoryName) {
		this.secondCategoryName = secondCategoryName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}



/*	public Set<Product> getProducts() {
		return products;
	}

	public void setProdects(Set<Product> products) {
		this.products = products;
	}*/
	public Set<Product> getProducts() {
		return products;
	}


	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public String getFirstCategoryName() {
		return firstCategoryName;
	}

	public void setFirstCategoryName(String firstCategoryName) {
		this.firstCategoryName = firstCategoryName;
	}


	public String getFirstCategoryId() {
		return firstCategoryId;
	}


	public void setFirstCategoryId(String firstCategoryId) {
		this.firstCategoryId = firstCategoryId;
	}



}
