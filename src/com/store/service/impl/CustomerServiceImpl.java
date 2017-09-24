package com.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.store.dao.BaseDao;
import com.store.entity.Customer;
import com.store.service.CustomerService;
import com.store.util.ValidateUtils;

@Service("customerService")
public class CustomerServiceImpl extends BaseServiceImpl<Customer>implements CustomerService {
	
	@Resource(name = "customerDao")
	@Override
	public void setBaseDao(BaseDao<Customer> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	} 

	
	public Customer validateInfo(Customer customer) {
	
		String hql = "from Customer  where name=? and pwd=?";
		String password = customer.getPwd();
		password = DigestUtils.md5DigestAsHex(password.getBytes());
		List<Customer> customers = this.findEntiyByHql(hql, customer.getName(),password);		
		return ValidateUtils.isValidate(customers) ? customers.get(0) : null;
		
	}

}
