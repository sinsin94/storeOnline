package com.store.action;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.store.entity.Category;
import com.store.service.CategoryService;
import com.store.service.OrderService;
import com.store.service.SecondCategoryService;

@Controller
@Scope("prototype")
public class CategoryAction extends BaseAction<Category> implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	@Resource
	private CategoryService categoryService;	
	@Resource
	private SecondCategoryService secondcategoryService;	
	@Resource
	private OrderService orderService; 
	
	private  List<Category> categorys;
	
	private Map<String, Object> session;
	
	//主页面
	public String index()
	{
		categorys=categoryService.findAll();
		return "index";
	}
	
	public String doAdd()
	{
		categoryService.saveEntity(model);
		return "redirectAction_to_index";
	}
	
	
	//删除一级分类,修改属于该一级分类的二级分类的外键为空，不删除相应一级分类的客户订单(删除用户答案表中相关课程-->这个这里不做处理)
	//当时设定某一级分类时候，不轻易删除该一级分类
	public String delete()
	{
		
		return "delete";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub

		this.session=session;
	}

	public List<Category> getCategorys() {
		return categorys;
	}	
}
