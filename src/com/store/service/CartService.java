package com.store.service;

import com.store.entity.Cart;
//java接口是一系列方法的声明，接口中的所有方法嗾使抽象方法，接口中的方法的都默认public和abstract
public interface CartService extends BaseService<Cart>{
	Cart validateInfo(Cart cart);
	
}
