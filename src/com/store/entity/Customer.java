package com.store.entity;
import java.util.Date;
import java.util.List;
import java.util.Set;



public class Customer extends BaseEntity {
	private static final long serialVersionUID = 1L;//在反序列化是确保版本的
	
	private int customerId;//用Long可以允许为空，传入参数时判空比long方便
	
	private String name;
	
	private String pwd;
	//身份证号码
	private String cardNo;
	
	//注册时间
	private Date regTime=new Date();

	//构建消费者和订单之间的一对多关系
	private Set<Order>orders;
	
	private  String  email;
	
	private String phone;
	
	private int points;
	 
	//private  String address;
	//构建消费者和地址之间的一对多关系
	private Set<Address>address;
	//地址集合
	private List<Address>addresses;
	//构建消费者和购物车的一对多的关系
	private Set<Cart>carts;
	
	//构建消费者和收藏夹的一对多的关系
	private Set<Collection>collections;
			
	
	
	 //密保问题
	private String question;
	//密保答案
	 private String answer;


	//private byte[] image;
	
	//private Date birthday;
	

	
	public Customer() {
		super();
	}
	 
	

	public int  getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}




	public String getCardNo() {
		return cardNo;
	}


	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}


	public Date getRegTime() {
		return regTime;
	}


	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}


	public Set<Order> getOrders() {
		return orders;
	}


	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String  phone) {
		this.phone = phone;
	}




	public String getQuestion() {
		return question;
	}



	public void setQuestion(String question) {
		this.question = question;
	}


	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Set<Address> getAddress() {
		return address;
	}

	public void setAddress(Set<Address> address) {
		this.address = address;
	}	
	public void setAddresses(List<Address>addresses)
	{
		if(addresses!=null)
		{
			
			
			for(Address address:addresses)
			{
				addresses.add(address);
				
			}
		}
		
		
		
	}
	public Set<Cart> getCarts() {
		return carts;
	}
	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}



	public Set<Collection> getCollections() {
		return collections;
	}



	public void setCollections(Set<Collection> collections) {
		this.collections = collections;
	}



	public int getPoints() {
		return points;
	}



	public void setPoints(int points) {
		this.points = points;
	}




	

	
	

}
	