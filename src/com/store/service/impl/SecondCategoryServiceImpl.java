package com.store.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dao.BaseDao;

import com.store.entity.SecondCategory;
import com.store.service.SecondCategoryService;


@Service("secondCategoryService")
public class SecondCategoryServiceImpl extends BaseServiceImpl<SecondCategory> implements SecondCategoryService{

	
	@Resource(name = "secondCategoryDao")
	@Override
	public void setBaseDao(BaseDao<SecondCategory> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}

	
}
