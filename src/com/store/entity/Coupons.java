package com.store.entity;

import java.util.Date;

public class Coupons extends BaseEntity {
	private static final long serialVersionUID = 1L;//在反序列化是确保版本的
	private int couponId;
	private String couponsName;
	private int cusId;
	private Date biginTime;
	private Date endTime;
	private double money;
	private double cusMoney;
	private int states;
	public int getCouponId() {
		return couponId;
	}
	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}
	public Date getBiginTime() {
		return biginTime;
	}
	public void setBiginTime(Date biginTime) {
		this.biginTime = biginTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public double getCusMoney() {
		return cusMoney;
	}
	public void setCusMoney(double cusMoney) {
		this.cusMoney = cusMoney;
	}
	public int getStates() {
		return states;
	}
	public void setStates(int states) {
		this.states = states;
	}
	public String getCouponsName() {
		return couponsName;
	}
	public void setCouponsName(String couponsName) {
		this.couponsName = couponsName;
	}
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	
}
