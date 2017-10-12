package com.thumbsup.service;

import com.thumbsup.dto.TTeacher;
import com.thumbsup.utils.PageResult;

public interface ITeacherService {
	
	public PageResult<TTeacher> getAllTeachers(Integer pageNum);
	public PageResult<TTeacher> getAllTeacherByKey(String TeacherName);
	public String insertTeacher(TTeacher Teacher);
	public String updateTeacher(TTeacher Teacher);
	public String removeTeacher(Integer TeacherId);
	public TTeacher getTeacherByPk(Integer TeacherId);
}
