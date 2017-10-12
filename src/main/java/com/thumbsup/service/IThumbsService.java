package com.thumbsup.service;

import java.util.Map;

import com.thumbsup.dto.TThumbs;
import com.thumbsup.utils.PageResult;
import com.thumbsup.vo.VO4Count_Rtn;

public interface IThumbsService {
	public PageResult<TThumbs> getThumbsByKey(Integer ClassId,String createTime,Integer pageNum);
	public Map<String,Double> getAvagByKey(Integer ClassId,String createTime,String TeacherName);
	public VO4Count_Rtn getCountByKey(Integer ClassId,String createTime,String TeacherName);
	public PageResult<TThumbs> getAdminThumbsByKey(Integer ClassId,String createTime,String TeacherName,Integer pageNu);
	public String removeThumbsupByPk(Integer teacherId);
	public Map<String,Double> getAdminAvagByKey(Integer ClassId,String createTime,String TeacherName);
	public String InsertThumbs(TThumbs thumbs);
	public TThumbs getThumbsByKey(Integer StudentId,Integer TeacherId);
}

