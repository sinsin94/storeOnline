package com.store.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.store.entity.Category;
import com.store.entity.Customer;
import com.store.entity.Order;
import com.store.entity.Product;
import com.store.entity.SecondCategory;
import com.store.service.CustomerService;
import com.store.service.OrderService;
import com.store.service.ProductService;

@Controller
@Scope("prototype")
public class CustomerAction extends BaseAction<Customer> implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	
	@Resource    //����Ҫ��ĳ�����ж���һ�����ԣ����Ҹ�������һ���Ѵ��ڵ�bean��ҪΪ�����Ը�ֵ��ע��ʱ�ڸ�������һ��ʹ��@Resource(name="xxx")���൱��Ϊ������ע��һ������Ϊxxx��bean��
    private CustomerService customerservice;
	@Resource 
	private OrderService orderService;	
	@Resource 
	private ProductService productService;
	private List<Product>orderProduct;
	private Map<String, Object> session;
	
	private  List<Customer>customers;
	//����ȥ����action�ж����������ͬ��
	
	
	private  List<Order>cusOrders;
	
	
	
	//��̨����ҳ����ת
		public String index()
		{
			//students=studentService.findAll();
			customers=customerservice.findByPageinfo(pageInfo);
			requset.setAttribute("pageBean", pageInfo.getPageBean());
			return "index";
		}
		
		//��̨ɾ��������,����Ҫɾ������
		public String delete()
		{
			Map<String,String[]> custMap =requset.getParameterMap();
			String[] customerId=custMap.get("delIdArray");
			
			if(customerId!=null)
			{
				Integer[] customerNum=new Integer[customerId.length];
				
				//String hql_2="delete Order where customerId=?";
				for(int i=1;i<customerId.length;i++)
				{
					customerNum[i]=Integer.parseInt(customerId[i]);
				//	hql_1+=" or customerId=?";
			//		hql_2+=" or customerId=?";
				}
				String hql_1="delete Customer where customerId=?";
				//scoreService.batchEntityByHql(hql_2, customerId);
				for(int i=1;i<customerNum.length;i++)
				{
					hql_1+=" or customerId=?";
				}
				customerservice.batchEntityByHql(hql_1, customerNum);
	
			   
			}
			return "redirectAction_to_index";
			
			
		}
		
		//��̨��ö���
		public String order()
		{						
			cusOrders=orderService.findByPageinfo(pageInfo);
			requset.setAttribute("pageBean", pageInfo.getPageBean());
		
			if(cusOrders!=null && !cusOrders.isEmpty())
			{
				customers=customerservice.findAll();
				orderProduct=productService.findAll();
				Map<String, String>idToName=new HashMap<String, String>();
				//��Ʒid��name��ӳ��
				Map<String, String>pidToName=new HashMap<String, String>();
				if(customers!=null)
				{  
					for(Customer cus:customers)
					{
						idToName.put(String.valueOf(cus.getCustomerId()), cus.getName());
					
					}
				}
				
				if(orderProduct!=null)
				{  
					for(Product pro:orderProduct)
					{
						pidToName.put(String.valueOf(pro.getProductId()), pro.getProductName());
					
					}
				}
				
				
				
				for(Order ord:cusOrders)
				{						
					//ע������
					ord.setCustomerName(idToName.get(String.valueOf(ord.getCustomerId())));
					ord.setBookName(pidToName.get(String.valueOf(ord.getProductId())));
				}
			}
			
			return "order";

		}
		
		
		
		
		public List<Customer> getCustomers() {
			return customers;
		}


		public List<Order> getCusOrders() {
			return cusOrders;
		}
		
		@Override
		public void setSession(Map<String, Object> session) {

			this.session=session;
		}

		public List<Product> getOrderProduct() {
			return orderProduct;
		}

	
}
