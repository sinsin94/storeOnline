package com.store.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.sql.Delete;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;

import com.store.entity.Customer;
import com.store.entity.User;
import com.store.service.CustomerService;
import com.store.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport implements  SessionAware ,ParameterAware ,ServletRequestAware{

	private static final long serialVersionUID = 1L;
	
	String resInput;
	@Resource
	private CustomerService customerService;

	@Resource
	private UserService userService;

	protected HttpServletRequest requset;
	private Map<String, Object> session;
	
	private Map<String, String[]> param;

	public String admin(){
		return "redirectAction_to_manager";
	}
	
	public String customer(){
		return "redirectAction_to_index";
	}
	
	public void validateAdmin() {
		
		User user=new User();
		user.setUserName(param.get("userName")[0]);
		user.setPassword(param.get("password")[0]);
	    user = userService.validateInfo(user);
		if(user!=null){
			ServletContext application=requset.getServletContext();//ServletContext是被当前Web应用的所有servlet共享的，相当于JSP里的Application对象,对应一个web对象只有一个
		    HttpSession userSession=(HttpSession) application.getAttribute(user.getUserName());
			if(userSession!=null)
			{
				application.removeAttribute(user.getUserName()); //移除seesion
				userSession.removeAttribute("user"); //清除对应session数据
			}
			//设置新session
			session.put("user", user);
			
			application.setAttribute(user.getUserName(),requset.getSession());		
		}else{
			addActionError("用户名或密码错误了哟");
			setResInput("login");
		}
	}
	
public void validateCustomer() {
		
		Customer customer=new Customer();		
		customer.setName(param.get("name")[0]);		
		customer.setPwd(param.get("pwd")[0]);
		customer=customerService.validateInfo(customer);
		
		if(customer!=null){
			ServletContext application=requset.getServletContext();
		    HttpSession customerSession=(HttpSession) application.getAttribute(customer.getName());
			if(customerSession!=null)
			{				
				application.removeAttribute(customer.getName()); //移除seesion
				customerSession.removeAttribute("customer"); //清除对应session数据
			}
			//设置新session
			session.put("customer", customer);
			
			application.setAttribute(customer.getName(),requset.getSession());
				
			
			
		}else{
			
			addActionError("用户名或密码错误");
			setResInput("index");
		}
	}


	/*public String customer(){
		
		

	   
		String name = requset.getParameter("name");
		String  pwd = requset.getParameter("pwd");
		//String action = requset.getParameter("action");
		
		
		Customer customer=new Customer();		
		customer.setName(name);		
		customer.setPwd(pwd);

		System.out.println("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"+name);
		System.out.println("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"+pwd);
		customer=customerService.validateInfo(customer);
		System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"+customer);
		if(customer!=null){

			ServletContext application=requset.getServletContext();
		    HttpSession customerSession=(HttpSession) application.getAttribute(customer.getName());
			if(customerSession!=null)
			{
				
				application.removeAttribute(customer.getName()); //移除seesion
				customerSession.removeAttribute("customer"); //清除对应session数据

			}
			//设置新session
			session.put("customer", customer);			
			application.setAttribute(customer.getName(),requset.getSession());	
			
		}else{
			
			return "home";
		}
		return "register";
	}*/
	
	
	


	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public void setParameters(Map<String, String[]> arg0) {
		// TODO Auto-generated method stub
		this.param=arg0;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		
		this.requset=arg0;
	}
	public String getResInput() {
		return resInput;
	}
	public void setResInput(String resInput) {
		this.resInput = resInput;
	}



	

}
