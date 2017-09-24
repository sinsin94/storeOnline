package com.store.entity;


import java.util.Date;
import java.util.Set;



public class SecondCategory extends BaseEntity {


	private static final long serialVersionUID = 1L;
	
	private int id;
	private String secondCategoryName;
	//创建时间
	private  Date createTime;
	
	//所属一级分类（外键）
	private String firstCategoryId;
	
	//构建二级分类与产品的的一对多关系
	private Set<Product>products;

	//非持久化数据,在action中进行转化
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
