package com.store.service.impl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.store.dao.BaseDao;
import com.store.entity.Coupons;
import com.store.service.CouponsService;

@Service("couponsService")
public class CouponsServiceImpl extends BaseServiceImpl<Coupons> implements CouponsService{
	@Resource(name = "couponsDao")
	@Override
	public void setBaseDao(BaseDao<Coupons> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
}
