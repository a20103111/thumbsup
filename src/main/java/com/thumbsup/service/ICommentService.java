package com.thumbsup.service;

import java.util.List;

import com.thumbsup.dto.TComment;
import com.thumbsup.utils.PageResult;

public interface ICommentService {
	public PageResult<TComment> getAllComment(Integer pageNum);
	public TComment getCommentByPK(Integer CommentId);
	public String removeCommentByPk(Integer CommentId);
	public String insertComment(TComment comment);
	public TComment getCommentByKey(Integer StudentId,Integer TeacherId);
}
