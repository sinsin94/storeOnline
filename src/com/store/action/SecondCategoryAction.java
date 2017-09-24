package com.store.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;


import com.store.entity.Category;
import com.store.entity.Product;
import com.store.entity.SecondCategory;
import com.store.service.CategoryService;
import com.store.service.ProductService;
import com.store.service.SecondCategoryService;

public class SecondCategoryAction extends BaseAction<SecondCategory> implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	@Resource
	private SecondCategoryService secondCategoryService;
	@Resource
	private ProductService productservice;
	@Resource
	private CategoryService categoryService;
	//����������action�ж����������ͬ��
	private List<SecondCategory>secondcategory;
	private List<Category>category;
	private List<Product>products;
	
	
	public String index()
	{
		
		//���з�ҳ����
		secondcategory=secondCategoryService.findByPageinfo(pageInfo);
		requset.setAttribute("pageBean", pageInfo.getPageBean());
         
		if(secondcategory!=null && !secondcategory.isEmpty())
		{
			category=categoryService.findAll();
			Map<String, String>idToName=new HashMap<String, String>();
			
			if(category!=null)
			{  
				for(Category cat:category)
				{
					idToName.put(String.valueOf(cat.getId()), cat.getCategoryName());
				}
			}
			
			for(SecondCategory scategory:secondcategory)
			{
				scategory.setFirstCategoryName(idToName.get(scategory.getFirstCategoryId()));
			}
		}
		
		
		
		return "index";
	}
	
	
	public String add()
	{
		if(model.getSecondCategoryName()==null)
		{
			category=categoryService.findAll();
			
			return "add";
		}
		else
		{
			model.setCreateTime(new Date());
			String categoryId=requset.getParameter("categoryId");
			if(categoryId!=null)
			{
				//������һ�������ID������������ҳ��ID�����ֵ�װ��
				model.setFirstCategoryId(categoryId);
			}
			secondCategoryService.saveEntity(model);
			return "redirectAction_to_index";
		}
	}
	
	
	
	/*
	 * ɾ����������
	 * �޸����ڸö����Ĳ�Ʒ�����Ϊ��
	 */
	public String delete()
	{
		Map<String,String[]> scMap =requset.getParameterMap();
		String[] temp=scMap.get("delIdArray");
			
		if(temp!=null)
		{
			Integer [] secondcategoryId=new Integer[temp.length];
			
			for(int i=0;i<temp.length;i++)
			{
				secondcategoryId[i]=Integer.parseInt(temp[i]);
			}			
			String hql_1="update Product set secondCategoryId=null where secondCategoryId=?";
			String hql_2="delete from SecondCategory where id=?";
			for(int i=1;i<secondcategoryId.length;i++)
			{
				hql_1+=" or secondCategoryId=?";
				hql_2+=" or id=?";
			}
			productservice.batchEntityByHql(hql_1, temp);
			
			secondCategoryService.batchEntityByHql(hql_2, secondcategoryId);
		}
		return "redirectAction_to_index";
	}
	
	
	public String update()
	{
		if(model.getSecondCategoryName()==null){
			//jspҳ��<a>��ǩ����id����
			model=secondCategoryService.getEntity(model.getId());
			category=categoryService.findAll();
			
			return "update";
		}else {
			String categoryId=requset.getParameter("firstCategoryId");
			if(categoryId!=null)
			{
				model.setFirstCategoryId(categoryId);
				
				
			}
			Date date=secondCategoryService.getEntity(model.getId()).getCreateTime();
			if(date!=null)
			{
				model.setCreateTime(date);
			}
			else
			{
				model.setCreateTime(new Date());
			}
			
			secondCategoryService.saveOrUpdate(model);
			return "redirectAction_to_index";
		}
	
		
		
	}
	

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
		
	}
	public List<SecondCategory> getSecondcategory() {
		return secondcategory;
	}
	public List<Category> getCategory() {
		return category;
	}
	public List<Product> getProducts() {
		return products;
	}

	

}
