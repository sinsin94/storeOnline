package com.store.service;

import com.store.entity.Cart;
//java�ӿ���һϵ�з������������ӿ��е����з�����ʹ���󷽷����ӿ��еķ����Ķ�Ĭ��public��abstract
public interface CartService extends BaseService<Cart>{
	Cart validateInfo(Cart cart);
	
}
