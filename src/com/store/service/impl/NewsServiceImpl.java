package com.store.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dao.BaseDao;
import com.store.entity.Banners;
import com.store.entity.Coupons;
import com.store.entity.News;
import com.store.service.BannersService;
import com.store.service.NewsService;


@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService{
	@Resource(name = "newsDao")
	@Override
	public void setBaseDao(BaseDao<News> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
}
