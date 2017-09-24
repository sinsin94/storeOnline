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
	
	//首页
	public String index()		
	{
		//分页获取所有的产品用于主页商品的展示
		FrontProductList=frontproductservice.findByPageinfo(pageInfo);
		requset.setAttribute("pageBean", pageInfo.getPageBean());		
		//优惠券的获取
		FrontCouponsList=couponsservice.findAll();
		//获取banner
		FrontBannersList=bannersService.findAll();
		//获取新闻列表
		frontNewsList=newsService.findAll();
		//导航条目
		//获取一级分类和二级分类
		FrontCategoryList=categoryservice.findAll();
		//FrontSecondCategoryList=secondcategoryservice.findAll();
		if(FrontCategoryList!=null && !FrontCategoryList.isEmpty())
		{
			for(Category cat:FrontCategoryList)
			{
				FrontSecondCategoryList=secondcategoryservice.findEntiyByHql(
						"from SecondCategory where firstCategoryId=?", String.valueOf(cat.getId()));
				//将一类的二级分类和一级分类做关联
				cat.setSecondcategorys(FrontSecondCategoryList);
			}		
		}
		return "index";
		
		//获取一级分类和二级分类用于导航栏		
	}
	
	//获取所有商品
	public String allproduct(){
		FrontProductList=frontproductservice.findAll();
		return "allproduct";
		
	}
	//商品详情
	public String productPageInfo()	{
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
				
		FrontCommentList=commentservice.findEntiyByHql("from Comment where productID=?", model.getProductId());
		model=frontproductservice.getEntity(model.getProductId());
		
		return "productdetail";
		
	}
	 //购买页面
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
	//点击加入购物车
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
				//addActionError("已经加入购物车");
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
	//前往购物车
	public String frontCart(){
		Customer customer=(Customer) session.get("customer");
		//获取到当前session的所有购物车条目
		//通过cart实例中的productid获取书籍实例
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
		//导航条目
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
		return "frontcart";
	}
	//分类书籍页面
	public String categoryProduct(){
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
		String scId=requset.getParameter("id");
		//String categoryid=requset.getParameter("categoryid");
		
		FrontProductList=frontproductservice.findEntiyByHql("from Product where secondCategoryId=?",String.valueOf(scId));
		//FrontProductList=frontproductservice.findEntiyByHql("from Product where secondCategoryId=?",String.valueOf(categoryid));
		return "categoryPage";
		
	}
	
	//点击加入收藏
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
				//addActionError("已经加入收藏夹");
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
	//我的收藏
	public String collectionProduct(){
		
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
		//获取到当前session的所有收藏产品条目
		//通过collection实例中的productid获取书籍实例
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
	
	
	//搜索功能/做简单模糊查询SELECT * FROM PRODUCTS WHERE productname LIKE '%沙漠%' 
	public String search(){
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
		String key=requset.getParameter("key");
		FrontProductList=frontproductservice.findEntiyByHql("from Product where details LIKE '%"+key+"%'");
		//FrontProductList=frontproductservice.findEntiyByHql("from Product where author LIKE '%"+key+"%'");
		return "categoryPage";
		
		
	}
	
	
	//点击提交订单，
	public String submitOrder(){
		//购买图书id	
		String productId=requset.getParameter("productId");	
		//订单总价
	    String totalprice=requset.getParameter("totalprice");	
		//购买数量
		String bookNum=requset.getParameter("bookNum");	
		//收货地址
		String addrecieve=requset.getParameter("addrecieve");	
		Order order=new Order();		
		Customer customer=(Customer) session.get("customer");
		order.setCustomer(customer);
		//订单价格
		order.setTotalPrice(Double.parseDouble(totalprice));
		//下单日期
		order.setOrderTime(new Date());
		//产品id
		order.setProductId(Integer.parseInt(productId));
		//收货地址
		order.setOrderAddress(addrecieve);
		//购买数量
		order.setBookNum(Integer.parseInt(bookNum));
		
		order.setCustomerId(customer.getCustomerId());
		orderService.saveEntity(order);		
	
		return "redirectAction_to_index";
		
	}
	
	//新闻页面
	public String News(){
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
