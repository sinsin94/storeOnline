package com.store.service.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.store.dao.BaseDao;
import com.store.service.BaseService;
import com.store.util.PageInfo;

@SuppressWarnings("unchecked")
public abstract class BaseServiceImpl<T> implements BaseService<T> {
//�����಻�ܴ���ʵ������	
	private BaseDao<T> baseDao;
	
	private Class<T> clazz;
	
	public BaseServiceImpl() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		this.clazz=(Class<T>) type.getActualTypeArguments()[0];
	}

	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public void saveEntity(T t) {
		baseDao.saveEntity(t);
	}

	@Override
	public void saveOrUpdate(T t) {
		baseDao.saveOrUpdate(t);
	}

	@Override
	public void updateEntity(T t) {
		baseDao.updateEntity(t);
	}

	@Override
	public void delteEntity(T t) {
		baseDao.delteEntity(t);
	}

	@Override
	public void newEntity(T t) {
		baseDao.newEntity(t);
	}

	@Override
	public void batchEntityByHql(String hql, Object... objects) {
		baseDao.batchEntityByHql(hql, objects);
	}	

	@Override
	public T getEntity(Serializable id) {
		return baseDao.getEntity(id);
	}

	@Override
	public T loadEntity(Serializable id) {
		return baseDao.loadEntity(id);
	}

	@Override
	
	public List<T> findEntiyByHql(String hql, Object... objects) {
		return baseDao.findEntiyByHql(hql, objects);
	}

	@Override
	
	public List<T> findAll() {
		String hql="from "+this.clazz.getSimpleName();
		return baseDao.findEntiyByHql(hql);
	}
	
	@Override
	public List<T> findByPageinfo(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		String hql="from "+this.clazz.getSimpleName();
		return baseDao.findByPageInfo(hql, pageInfo);
		
	}
	
//	@Override
//	public T validateInfo(T t) {
//		
//		return null;
//	}
//	
}
