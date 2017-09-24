package com.store.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.store.entity.Address;
import com.store.entity.Category;
import com.store.entity.Coupons;
import com.store.service.AddressService;

@Controller
@Scope("prototype")
public class AddressAction extends BaseAction<Address> implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	@Resource
	private AddressService addressservice;
	private  List<Address> addressList;

	
	public String index() {
		
		addressList=addressservice.findByPageinfo(pageInfo);
		requset.setAttribute("pageBean", pageInfo.getPageBean());
		return "index";
		
	}
	
	
		

	
	
	

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	public List<Address> getAddressList() {
		return addressList;
	}


}
