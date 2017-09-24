package com.store.entity;

import java.util.Date;
import java.util.Set;



public class Product extends BaseEntity{

	private static final long serialVersionUID = 1L;
	//创建时间
	private  Date joinTime;
	private int  ProductId;//商品ID
	private String  PictureOne;//商品图片1
	private String  PictureTwo;
	private String  PictureThree;
	private String  PictureFour;
	private String  PictureFive;
	private String  Picturebig;
	private String  publisher;     //出版社
	private String  author;//作者
	private String  details;//商品详情
	private int  inventory;     //商品库存
	private String  productName;       //商品名字
	private String  productNum; //商品货号
	private int productUsed ; //已售数量
	private double  currentPrice;  //当前的价钱
	private double  marketPrice;  //当前的价钱
	private int commentNumer; //评论数量
	private int points;
	private String  productStatus;//商品可否可以被购买，库存大于0	
	private String secondCategoryId;//二级分类ID
	private Set<Comment> comments;//评论功能，商品与评论是一对多的关系
	//非持久化数据
	private String secondCateName;//二级分类名称
	
	public Product() {
		super();
	}
	 
	
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public String getPictureOne() {
		return PictureOne;
	}
	public void setPictureOne(String pictureOne) {
		PictureOne = pictureOne;
	}
	public String getPictureTwo() {
		return PictureTwo;
	}
	public void setPictureTwo(String pictureTwo) {
		PictureTwo = pictureTwo;
	}
	public String getPictureThree() {
		return PictureThree;
	}
	public void setPictureThree(String pictureThree) {
		PictureThree = pictureThree;
	}
	public String getPictureFour() {
		return PictureFour;
	}
	public void setPictureFour(String pictureFour) {
		PictureFour = pictureFour;
	}
	public String getPictureFive() {
		return PictureFive;
	}
	public void setPictureFive(String pictureFive) {
		PictureFive = pictureFive;
	}

	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public int getProductUsed() {
		return productUsed;
	}
	public void setProductUsed(int productUsed) {
		this.productUsed = productUsed;
	}
	public double  getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(double currentPrice) {
		this.currentPrice = currentPrice;
	}
	public double getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(double marketPrice) {
		this.marketPrice = marketPrice;
	}
	public int getCommentNumer() {
		return commentNumer;
	}
	public void setCommentNumer(int commentNumer) {
		this.commentNumer = commentNumer;
	}

	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}


	public String getSecondCategoryId() {
		return secondCategoryId;
	}


	public void setSecondCategoryId(String secondCategoryId) {
		this.secondCategoryId = secondCategoryId;
	}




	public String getPicturebig() {
		return Picturebig;
	}


	public void setPicturebig(String picturebig) {
		Picturebig = picturebig;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public int getPoints() {
		return points;
	}


	public void setPoints(int points) {
		this.points = points;
	}


	public Set<Comment> getComments() {
		return comments;
	}


	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}


	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}


	public String getSecondCateName() {
		return secondCateName;
	}


	public void setSecondCateName(String secondCateName) {
		this.secondCateName = secondCateName;
	}


	public Date getJoinTime() {
		return joinTime;
	}


	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}


	

}
