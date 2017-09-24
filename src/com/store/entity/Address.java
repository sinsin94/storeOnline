package com.store.entity;

public class Address extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int addressId;
	private String province ;
	private String city ;
	private String area ;
	//所属消费者（外键）
	private int custoId;
	private String receiver;
	private String contactUserPhone;
	private int states;
	//private int contactPhone;
	
	private String detailAddress;

	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getCustoId() {
		return custoId;
	}
	public void setCustoId(int custoId) {
		this.custoId = custoId;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getContactUserPhone() {
		return contactUserPhone;
	}
	public void setContactUserPhone(String contactUserPhone) {
		this.contactUserPhone = contactUserPhone;
	}
	public int getStates() {
		return states;
	}
	public void setStates(int states) {
		this.states = states;
	}
	
	



}
