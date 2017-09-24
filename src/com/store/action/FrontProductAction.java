package com.store.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;

import com.store.entity.Address;
import com.store.entity.Banners;
import com.store.entity.Cart;
import com.store.entity.Category;
import com.store.entity.Collection;
import com.store.entity.Comment;
import com.store.entity.Coupons;
import com.store.entity.Customer;
import com.store.entity.News;
import com.store.entity.Order;
import com.store.entity.Product;
import com.store.entity.SecondCategory;
import com.store.service.AddressService;
import com.store.service.BannersService;
import com.store.service.CartService;
import com.store.service.CategoryService;
import com.store.service.CollectionService;
import com.store.service.CommentService;
import com.store.service.CouponsService;
import com.store.service.NewsService;
import com.store.service.OrderService;
import com.store.service.ProductService;
import com.store.service.SecondCategoryService;

@Controller
@Scope("prototype")
public class FrontProductAction extends BaseAction<Product> implements SessionAware,ParameterAware{

	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	@Resource
	private ProductService frontproductservice;
	private List<Product>cartProducts;
	private List<Product>collectionProducts;
	@Resource
	private CartService cartService;
	private List<Cart>FrontCartList;
	
	private Map<String, String[]> param;
	
	
	@Resource
	private SecondCategoryService secondcategoryservice;
	@Resource
	private CategoryService categoryservice;
	
	@Resource
	private CouponsService couponsservice;
	
	@Resource
	private BannersService bannersService;
	
	@Resource
	private AddressService addressService;
	
	@Resource
	private CollectionService collectionService;
	//private CollectionService collectionService;
	@Resource
	private OrderService orderService;
	@Resource
	private CommentService commentservice;
	@Resource
	private NewsService newsService;
	
	private List<News>frontNewsList;
	private List<News>frontNewsListonly;
	private List<Comment>FrontCommentList;
	private List<Address>FrontAddressList;
	private List<Address>waitAddressList1;
	private List<Address>waitAddressList2;
	
	private List<Coupons>CouponsList;
	
	private List<Banners>FrontBannersList;
	
	private List<Coupons>FrontCouponsList;
	private List<SecondCategory> FrontSecondCategoryList;
	private List<Category>FrontCategoryList;
	
	private List<Product>FrontProductList;
	
	private List<Collection>FrontCollectionList;
	
	//��ҳ
	public String index()		
	{
		//��ҳ��ȡ���еĲ�Ʒ������ҳ��Ʒ��չʾ
		FrontProductList=frontproductservice.findByPageinfo(pageInfo);
		requset.setAttribute("pageBean", pageInfo.getPageBean());		
		//�Ż�ȯ�Ļ�ȡ
		FrontCouponsList=couponsservice.findAll();
		//��ȡbanner
		FrontBannersList=bannersService.findAll();
		//��ȡ�����б�
		frontNewsList=newsService.findAll();
		//������Ŀ
		//��ȡһ������Ͷ�������
		FrontCategoryList=categoryservice.findAll();
		//FrontSecondCategoryList=secondcategoryservice.findAll();
		if(FrontCategoryList!=null && !FrontCategoryList.isEmpty())
		{
			for(Category cat:FrontCategoryList)
			{
				FrontSecondCategoryList=secondcategoryservice.findEntiyByHql(
						"from SecondCategory where firstCategoryId=?", String.valueOf(cat.getId()));
				//��һ��Ķ��������һ������������
				cat.setSecondcategorys(FrontSecondCategoryList);
			}		
		}
		return "index";
		
		//��ȡһ������Ͷ����������ڵ�����		
	}
	
	//��ȡ������Ʒ
	public String allproduct(){
		FrontProductList=frontproductservice.findAll();
		return "allproduct";
		
	}
	//��Ʒ����
	public String productPageInfo()	{
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
				
		FrontCommentList=commentservice.findEntiyByHql("from Comment where productID=?", model.getProductId());
		model=frontproductservice.getEntity(model.getProductId());
		
		return "productdetail";
		
	}
	 //����ҳ��
	public String waitinfo(){
		Customer customer=(Customer) session.get("customer");
		FrontAddressList=addressService.findEntiyByHql("from Address where custoId=?", customer.getCustomerId());
		FrontCouponsList=couponsservice.findEntiyByHql("from Coupons where cusId=?", customer.getCustomerId());
		
		
		CouponsList=new ArrayList<>();
		for(Coupons cou:FrontCouponsList){
			
			if(cou.getStates()==1){
				Coupons coupons=new Coupons();
				coupons=couponsservice.getEntity(cou.getCouponId());
				CouponsList.add(coupons);
			}
			
		}
			
		waitAddressList1=new ArrayList<>();
		waitAddressList2=new ArrayList<>();
		for(Address add:FrontAddressList)
		{			
			if(add.getStates()==1)
			{
				
				Address address = new Address();
				address=addressService.getEntity(add.getAddressId());
				waitAddressList1.add(address);//
				
			}
						
		}	
		for(Address add:FrontAddressList)
		{
			if(waitAddressList2.size()<2)
			{
				if(add.getStates()==0)
				{
					Address address = new Address();
					address=addressService.getEntity(add.getAddressId());
					waitAddressList2.add(address);
					
				}	
			}
			
		}
		model=frontproductservice.getEntity(model.getProductId());
		return "waitbuy";
		
	}
	//������빺�ﳵ
	public String cart(){
		Customer customer=(Customer) session.get("customer");
		if(customer==null)
		{
			return "input";
		}else{

			Cart cart =new Cart();
			cart.setCustomer(customer);
			cart.setJoinTime(new Date());
			cart.setProductId(model.getProductId());
			Cart carts = cartService.validateInfo(cart);
			if(carts!=null)
			{
				//addActionError("�Ѿ����빺�ﳵ");
				model=frontproductservice.getEntity(model.getProductId());
				
				return "productdetail";
			}else{
			 System.out.println(cart);
			 cartService.saveEntity(cart);
			 model=frontproductservice.getEntity(model.getProductId());
			 return "productdetail";
			}
		}

	}
	//ǰ�����ﳵ
	public String frontCart(){
		Customer customer=(Customer) session.get("customer");
		//��ȡ����ǰsession�����й��ﳵ��Ŀ
		//ͨ��cartʵ���е�productid��ȡ�鼮ʵ��
		FrontCartList=cartService.findEntiyByHql("from Cart where customerId=?", customer.getCustomerId());
		if(FrontCartList!=null && !FrontCartList.isEmpty())
		{
			cartProducts=new ArrayList<>();
			
			for(Cart cart:FrontCartList)
			{
				Product product=new Product();
				product=frontproductservice.getEntity(cart.getProductId() );
				
				cartProducts.add(product);
			}				
		}
		//������Ŀ
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
		return "frontcart";
	}
	//�����鼮ҳ��
	public String categoryProduct(){
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
		String scId=requset.getParameter("id");
		//String categoryid=requset.getParameter("categoryid");
		
		FrontProductList=frontproductservice.findEntiyByHql("from Product where secondCategoryId=?",String.valueOf(scId));
		//FrontProductList=frontproductservice.findEntiyByHql("from Product where secondCategoryId=?",String.valueOf(categoryid));
		return "categoryPage";
		
	}
	
	//��������ղ�
	public String collection(){
		Customer customer=(Customer) session.get("customer");
		if(customer==null)
		{
			return "input";
		}else{
			
			Collection collection =new Collection();
			collection.setCustomer(customer);
			collection.setJoinTime(new Date());
			
			collection.setProductId(model.getProductId());
			 System.out.println("hfashflasjhflaskfhaskfhas;df"+collection);
			Collection collections = collectionService.validateInfo(collection);
			if(collections!=null)
			{
				//addActionError("�Ѿ������ղؼ�");
				 model=frontproductservice.getEntity(model.getProductId());
				return "productdetail";
			}else{
			 System.out.println(collection);
			 //collectionService.saveEntity(collection);
			 collectionService.saveEntity(collection);
			 model=frontproductservice.getEntity(model.getProductId());
			 return "productdetail";
			}
		}

		
		
		
	}
	//�ҵ��ղ�
	public String collectionProduct(){
		
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
		//��ȡ����ǰsession�������ղز�Ʒ��Ŀ
		//ͨ��collectionʵ���е�productid��ȡ�鼮ʵ��
		FrontCollectionList=collectionService.findEntiyByHql("from Collection where customerId=?", customer.getCustomerId());
		if(FrontCollectionList!=null && !FrontCollectionList.isEmpty())
		{
			collectionProducts=new ArrayList<>();
			
			for(Collection collection:FrontCollectionList)
			{
				Product product=new Product();
				product=frontproductservice.getEntity(collection.getProductId() );
				
				collectionProducts.add(product);
			}				
		}
		return "collectionPage";
		
		
	}	
	public String cardelete(){
		Customer customer=(Customer) session.get("customer");
		
		//System.out.println("===================================="+model.getProductId());
		//Product product = frontproductservice.getEntity(model.getProductId());
		//cartService.delteEntity(t);
		//Cart cart=cartService.findEntiyByHql(hql, product.getProductId());
		List<Cart> carts =cartService.findEntiyByHql("from Cart  where customerId=? and ProductId=?",customer.getCustomerId(), model.getProductId());
		//String id=requset.getParameter("id");
		//System.out.println("===================================="+id);
		//int carId=Integer.parseInt(id);
		//System.out.println("===================================11="+carId);
		//Cart cart=cartService.getEntity(carId);
		//cartService.delteEntity(cart);
				for(Cart cart:carts)
				{
					//Product product=new Product();
					//product=frontproductservice.getEntity(cart.getProductId() );
					cartService.delteEntity(cart);
				//	cartProducts.add(product);
				}		
		return "redirectAction_to_index";
		
	}
	
	
	//��������/����ģ����ѯSELECT * FROM PRODUCTS WHERE productname LIKE '%ɳĮ%' 
	public String search(){
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
		String key=requset.getParameter("key");
		FrontProductList=frontproductservice.findEntiyByHql("from Product where details LIKE '%"+key+"%'");
		//FrontProductList=frontproductservice.findEntiyByHql("from Product where author LIKE '%"+key+"%'");
		return "categoryPage";
		
		
	}
	
	
	//����ύ������
	public String submitOrder(){
		//����ͼ��id	
		String productId=requset.getParameter("productId");	
		//�����ܼ�
	    String totalprice=requset.getParameter("totalprice");	
		//��������
		String bookNum=requset.getParameter("bookNum");	
		//�ջ���ַ
		String addrecieve=requset.getParameter("addrecieve");	
		Order order=new Order();		
		Customer customer=(Customer) session.get("customer");
		order.setCustomer(customer);
		//�����۸�
		order.setTotalPrice(Double.parseDouble(totalprice));
		//�µ�����
		order.setOrderTime(new Date());
		//��Ʒid
		order.setProductId(Integer.parseInt(productId));
		//�ջ���ַ
		order.setOrderAddress(addrecieve);
		//��������
		order.setBookNum(Integer.parseInt(bookNum));
		
		order.setCustomerId(customer.getCustomerId());
		orderService.saveEntity(order);		
	
		return "redirectAction_to_index";
		
	}
	
	//����ҳ��
	public String News(){
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
		frontNewsList=newsService.findAll();
		String newid=requset.getParameter("NewsId");		
		News news=newsService.getEntity(Integer.parseInt(newid));
		frontNewsListonly=new ArrayList<>();
		frontNewsListonly.add(news);
		
		return "news";
		
	}

	@Override
	public void setParameters(Map<String, String[]> arg0) {
		this.param=arg0;
	}

	@Override
	public void setSession(Map<String, Object> session) {

		this.session=session;
	}

	public List<Cart> getFrontCartList() {
		return FrontCartList;
	}

	public List<Product> getCartProducts() {
		return cartProducts;
	}
	public List<SecondCategory> getFrontSecondCategoryList() {
		return FrontSecondCategoryList;
	}
	public List<Category> getFrontCategoryList() {
		return FrontCategoryList;
	}

	public List<Product> getFrontProductList() {
		return FrontProductList;
	}

	public List<Coupons> getFrontCouponsList() {
		return FrontCouponsList;
	}

	public List<Banners> getFrontBannersList() {
		return FrontBannersList;
	}

	public List<Address> getFrontAddressList() {
		return FrontAddressList;
	}

	public List<Collection> getFrontCollectionList() {
		return FrontCollectionList;
	}

	public List<Product> getCollectionProducts() {
		return collectionProducts;
	}


	public List<Address> getWaitAddressList2() {
		return waitAddressList2;
	}

	public List<Address> getWaitAddressList1() {
		return waitAddressList1;
	}

	public List<Comment> getFrontCommentList() {
		return FrontCommentList;
	}

	public List<News> getFrontNewsList() {
		return frontNewsList;
	}

	public List<News> getFrontNewsListonly() {
		return frontNewsListonly;
	}

	public List<Coupons> getCouponsList() {
		return CouponsList;
	}


	
}
