package com.store.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.store.entity.Category;
import com.store.entity.Product;
import com.store.entity.SecondCategory;
import com.store.service.CategoryService;
import com.store.service.ProductService;
import com.store.service.SecondCategoryService;

@Controller
@Scope("prototype")
public class ProductAction extends BaseAction<Product> implements SessionAware{
	private static final long serialVersionUID = 1L;
	
	@Resource
	private ProductService productservice;
	
	private List<Product>productlist;
	//�õ����еĶ���������Ϣ,����������action�е����ֲ�ͬ
	@Resource
	private SecondCategoryService secondcategoryServices;
	private List<SecondCategory>secondcategorylist;
	@Resource
	private CategoryService categoryService;
	private List<Category>category;
	private Map<String, Object> session;
	
	public String index(){
		    //��ҳ��ȡ������Ʒ
		
		     	productlist=productservice.findByPageinfo(pageInfo);
				requset.setAttribute("pageBean", pageInfo.getPageBean());
				if(productlist!=null && !productlist.isEmpty())
				{   
					//��ȡ���ж���������Ϣ
					secondcategorylist=secondcategoryServices.findAll();
					
					Map<String, String>idToName=new HashMap<String, String>();
					
					if(secondcategorylist!=null)
					{
						for(SecondCategory seCategory:secondcategorylist)
						{
							idToName.put(String.valueOf(seCategory.getId()), seCategory.getSecondCategoryName());
						}
					}
					for(Product product:productlist)
					{
						product.setSecondCateName(idToName.get(product.getSecondCategoryId()));
					}
				}
				return "index";
		
	}
	
	
	public String add()
	{
		
		if(model.getProductName()==null)
		{
		//���������б�
			secondcategorylist=secondcategoryServices.findAll();			
			if(secondcategorylist!=null && !secondcategorylist.isEmpty())
			{
				productlist=new ArrayList<>();
				for(SecondCategory secondCate:secondcategorylist)
				{
					Product product=new Product();
					product.setSecondCategoryId(String.valueOf(secondCate.getId()));
					product.setSecondCateName(secondCate.getSecondCategoryName());
					productlist.add(product);
				}				
			}
			else //�޶������� ����Ӷ�������
				
			{
		
			}
			
			return "add";
		}
		else
		{
			model.setJoinTime(new Date());
	        System.out.println(model.getSecondCateName());
			productservice.saveEntity(model);
			return "redirectAction_to_index";
		}
		
		
	}
	
	public String delete(){		
		
		Map<String,String[]> proMap =requset.getParameterMap();
		//ÿһ��checkbox����һ��delIdArray����
		String[] temp=proMap.get("delIdArray");
		
		if(temp!=null)
		{
			Integer[] proNum=new Integer[temp.length];
			for(int i=0;i<temp.length;i++)
			{
				proNum[i]=Integer.parseInt(temp[i]);
			}
			
			String hql="delete Product where ProductId=?";
			for(int i=1;i<proNum.length;i++)
			{
				
				hql+=" or ProductId=?";
			}
			System.out.println("==================="+hql);
			productservice.batchEntityByHql(hql, proNum);
			
			return "redirectAction_to_index";
		}
		
		return "redirectAction_to_index";
		
	}

	public String update(){		
		if(model.getProductName()==null&&model.getProductId()!=0)			
		{
			 model=productservice.getEntity(model.getProductId());
			 //�õ����ж�������
			 secondcategorylist=secondcategoryServices.findAll();
			 if(secondcategorylist!=null && !secondcategorylist.isEmpty())
				{
					productlist=new ArrayList<>();
					for(SecondCategory secondCate:secondcategorylist)
					{
						Product product=new Product();
						product.setSecondCategoryId(String.valueOf(secondCate.getId()));
						product.setSecondCateName(secondCate.getSecondCategoryName());
						productlist.add(product);
					}				
				}
			
			return "update";
		}else{//��������
			
			String scId=requset.getParameter("secondCategoryId");
			if(scId!=null)
			{
				model.setSecondCategoryId(scId);
			}
			productservice.saveOrUpdate(model);
			return "redirectAction_to_index";	
		}
		
		
		
	}

	
	

	
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		
		this.session=session;
		
	}
	public List<SecondCategory> getSecondcategorylist() {
		return secondcategorylist;
	}
	public List<Category> getCategory() {
		return category;
	}
	public List<Product> getProductlist() {
		return productlist;
	}

}
