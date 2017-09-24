package com.store.entity;
import java.util.Date;
import java.util.List;
import java.util.Set;



public class Customer extends BaseEntity {
	private static final long serialVersionUID = 1L;//�ڷ����л���ȷ���汾��
	
	private int customerId;//��Long��������Ϊ�գ��������ʱ�пձ�long����
	
	private String name;
	
	private String pwd;
	//���֤����
	private String cardNo;
	
	//ע��ʱ��
	private Date regTime=new Date();

	//���������ߺͶ���֮���һ�Զ��ϵ
	private Set<Order>orders;
	
	private  String  email;
	
	private String phone;
	
	private int points;
	 
	//private  String address;
	//���������ߺ͵�ַ֮���һ�Զ��ϵ
	private Set<Address>address;
	//��ַ����
	private List<Address>addresses;
	//���������ߺ͹��ﳵ��һ�Զ�Ĺ�ϵ
	private Set<Cart>carts;
	
	//���������ߺ��ղؼе�һ�Զ�Ĺ�ϵ
	private Set<Collection>collections;
			
	
	
	 //�ܱ�����
	private String question;
	//�ܱ���
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
	