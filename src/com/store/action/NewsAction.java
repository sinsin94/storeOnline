package com.store.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.store.entity.Banners;
import com.store.entity.News;
import com.store.service.BannersService;
import com.store.service.NewsService;



@Controller
@Scope("prototype") 
public class NewsAction  extends BaseAction<News> implements SessionAware{
	private static final long serialVersionUID = 1L;
	@Resource
	private NewsService newsService;
	
	private List<News>newsList;

	private Map<String, Object> session;
	
	//主页面
	public String index()
	{
		//bannerList=bannersService.findAll();
		newsList=newsService.findByPageinfo(pageInfo);
		requset.setAttribute("pageBean", pageInfo.getPageBean());
		return "index";
	}
	public String add()
	{
		newsService.saveEntity(model);
		//bannersService.saveEntity(model);
		return "redirectAction_to_index";
	}
	
	public String delete(){		
		
		Map<String,String[]> newMap =requset.getParameterMap();
		//每一个checkbox都有一个delIdArray属性
		String[] temp=newMap.get("delIdArray");
		
		if(temp!=null)
		{
			Integer[] newsNum=new Integer[temp.length];
			for(int i=0;i<temp.length;i++)
			{
				newsNum[i]=Integer.parseInt(temp[i]);
			}
			
			String hql="delete News where id=?";
			for(int i=1;i<newsNum.length;i++)
			{
				hql+=" or id=?";
			}
			newsService.batchEntityByHql(hql, newsNum);
			
			return "redirectAction_to_index";
		}
		
		return "redirectAction_to_index";
		
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	public List<News> getNewsList() {
		return newsList;
	}
	


	

}
