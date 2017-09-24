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

	        //�ǻ�ó���ķ��Ͳ�����ʵ������
	        //getClass().getGenericSuperclass()���ر�ʾ�� Class ����ʾ��ʵ�壨�ࡢ�ӿڡ��������ͻ� void����ֱ�ӳ���� Type  
			ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
			//getActualTypeArguments()[0]���ر�ʾ������ʵ�����Ͳ����� Type ����������еĵ�һ����
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
