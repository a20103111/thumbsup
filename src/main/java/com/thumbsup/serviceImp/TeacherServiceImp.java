package com.thumbsup.serviceImp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.thumbsup.dto.TClass;
import com.thumbsup.dto.TClassExample;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TStudentExample;
import com.thumbsup.dto.TTeacher;
import com.thumbsup.dto.TTeacherExample;
import com.thumbsup.mapper.TClassMapper;
import com.thumbsup.mapper.TStudentMapper;
import com.thumbsup.mapper.TTeacherMapper;
import com.thumbsup.service.ITeacherService;
import com.thumbsup.utils.Md5Utils;
import com.thumbsup.utils.PageResult;

/**
 * @author Lhy
 *
 */
@Service
public class TeacherServiceImp implements ITeacherService {

	private static Integer PAGESIZE = 10;
	
	@Resource
	private TTeacherMapper tTeacherMapper;
	
	@Resource
	private TStudentMapper tStudentMapper;
	
	@Resource
	private TClassMapper tClassMapper;
	
	@Override
	public PageResult<TTeacher> getAllTeachers(Integer pageNum) {
		// TODO Auto-generated method stub
		
		PageResult<TTeacher> pageResult = new PageResult<TTeacher>();
		
		PageHelper.startPage(pageNum, PAGESIZE);
		
		TTeacherExample teacherExample  = new TTeacherExample();
		teacherExample.createCriteria().andTeacherIdIsNotNull();
		
		List<TTeacher> tlist = tTeacherMapper.selectByExample(teacherExample);
		
		PageInfo<TTeacher> pageInfo = new PageInfo<TTeacher>(tlist);
		
		pageResult.setPageInfo(pageInfo);
		pageResult.setResultList(tlist);
		
		return pageResult;
	}
	
	@Override
	public PageResult<TTeacher> getAllTeacherByKey(String TeacherName) {
		// TODO Auto-generated method stub
		PageResult<TTeacher> pageResult = new PageResult<TTeacher>();
		TTeacherExample teacherExample  = new TTeacherExample();
		teacherExample.createCriteria().andTeacherNameEqualTo(TeacherName);
		
		List<TTeacher> tlist = tTeacherMapper.selectByExample(teacherExample);
		
		
		pageResult.setResultList(tlist);
		
		return pageResult;
	}

	@Override
	public String insertTeacher(TTeacher Teacher) {
		// TODO Auto-generated method stub
	
		int flag = tTeacherMapper.insert(Teacher);
		
		if(flag>0){
			
			return "013";
		}
		return "014";
	}

	@Override
	public String updateTeacher(TTeacher Teacher) {
		// TODO Auto-generated method stub
		
		
		
		int flag = tTeacherMapper.updateByPrimaryKeySelective(Teacher);
		if(flag>0){
			
			return "015";
			
		}
		return "016";
	}

	@Override
	public String removeTeacher(Integer TeacherId) {
		// TODO Auto-generated method stub
		TStudentExample tStudentExample = new TStudentExample();
		tStudentExample.createCriteria().andStudentFromteacherEqualTo(TeacherId);
		
		TClassExample tClassExample = new TClassExample();
		tClassExample.createCriteria().andClassFromteacherEqualTo(TeacherId);
		
		
		int flag = tTeacherMapper.deleteByPrimaryKey(TeacherId);
		
		//--删除班主任级联删除属于该老师的学生和班级
		List<TStudent> slist = tStudentMapper.selectByExample(tStudentExample);
		List<TClass> tlist = tClassMapper.selectByExample(tClassExample);
		
		if(slist.size()>0){
			
			
			tStudentMapper.deleteByExample(tStudentExample);
			
		}
		if(tlist.size()>0){
			
			tClassMapper.deleteByExample(tClassExample);
			
		}
		
		//--级联删除完成
		
		
		if(flag>0){
			
			return "017";
			
		}
		return "018";
	}

	@Override
	public TTeacher getTeacherByPk(Integer TeacherId) {
		// TODO Auto-generated method stub
		TTeacher teacher = tTeacherMapper.selectByPrimaryKey(TeacherId);
		return teacher;
	}

}
