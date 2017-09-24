package com.store.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dao.BaseDao;
import com.store.entity.Product;
import com.store.service.ProductService;
@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<Product> implements ProductService{
	
	@Resource(name = "productDao")
	@Override
	public void setBaseDao(BaseDao<Product> baseDao) {
		super.setBaseDao(baseDao);
	}

}
