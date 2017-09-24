package com.store.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class UserLoginInterceptor extends MethodFilterInterceptor  {


	private static final long serialVersionUID = 1L;
	@Override
	protected String doIntercept(ActionInvocation invoker) throws Exception {
		
		Object user = ActionContext.getContext().getSession().get("user");  
        if(null == user){  
        	
            return "admin";  // ���ﷵ���û���¼ҳ����ͼ  
        }  
        return invoker.invoke();  
		
	}


}
