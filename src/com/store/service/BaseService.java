package com.store.service;

import java.io.Serializable;
import java.util.List;

import com.store.util.PageInfo;

public interface BaseService<T> {

	public void saveEntity(T t);
	
	public void saveOrUpdate(T t);
	
	public void updateEntity(T t);
	
	public void delteEntity(T t);
	
	public void newEntity(T t);
	
	public void batchEntityByHql(String hql,Object...objects);
	
	public T getEntity(Serializable id);
	
	public T loadEntity(Serializable id);
	
	public List<T> findEntiyByHql(String hql,Object...objects);
	
	public List<T> findAll();
	
	//public  T validateInfo(T t); 
	
	public List<T>findByPageinfo(PageInfo pageInfo);
	
}
