package com.store.service.impl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.store.dao.BaseDao;
import com.store.entity.Comment;
import com.store.service.CommentService;
@Service("CommentService")
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService{
	
	@Resource(name = "commentDao")
	@Override
	public void setBaseDao(BaseDao<Comment> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
}
