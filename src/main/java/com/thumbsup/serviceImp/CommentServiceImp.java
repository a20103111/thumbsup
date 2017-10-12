package com.thumbsup.serviceImp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.thumbsup.dto.TClassExample;
import com.thumbsup.dto.TComment;
import com.thumbsup.dto.TCommentExample;
import com.thumbsup.dto.TCommentExample.Criteria;
import com.thumbsup.mapper.TClassMapper;
import com.thumbsup.mapper.TCommentMapper;
import com.thumbsup.service.ICommentService;
import com.thumbsup.utils.PageResult;

@Service
public class CommentServiceImp implements ICommentService {
	
	@Resource
	private TCommentMapper tCommentMapper;
	
	@Override
	public PageResult<TComment> getAllComment(Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 10);
		TCommentExample tCommentExample = new TCommentExample();
		tCommentExample.createCriteria().andIdIsNotNull();
		
		List<TComment> clist = tCommentMapper.selectByExample(tCommentExample);
		PageInfo<TComment> pageInfo = new PageInfo<TComment>(clist);
		
		PageResult<TComment> pageResult = new PageResult<TComment>();
		pageResult.setResultList(clist);
		pageResult.setPageInfo(pageInfo);
		return pageResult;
	}

	@Override
	public TComment getCommentByPK(Integer CommentId) {
		// TODO Auto-generated method stub
		TComment tcomment = tCommentMapper.selectByPrimaryKey(CommentId);
		
		return tcomment;
	}

	@Override
	public String removeCommentByPk(Integer CommentId) {
		// TODO Auto-generated method stub
		
		int flag = tCommentMapper.deleteByPrimaryKey(CommentId);
		
		if(flag>0){
			
			return "020";
			
		}
		return "021";
	}

	@Override
	public String insertComment(TComment comment) {
		// TODO Auto-generated method stub
		System.out.println(comment.getStudentFromclassid());
		int flag = tCommentMapper.insert(comment);
		if(flag>0){
			
			return "022";
			
		}
		return "023";
	}

	@Override
	public TComment getCommentByKey(Integer StudentId, Integer TeacherId) {
		// TODO Auto-generated method stub
		
		TCommentExample tCommentExample  = new TCommentExample();
		Criteria cri = tCommentExample.createCriteria();
		
		cri.andStudentIdEqualTo(StudentId);
		cri.andForteacheridEqualTo(TeacherId);
		
		List<TComment> clist = tCommentMapper.selectByExample(tCommentExample);
		
		return clist.get(0);
	}

}
