package com.store.service;

import com.store.entity.Customer;


public interface CustomerService extends BaseService<Customer> {
	
	Customer validateInfo(Customer model);
}
