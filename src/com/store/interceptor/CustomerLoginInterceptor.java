package com.store.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class CustomerLoginInterceptor extends MethodFilterInterceptor  {


	private static final long serialVersionUID = 1L;
	

	@Override
	protected String doIntercept(ActionInvocation invoker) throws Exception {
		
		Object customer = ActionContext.getContext().getSession().get("customer");  
        if(null == customer){  
        	
        	
            return "customer";  // 这里返回用户登录页面视图  
        }  
        return invoker.invoke();  
		
	}


}
