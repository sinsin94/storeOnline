package com.store.action;

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

public class ProductPageInfoAction extends BaseAction<Product> implements SessionAware{

	private static final long serialVersionUID = 1L;
	
	@Resource
	private ProductService productservice;
	
	private List<Product>productPageInfolist;
	
	@Resource
	private SecondCategoryService secondcategoryServices;
	private List<SecondCategory>product_sclist;
	@Resource
	private CategoryService categoryService;
	private List<Category>product_category;
	
	private Map<String, Object> session;
	
	
	
	public String index(){
	    //分页获取所有商品
	
	     	productPageInfolist=productservice.findByPageinfo(pageInfo);
			requset.setAttribute("pageBean", pageInfo.getPageBean());
			if(productPageInfolist!=null && !productPageInfolist.isEmpty())
			{   
				//获取所有二级分类信息
				product_sclist=secondcategoryServices.findAll();
				
				Map<String, String>idToName=new HashMap<String, String>();
				
				if(product_sclist!=null)
				{
					for(SecondCategory seCategory:product_sclist)
					{
						idToName.put(String.valueOf(seCategory.getId()), seCategory.getSecondCategoryName());
					}
				}
				for(Product product:productPageInfolist)
				{
					product.setSecondCateName(idToName.get(product.getSecondCategoryId()));
				}
			}
			return "index";
	
}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub

		this.session=session;
	}

	public List<SecondCategory> getProduct_sclist() {
		return product_sclist;
	}


	public List<Category> getProduct_category() {
		return product_category;
	}

	public List<Product> getProductPageInfolist() {
		return productPageInfolist;
	}


	
	
	

}
