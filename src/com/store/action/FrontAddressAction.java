package com.store.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.concurrent.BackgroundInitializer;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.store.entity.Address;
import com.store.entity.Customer;
import com.store.service.AddressService;

@Controller
@Scope("prototype")
public class FrontAddressAction extends BaseAction<Address> implements SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	@Resource
	private AddressService addressService;
	
	private List<Address> FrontAddressList;

  	public String saveNewAddress() {
  		//获取customer的session
  		//保存地址 必须要获取到当前customer的id，是address的外键
		Customer customer=(Customer) session.get("customer");
		if(customer==null)
		{
			return "input";
		}
		else
		{
			model.setCustoId(customer.getCustomerId());
		}
  			System.out.println("hahahahhahhhhhhhhhhhhhhhhhhhhhhhhh"+model.getCustoId());
	  		addressService.saveEntity(model);
			return "myorder";
 		

 	}
  	
	public String modifyAddress()
	{

		addressService.saveOrUpdate(model);
		return "myorder";

	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	public List<Address> getFrontAddressList() {
		return FrontAddressList;
	}


}
