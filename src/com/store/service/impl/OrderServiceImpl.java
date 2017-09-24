package com.store.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.store.dao.BaseDao;
import com.store.entity.Order;
import com.store.service.OrderService;


@Service("orderService")
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService{
	
	@Resource(name = "orderDao")
	@Override
	public void setBaseDao(BaseDao<Order> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}

	//@Override
	public Order validateInfo(Order t) {
		return null;
	}

}
