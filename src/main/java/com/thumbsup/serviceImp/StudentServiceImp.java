package com.thumbsup.serviceImp;

import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.thumbsup.dto.TClass;
import com.thumbsup.dto.TClassExample;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TStudentExample;
import com.thumbsup.dto.TStudentExample.Criteria;
import com.thumbsup.mapper.TClassMapper;
import com.thumbsup.mapper.TStudentMapper;
import com.thumbsup.service.IStudentService;
import com.thumbsup.utils.PageResult;

@Service
public class StudentServiceImp implements IStudentService{

	@Resource
	private  TStudentMapper tStudentMapper;
	@Resource
	private TClassMapper tClassMapper;
	@Override
	public PageResult<TStudent> getAllStudent(Integer pageNum,Integer teacherid) {
		// TODO Auto-generated method stub
		PageResult<TStudent> pageResult = new PageResult<TStudent>();
		PageHelper.startPage(pageNum, 10);
		
		
		TStudentExample tStudentExample = new TStudentExample();
		
		tStudentExample.createCriteria().andStudentFromteacherEqualTo(teacherid);
		
		List<TStudent> slist = tStudentMapper.selectByExample(tStudentExample);
		
		PageInfo<TStudent> pageInfo = new PageInfo<TStudent>(slist);
		
		pageResult.setResultList(slist);
		pageResult.setPageInfo(pageInfo);
		
		return pageResult;
	}

	@Override
	public TStudent getStudentById(Integer StudentId) {
		// TODO Auto-generated method stub
		TStudent student = tStudentMapper.selectByPrimaryKey(StudentId);
	
		return student;
	}

	@Override
	public String deleteStudentById(Integer StudentId) {
		// TODO Auto-generated method stub
		
	TStudent student = tStudentMapper.selectByPrimaryKey(StudentId);
		TClassExample tClassExample = new TClassExample();
		TClass tclass = tClassMapper.selectByPrimaryKey(student.getStudentClassid());
		tclass.setClassNumbers(tclass.getClassNumbers()-1);
		tClassMapper.updateByPrimaryKeySelective(tclass);
		
		
		int flag = tStudentMapper.deleteByPrimaryKey(StudentId);
		
		if(flag>0){
			
			
			return "007";
			
			
		}
		
		
		return "008";
	}

	

	@Override
	public String updateStudentByPK(TStudent Student) {
		// TODO Auto-generated method stub
		
		
		if(Student.getStudentId()==null){
			
			return "010";
			
		}
		int flag = tStudentMapper.updateByPrimaryKeySelective(Student);
		if(flag>0){
			return "009";
				
		}
		return "010";
		
	}

	@Override
	public String insertStudent(TStudent Student) {
		// TODO Auto-generated method stub
		TClassExample tClassExample = new TClassExample();
		TClass tclass = tClassMapper.selectByPrimaryKey(Student.getStudentClassid());
		tclass.setClassNumbers(tclass.getClassNumbers()+1);
		tClassMapper.updateByPrimaryKeySelective(tclass);
		
		int flag = tStudentMapper.insert(Student);
		if(flag>0){
			
			
			return "011";
		}
		
		
		
		return "012";
	}

	@Override
	public PageResult<TStudent> selectStudentByKey(String StudentName, Integer ClassId,Integer teacherid) {
		// TODO Auto-generated method stub
		TStudentExample tStudentExample = new TStudentExample();
		Criteria cri = tStudentExample.createCriteria();
		cri.andStudentFromteacherEqualTo(teacherid);
		
		if(StudentName!=null && !"".equals(StudentName)){
			cri.andStudentNameEqualTo(StudentName);
			
		}
		 if(ClassId!=0&&ClassId!=null){
			
			cri.andStudentClassidEqualTo(ClassId);
			
		}
		
		List<TStudent> slist = tStudentMapper.selectByExample(tStudentExample);
		PageResult<TStudent> pageResult = new PageResult<>();
		pageResult.setResultList(slist);
		
		return pageResult;
	}

	@Override
	public List<TStudent> getAllStudentsNoKey(Integer TeacherId) {
		// TODO Auto-generated method stub
		
		TStudentExample tStudentExample = new TStudentExample();
		tStudentExample.createCriteria().andStudentFromteacherEqualTo(TeacherId);
		List<TStudent> list = tStudentMapper.selectByExample(tStudentExample);
		
		return list;
	}

	
	
	
	
	
	

}
