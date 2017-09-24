package com.store.action;

import java.lang.reflect.ParameterizedType;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.store.util.PageInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("unchecked")
public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>,ServletRequestAware {

	private static final long serialVersionUID = 1L;
	
	protected T model;
	protected HttpServletRequest requset;
	protected PageInfo pageInfo;
	public BaseAction() {
		try {

	        //是获得超类的泛型参数的实际类型
	        //getClass().getGenericSuperclass()返回表示此 Class 所表示的实体（类、接口、基本类型或 void）的直接超类的 Type  
			ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
			//getActualTypeArguments()[0]返回表示此类型实际类型参数的 Type 对象的数组中的第一个。
			Class<T> clazz=(Class<T>) type.getActualTypeArguments()[0];
			this.model=clazz.newInstance();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public T getModel() {
		return model;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.requset=request;
		this.pageInfo=new PageInfo(requset);
		this.pageInfo.setPageSize(10);
	}

}
