package com.store.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dao.BaseDao;
import com.store.entity.Address;
import com.store.entity.Banners;
import com.store.service.AddressService;


@Service("addressService")
public class AddressServiceImpl extends BaseServiceImpl<Address> implements AddressService{
	@Resource(name = "addressDao")
	@Override
	public void setBaseDao(BaseDao<Address> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
}
