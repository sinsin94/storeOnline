package com.store.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dao.BaseDao;
import com.store.entity.Banners;
import com.store.entity.Coupons;
import com.store.service.BannersService;


@Service("bannersService")
public class BannersServiceImpl extends BaseServiceImpl<Banners> implements BannersService{
	@Resource(name = "bannersDao")
	@Override
	public void setBaseDao(BaseDao<Banners> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
}
