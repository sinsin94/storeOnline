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
	
	//��ҳ��
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
	
	
	//ɾ��һ������,�޸����ڸ�һ������Ķ�����������Ϊ�գ���ɾ����Ӧһ������Ŀͻ�����(ɾ���û��𰸱�����ؿγ�-->������ﲻ������)
	//��ʱ�趨ĳһ������ʱ�򣬲�����ɾ����һ������
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
