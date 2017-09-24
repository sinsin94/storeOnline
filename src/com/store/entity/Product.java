package com.store.entity;

import java.util.Date;
import java.util.Set;



public class Product extends BaseEntity{

	private static final long serialVersionUID = 1L;
	//����ʱ��
	private  Date joinTime;
	private int  ProductId;//��ƷID
	private String  PictureOne;//��ƷͼƬ1
	private String  PictureTwo;
	private String  PictureThree;
	private String  PictureFour;
	private String  PictureFive;
	private String  Picturebig;
	private String  publisher;     //������
	private String  author;//����
	private String  details;//��Ʒ����
	private int  inventory;     //��Ʒ���
	private String  productName;       //��Ʒ����
	private String  productNum; //��Ʒ����
	private int productUsed ; //��������
	private double  currentPrice;  //��ǰ�ļ�Ǯ
	private double  marketPrice;  //��ǰ�ļ�Ǯ
	private int commentNumer; //��������
	private int points;
	private String  productStatus;//��Ʒ�ɷ���Ա����򣬿�����0	
	private String secondCategoryId;//��������ID
	private Set<Comment> comments;//���۹��ܣ���Ʒ��������һ�Զ�Ĺ�ϵ
	//�ǳ־û�����
	private String secondCateName;//������������
	
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
