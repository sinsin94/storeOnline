package com.store.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dao.BaseDao;
import com.store.entity.Category;
import com.store.service.CategoryService;


@Service("categoryService")
public class CategoryServiceImpl extends BaseServiceImpl<Category> implements CategoryService{

	@Resource(name = "categoryDao")
	@Override
	public void setBaseDao(BaseDao<Category> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}

	
}
