package com.store.listener;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.util.DigestUtils;

import com.store.entity.User;
import com.store.service.UserService;
import com.store.util.ValidateUtils;

@SuppressWarnings("rawtypes")
@Component//必须要加注解 
public class InitDataListener implements ApplicationListener {

	@Resource 
	private UserService userService;
	
	
	
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if(event instanceof ContextRefreshedEvent)
		{
			List<User> users=userService.findEntiyByHql("from User where userName=?", "admin");
			if(!ValidateUtils.isValidate(users))
			{
				User user=new User();
				user.setUserName("admin");
				user.setRealName("admin");
				user.setPassword(DigestUtils.md5DigestAsHex("admin".getBytes()));
				userService.saveEntity(user);
			}
			
			
		}
		
		
	}

}
