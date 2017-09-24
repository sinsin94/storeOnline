package com.store.entity;


public class Banners extends BaseEntity{
	private static final long serialVersionUID = 1L;
	
	private int BannerId;	
	private String  BannerOne;//…Ã∆∑Õº∆¨1
	private String link;
	public int getBannerId() {
		return BannerId;
	}
	public void setBannerId(int bannerId) {
		BannerId = bannerId;
	}
	public String getBannerOne() {
		return BannerOne;
	}
	public void setBannerOne(String bannerOne) {
		BannerOne = bannerOne;
	}
	

	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

}

