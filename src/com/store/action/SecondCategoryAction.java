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
	//不能与其他action中定义的属性名同名
	private List<SecondCategory>secondcategory;
	private List<Category>category;
	private List<Product>products;
	
	
	public String index()
	{
		
		//进行分页处理
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
				//设置了一级分类的ID，即可以在主页做ID和名字的装换
				model.setFirstCategoryId(categoryId);
			}
			secondCategoryService.saveEntity(model);
			return "redirectAction_to_index";
		}
	}
	
	
	
	/*
	 * 删除二级分类
	 * 修改属于该二级的产品的外键为空
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
			//jsp页面<a>标签设置id属性
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
