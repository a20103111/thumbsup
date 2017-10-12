package com.thumbsup.service;

import java.io.InputStream;
import java.util.List;

import com.thumbsup.dto.TStudent;
import com.thumbsup.utils.PageResult;

public interface IStudentService {

	public PageResult<TStudent> getAllStudent(Integer pageNum,Integer teacherid);
	public TStudent getStudentById(Integer StudentId);
	public String deleteStudentById(Integer StudentId);
	public String updateStudentByPK(TStudent Student);
	public String insertStudent(TStudent Student);
	public PageResult<TStudent> selectStudentByKey(String StudentName,Integer ClassId,Integer teacherid);
	public List<TStudent> getAllStudentsNoKey(Integer teacherId);
	
}
