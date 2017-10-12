package com.thumbsup.service;

import java.util.List;

import com.thumbsup.dto.TClass;
import com.thumbsup.utils.PageResult;

public interface IClassesService {
		
	public PageResult<TClass> getAllClass(Integer pageNum,Integer teacherid);
	
	public TClass getClassSingleById(Integer classId);
	
	public String updateClassByPK(TClass cl);
	
	public String deleteClassByPK(Integer classId);
	
	public String insertClass(TClass cl);
	
	public List<TClass> getAllClass4Select(Integer teacherid);
	
}
