package com.store.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.swing.tree.TreeNode;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;

import com.store.entity.Address;
import com.store.entity.Banners;
import com.store.entity.Category;
import com.store.entity.Collection;
import com.store.entity.Comment;
import com.store.entity.Coupons;
import com.store.entity.Customer;
import com.store.entity.Order;
import com.store.entity.Product;
import com.store.entity.SecondCategory;
import com.store.service.AddressService;
import com.store.service.CategoryService;
import com.store.service.CommentService;
import com.store.service.CustomerService;
import com.store.service.OrderService;
import com.store.service.ProductService;
import com.store.service.SecondCategoryService;



@Controller
@Scope("prototype")
public class FrontCustomerAction extends BaseAction<Customer> implements SessionAware {

	
		
		private static final long serialVersionUID = 1L;
	
		@Resource
		private CustomerService customerservice;
		
		@Resource
		private AddressService addressService;
	
		@Resource
		private ProductService productservice;
		
		@Resource
		private OrderService orderservice;
		
		@Resource
		private CommentService commentservice;
		
		@Resource
		private SecondCategoryService secondcategoryservice;
		@Resource
		private CategoryService categoryservice;
		
		
		private List<Product> allcustomerproduct;
		
		private List<Address>FrontAddressList;
		
		private List<Order>allcustomerorder;
		private List<SecondCategory> FrontSecondCategoryList;

		
		private List<Category>FrontCategoryList;
		
		private Map<String, Object> session;

		public String Myorder()
		{	
			
			//获取一级分类和二级分类
			FrontCategoryList=categoryservice.findAll();
			//FrontSecondCategoryList=secondcategoryservice.findAll();
			if(FrontCategoryList!=null && !FrontCategoryList.isEmpty())
			{
				for(Category cat:FrontCategoryList)
				{
					FrontSecondCategoryList=secondcategoryservice.findEntiyByHql("from SecondCategory where firstCategoryId=?", String.valueOf(cat.getId()));
					//将没一类的二级分类和一级分类做关联
					cat.setSecondcategorys(FrontSecondCategoryList);
				}
				
				
			}
			Customer customer=(Customer) session.get("customer");
			//获取该用户所有的订单
			allcustomerorder=orderservice.findEntiyByHql("from Order where customerId=?", customer.getCustomerId());
			//allcustomerproduct=new ArrayList<>();
			for(Order allorder:allcustomerorder)
			{				
				Product product=new Product();
				product=productservice.getEntity(allorder.getProductId());
				allorder.setProduct(product);
				//allcustomerproduct.add(product);
			}			
			return "myorder";	
		}	
	
		public String logout()
		{
			Customer customer=(Customer) session.get("customer");
			if(customer!=null)
			{
				ServletContext application=requset.getServletContext();
				
				application.removeAttribute(customer.getName());
				session.remove("customer");
				
			
			}
		return "login";
		}
	//前台消费者注册
     	public String register()
		{
			if(model.getName()==null)
			{
				return "register";
			}
			else
			{
				List<Customer> customer=customerservice.findEntiyByHql("from Customer where name=?", model.getName());			
				if(customer!=null && customer.isEmpty())
				{					
					model.setPwd(DigestUtils.md5DigestAsHex(model.getPwd().getBytes()));
					customerservice.saveEntity(model);
					return "login";
				}
				addActionError("该名字已被注册");
				return "register";
			}
			
		}
	//前台消费者找回密码
     	public String getpwd()
     		{
     				String step=requset.getParameter("step");
     				if("1".equals(step))
     				{     					
     					//进入seekPwd.jsp 输入用户名
     					return "getpwdstep1";
     				}
     				else if("2".equals(step))
     				{
     					
     					//获取用户名
     					List<Customer> customer=customerservice.findEntiyByHql("from Customer where name=?", model.getName());
     					
     					int size=customer.size();
     					//model=customerservice.getEntity(customer.get(0).getCustomerId());
     					if(size>0)
     					{
     						model=customerservice.getEntity(customer.get(0).getCustomerId());
     						return "getpwdstep2";
     					}else{
     					
     					//进入seekPwd1.jsp，输入问题答案
     					return "getpwdstep1";
     					}
     				}
     				else if("3".equals(step))
     				{
     					//获得问题及答案
     					
     					Customer customer=customerservice.getEntity(model.getCustomerId());
     					if(customer!=null)
     					{
     						if(customer.getAnswer().equals(model.getAnswer()))
     						{
     							return "getpwdstep3";
     						}
     						return "getpwdstep2";
     					}
     					return "getpwdstep1";
     					
     				}
     				else if("4".equals(step))
     				{
     					//获得新密码     			
     					Customer customer=customerservice.getEntity(model.getCustomerId());
     					//设置新密码
     					customer.setPwd(DigestUtils.md5DigestAsHex(model.getPwd().getBytes()));	
     					//重新写入数据
     				   customerservice.saveOrUpdate(customer);
     					
     				return "getpwdstep4";
     				}
     				return "error";
     		}
     			
     			
             //前台修改个人信息
     	public String CustomerInfo(){
     		//获取一级分类和二级分类
			FrontCategoryList=categoryservice.findAll();
			//FrontSecondCategoryList=secondcategoryservice.findAll();
			if(FrontCategoryList!=null && !FrontCategoryList.isEmpty())
			{
				for(Category cat:FrontCategoryList)
				{
					FrontSecondCategoryList=secondcategoryservice.findEntiyByHql("from SecondCategory where firstCategoryId=?", String.valueOf(cat.getId()));
					//将没一类的二级分类和一级分类做关联
					cat.setSecondcategorys(FrontSecondCategoryList);
				}
				
				
			}
     		//点击判断session进行跳转
     		if(model.getName()==null)
     			{
     				Customer customer=(Customer) session.get("customer");
     				if(customer!=null)
     					{
     					
     						if(customer.getCustomerId()==model.getCustomerId())
     						{
     							model=customerservice.getEntity(model.getCustomerId());
     							
     							FrontAddressList =addressService.findEntiyByHql("from Address where custoId=?", model.getCustomerId());
     							//FrontAddressList =addressService.findAll();
     							/*if(addresses==null ||addresses.isEmpty())
     							{
     								return "noenLesson";
     							}
     							model.setAddresses(addresses);*/
     							//地址和消费者是一对多的关系
     							return "customerinfo";
     						}
     						else
     						{
     							requset.setAttribute("error", "非法操作！！！");
     							return "error";
     						}     						
     					}
     					return "input";
     					
     					//页面做更新操作
     				}else{
     					
     					customerservice.saveOrUpdate(model);
     					return "myorder";
     				}
					
     				
     			}
     	
     	//前台删除地址
     	
     public String addressdelete(){
    	 
    	 String id=requset.getParameter("addressId");
    	 //System.out.println("================================="+id);
    	 addressService.delteEntity(addressService.getEntity(Integer.valueOf(id)));
		return "redirectAction_to_index";
    	 
    	 
     }
     			
     //评论书籍
     			
     public String saveComment(){
    	 Customer customer=(Customer) session.get("customer"); 
    	 //书籍ID
    	 String bookId=requset.getParameter("bookId");
    	 //书籍内容
    	 String newComment=requset.getParameter("newComment");
    	 //星级数
    	 String starNum=requset.getParameter("starNum");
    	 Comment comment = new Comment();
    	 comment.setCommentTime(new Date());
    	 comment.setContent(newComment);
    	 comment.setStarNum(Integer.parseInt(starNum));
    	 comment.setCustomerId(customer.getCustomerId());
    	 comment.setProductID(Integer.parseInt(bookId));
    	 comment.setCustomerName(customer.getName());
    	 commentservice.saveEntity(comment);
		return "redirectAction_to_index";
    	 
    	 //return "redirectAction_to_customerinfo";
    	 
    	 
     }
     
     public String resetPwd(){
    	 
    	//点击判断session进行跳转
			if(model.getName()==null)
			{
				Customer customer=(Customer) session.get("customer");
				if(customer!=null)
				{
					if(customer.getCustomerId()==model.getCustomerId())
					{
						model=customerservice.getEntity(model.getCustomerId());						
						return "restPwd";
					}
					else
					{
						requset.setAttribute("error", "非法操作！！！");
						return "error";
					}     						
				}
				return "input";
				//页面做更新操作
			}else{			
			
				    		
					Customer customer=customerservice.getEntity(model.getCustomerId());	
					//获取旧密码
					String oldpwd=requset.getParameter("password");							
					//获取新密码
					String newpwd=requset.getParameter("pwdChange");					
					//经过加密之后在比较
					if(!customer.getPwd().equals(DigestUtils.md5DigestAsHex(oldpwd.getBytes()))){
						System.out.println(customer.getPwd());
						System.out.println("原始密码错误");
						return "restPwd";
					}else{
						//设置新密码
						System.out.println("原始密码正确");
						customer.setPwd(DigestUtils.md5DigestAsHex(newpwd.getBytes()));	
						//重新写入数据
					    customerservice.saveOrUpdate(customer);
					    ServletContext application=requset.getServletContext();						
						application.removeAttribute(customer.getName());
						session.remove("customer");
						
						
						
					}
					
					return "login";
					/* 
					*/
			
			}
			
			
		}
   	
		@Override
		public void setSession(Map<String, Object> session) {
	
			this.session=session;
		}
		public List<Address> getFrontAddressList() {
			return FrontAddressList;
		}

		public List<Product> getAllcustomerproduct() {
			return allcustomerproduct;
		}
		public List<Order> getAllcustomerorder() {
			return allcustomerorder;
		}
		public void setAllcustomerorder(List<Order> allcustomerorder) {
			this.allcustomerorder = allcustomerorder;
		}
		public List<SecondCategory> getFrontSecondCategoryList() {
			return FrontSecondCategoryList;
		}
		public List<Category> getFrontCategoryList() {
			return FrontCategoryList;
		}
}
