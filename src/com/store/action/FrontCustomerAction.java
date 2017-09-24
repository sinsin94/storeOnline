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
			
			//��ȡһ������Ͷ�������
			FrontCategoryList=categoryservice.findAll();
			//FrontSecondCategoryList=secondcategoryservice.findAll();
			if(FrontCategoryList!=null && !FrontCategoryList.isEmpty())
			{
				for(Category cat:FrontCategoryList)
				{
					FrontSecondCategoryList=secondcategoryservice.findEntiyByHql("from SecondCategory where firstCategoryId=?", String.valueOf(cat.getId()));
					//��ûһ��Ķ��������һ������������
					cat.setSecondcategorys(FrontSecondCategoryList);
				}
				
				
			}
			Customer customer=(Customer) session.get("customer");
			//��ȡ���û����еĶ���
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
	//ǰ̨������ע��
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
				addActionError("�������ѱ�ע��");
				return "register";
			}
			
		}
	//ǰ̨�������һ�����
     	public String getpwd()
     		{
     				String step=requset.getParameter("step");
     				if("1".equals(step))
     				{     					
     					//����seekPwd.jsp �����û���
     					return "getpwdstep1";
     				}
     				else if("2".equals(step))
     				{
     					
     					//��ȡ�û���
     					List<Customer> customer=customerservice.findEntiyByHql("from Customer where name=?", model.getName());
     					
     					int size=customer.size();
     					//model=customerservice.getEntity(customer.get(0).getCustomerId());
     					if(size>0)
     					{
     						model=customerservice.getEntity(customer.get(0).getCustomerId());
     						return "getpwdstep2";
     					}else{
     					
     					//����seekPwd1.jsp�����������
     					return "getpwdstep1";
     					}
     				}
     				else if("3".equals(step))
     				{
     					//������⼰��
     					
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
     					//���������     			
     					Customer customer=customerservice.getEntity(model.getCustomerId());
     					//����������
     					customer.setPwd(DigestUtils.md5DigestAsHex(model.getPwd().getBytes()));	
     					//����д������
     				   customerservice.saveOrUpdate(customer);
     					
     				return "getpwdstep4";
     				}
     				return "error";
     		}
     			
     			
             //ǰ̨�޸ĸ�����Ϣ
     	public String CustomerInfo(){
     		//��ȡһ������Ͷ�������
			FrontCategoryList=categoryservice.findAll();
			//FrontSecondCategoryList=secondcategoryservice.findAll();
			if(FrontCategoryList!=null && !FrontCategoryList.isEmpty())
			{
				for(Category cat:FrontCategoryList)
				{
					FrontSecondCategoryList=secondcategoryservice.findEntiyByHql("from SecondCategory where firstCategoryId=?", String.valueOf(cat.getId()));
					//��ûһ��Ķ��������һ������������
					cat.setSecondcategorys(FrontSecondCategoryList);
				}
				
				
			}
     		//����ж�session������ת
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
     							//��ַ����������һ�Զ�Ĺ�ϵ
     							return "customerinfo";
     						}
     						else
     						{
     							requset.setAttribute("error", "�Ƿ�����������");
     							return "error";
     						}     						
     					}
     					return "input";
     					
     					//ҳ�������²���
     				}else{
     					
     					customerservice.saveOrUpdate(model);
     					return "myorder";
     				}
					
     				
     			}
     	
     	//ǰ̨ɾ����ַ
     	
     public String addressdelete(){
    	 
    	 String id=requset.getParameter("addressId");
    	 //System.out.println("================================="+id);
    	 addressService.delteEntity(addressService.getEntity(Integer.valueOf(id)));
		return "redirectAction_to_index";
    	 
    	 
     }
     			
     //�����鼮
     			
     public String saveComment(){
    	 Customer customer=(Customer) session.get("customer"); 
    	 //�鼮ID
    	 String bookId=requset.getParameter("bookId");
    	 //�鼮����
    	 String newComment=requset.getParameter("newComment");
    	 //�Ǽ���
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
    	 
    	//����ж�session������ת
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
						requset.setAttribute("error", "�Ƿ�����������");
						return "error";
					}     						
				}
				return "input";
				//ҳ�������²���
			}else{			
			
				    		
					Customer customer=customerservice.getEntity(model.getCustomerId());	
					//��ȡ������
					String oldpwd=requset.getParameter("password");							
					//��ȡ������
					String newpwd=requset.getParameter("pwdChange");					
					//��������֮���ڱȽ�
					if(!customer.getPwd().equals(DigestUtils.md5DigestAsHex(oldpwd.getBytes()))){
						System.out.println(customer.getPwd());
						System.out.println("ԭʼ�������");
						return "restPwd";
					}else{
						//����������
						System.out.println("ԭʼ������ȷ");
						customer.setPwd(DigestUtils.md5DigestAsHex(newpwd.getBytes()));	
						//����д������
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
