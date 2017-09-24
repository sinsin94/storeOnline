package com.store.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.sql.Delete;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;

import com.store.entity.Customer;
import com.store.entity.User;
import com.store.service.UserService;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> implements SessionAware {

	private static final long serialVersionUID = 1L;
	private List<User>users;
	
	@Resource
	private UserService userService;

	private Map<String, Object> session;


	public String logout(){
		
		
		
		
		User user=(User) session.get("user");
		if(user!=null)
		{
			ServletContext application=requset.getServletContext();
			application.removeAttribute(user.getUserName());
			session.remove("user");
		}
		return "input";
	}
	
	public void validateLogin() {
		System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
		User user = userService.validateInfo(model);
		if(user!=null){
			session.put("user", user);
		}else{
			addActionError("用户名或密码错误");
		}
	}

	//前台struts标签显示user需要调用此方法
	public List<User> getUsers() {
		return users;
	}

	public String manager()
	{
		users=userService.findAll();
		return "manager";
	}
	
	public String add()
	{
		return "add";
	}
	public String doAdd()
	{
		model.setPassword(DigestUtils.md5DigestAsHex(model.getPassword().getBytes()));
		userService.saveEntity(model);
		
		return "redirectAction_to_manager";
	}
	public String delete()
	{
		if(model!=null && model.getId()>0)
		{
			
			
			User user= (User) session.get("user");
			if(user.getId()==model.getId())
			{
				session.remove("user");
			}
		
			userService.delteEntity(model);
			
			
		}
		return "redirectAction_to_manager";
	}

	public String edit()
	{
		this.model=userService.getEntity(model.getId());
		return "edit";
	}
	public String update()
	{
		
		String ischange=requset.getParameter("ischange");
		if(ischange!=null)
		{
			if(ischange.equals(model.getPassword()))
			{
				userService.saveOrUpdate(model);
			}
			else
			{
				model.setPassword(DigestUtils.md5DigestAsHex(model.getPassword().getBytes()));
				userService.saveOrUpdate(model);
			}
		}
		return "redirectAction_to_manager";
	}

	
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	

}
