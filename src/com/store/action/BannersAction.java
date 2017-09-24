package com.store.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.store.entity.Banners;
import com.store.service.BannersService;



@Controller
@Scope("prototype") 
public class BannersAction  extends BaseAction<Banners> implements SessionAware{
	private static final long serialVersionUID = 1L;
	@Resource
	private BannersService bannersService;
	
	private List<Banners>bannerList;

	private Map<String, Object> session;
	
	//主页面
	public String index()
	{
		//bannerList=bannersService.findAll();
		bannerList=bannersService.findByPageinfo(pageInfo);
		requset.setAttribute("pageBean", pageInfo.getPageBean());
		return "index";
	}
	public String add()
	{
		
		bannersService.saveEntity(model);
		return "redirectAction_to_index";
	}
	
	public String delete(){		
		
		Map<String,String[]> bannerMap =requset.getParameterMap();
		//每一个checkbox都有一个delIdArray属性
		String[] temp=bannerMap.get("delIdArray");
		
		if(temp!=null)
		{
			Integer[] bannerNum=new Integer[temp.length];
			for(int i=0;i<temp.length;i++)
			{
				bannerNum[i]=Integer.parseInt(temp[i]);
			}
			
			String hql="delete Banners where BannerId=?";
			for(int i=1;i<bannerNum.length;i++)
			{
				hql+=" or BannerId=?";
			}
			bannersService.batchEntityByHql(hql, bannerNum);
			
			return "redirectAction_to_index";
		}
		
		return "redirectAction_to_index";
		
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}

	public List<Banners> getBannerList() {
		return bannerList;
	}

	

}
