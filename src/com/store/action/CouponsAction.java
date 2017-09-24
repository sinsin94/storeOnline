package com.store.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.ObjectUtils.Null;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.store.entity.Coupons;
import com.store.service.CouponsService;
import com.store.service.SecondCategoryService;

@Controller
@Scope("prototype")
public class CouponsAction extends BaseAction<Coupons> implements SessionAware{

	private static final long serialVersionUID = 1L;
	@Resource
	private CouponsService couponsservice;
	private List<Coupons> couponslist;
	private Map<String, Object> session;
	
	
	
	public String index(){
		

		couponslist=couponsservice.findByPageinfo(pageInfo);
		requset.setAttribute("pageBean", pageInfo.getPageBean());
		return "index";
		
		
		
	}
	
	public String delete(){
		Map<String, String[]> couponsMap =requset.getParameterMap();
		String[] temp=couponsMap.get("delIdArray");
		if(temp!=null)
		{
			Integer[] couponNum=new Integer[temp.length];
			
			for(int i=0;i<temp.length;i++)
			{
				couponNum[i]=Integer.parseInt(temp[i]);
			}
			String hql="delete Coupons where couponId=?";
			for(int i=1;i<couponNum.length;i++)
			{
				hql+=" or couponId=?";
			}
			
			couponsservice.batchEntityByHql(hql, couponNum);
		}
		return "redirectAction_to_index";		
	}
	
	public String add(){
		
		couponsservice.saveEntity(model);
		return "redirectAction_to_index";		
	}
	
	
	public String update()
	{
		if(model.getCouponsName()==null){
			//jsp页面<a>标签设置id属性
			model=couponsservice.getEntity(model.getCouponId());
			
			
			return "update";
		}else {
		
			
			
			couponsservice.saveOrUpdate(model);
			return "redirectAction_to_index";
		}
	
		
		
	}
	

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		
		this.session=session;
		
	}
	public List<Coupons> getCouponslist() {
		return couponslist;
	}
	public void setCouponslist(List<Coupons> couponslist) {
		this.couponslist = couponslist;
	}
	

}
