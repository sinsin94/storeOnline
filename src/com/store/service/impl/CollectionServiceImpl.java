package com.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dao.BaseDao;
import com.store.entity.Cart;
import com.store.entity.Collection;
import com.store.service.CollectionService;
import com.store.util.ValidateUtils;

@Service("collectionService")
public class CollectionServiceImpl extends BaseServiceImpl<Collection> implements CollectionService{
	@Resource(name = "collectionDao")
	@Override
	
	public void setBaseDao(BaseDao<Collection> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
	
	public Collection validateInfo(Collection collection) {
		String hql = "from Collection where ProductId=? and customerId=?";
			
		List<Collection> collections = this.findEntiyByHql(hql, collection.getProductId(), collection.getCustomer());
		
		return ValidateUtils.isValidate(collections) ? collections.get(0) : null;
	}

}
