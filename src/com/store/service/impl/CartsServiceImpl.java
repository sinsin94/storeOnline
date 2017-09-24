package com.store.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.store.dao.BaseDao;
import com.store.entity.Cart;
import com.store.entity.User;
import com.store.service.CartService;
import com.store.util.ValidateUtils;

@Service("cartService")
public class CartsServiceImpl extends BaseServiceImpl<Cart> implements CartService{
	@Resource(name = "cartDao")
	@Override
	public void setBaseDao(BaseDao<Cart> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}


	public Cart validateInfo(Cart cart) {
		String hql = "from Cart where ProductId=? and customerId=?";
		
		List<Cart> carts = this.findEntiyByHql(hql, cart.getProductId(), cart.getCustomer());
		
		return ValidateUtils.isValidate(carts) ? carts.get(0) : null;
	}


}
