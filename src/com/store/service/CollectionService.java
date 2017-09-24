package com.store.service;
import com.store.entity.Collection;


public interface CollectionService extends BaseService<Collection>{
	
	Collection validateInfo(Collection collection);
}
