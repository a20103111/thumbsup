package com.thumbsup.serviceImp;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.annotation.Resources;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.thumbsup.dto.TClass;
import com.thumbsup.dto.TClassExample;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TStudentExample;
import com.thumbsup.mapper.TClassMapper;
import com.thumbsup.mapper.TClasstypeMapper;
import com.thumbsup.mapper.TStudentMapper;
import com.thumbsup.service.IClassesService;
import com.thumbsup.utils.PageResult;
import com.thumbsup.vo.VO4Classes_Rtn;

@Service
public class ClassesServiceImp implements IClassesService {

	@Resource
	private TClassMapper tClassMapper;
	@Resource
	private TStudentMapper tStudentMapper;
	@Resource
	private TClasstypeMapper tClasstypeMapper;

	@Override
	public PageResult<TClass> getAllClass(Integer pageNum,Integer teacherid) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 10); 
		TClassExample tClassExample = new TClassExample();
		tClassExample.createCriteria().andClassFromteacherEqualTo(teacherid);
		List<VO4Classes_Rtn> volist = new ArrayList<VO4Classes_Rtn>();		
		List<TClass> clist = tClassMapper.selectByExample(tClassExample);
		
		
		for(int i=0;i<clist.size();i++){
			VO4Classes_Rtn vo = new VO4Classes_Rtn();
			
			vo.setClassId(clist.get(i).getClassId());
			vo.setClassCreatetime(clist.get(i).getClassCreatetime());
			vo.setClassEndtime(clist.get(i).getClassEndtime());
			vo.setClassFromteacher(clist.get(i).getClassFromteacher());
			vo.setClassName(clist.get(i).getClassName());
			vo.setClassNumbers(clist.get(i).getClassNumbers());
			vo.setTypeName(tClasstypeMapper.selectByPrimaryKey(clist.get(i).getClassType()).getTypeName());
			
			volist.add(vo);
			
		}
		
		PageInfo<TClass> pageInfo = new PageInfo<>(clist);
		
		PageResult<TClass> result = new PageResult<>();
		result.setPageInfo(pageInfo);
		result.setResultList(clist);
		result.setVolist(volist);
		
		return result;
	}

	@Override
	public TClass getClassSingleById(Integer classId) {
		// TODO Auto-generated method stub
		TClassExample tClassExample = new TClassExample();

		TClass c_single = tClassMapper.selectByPrimaryKey(classId);

		return c_single;
	}

	@Override
	public String updateClassByPK(TClass cl) {
		// TODO Auto-generated method stub

		String msg = "";
		int flag = tClassMapper.updateByPrimaryKeySelective(cl);

		if (flag > 0) {

			msg = "001";
			return msg;
		}
		msg = "002";

		return msg;
	}

	@Override
	public String deleteClassByPK(Integer classId) {
		// TODO Auto-generated method stub
		
		String msg = "";
		TStudentExample tStudentExample = new TStudentExample();
		int flag = tClassMapper.deleteByPrimaryKey(classId);
		tStudentExample.createCriteria().andStudentClassidEqualTo(classId);
		
		//--判断该班级是否存在学生，级联删除
		List<TStudent> slist = tStudentMapper.selectByExample(tStudentExample);
		
		if(slist.size()>0){
			
			tStudentMapper.deleteByExample(tStudentExample);
			
			
		}
		//--级联删除结束
		
		
		

		if (flag > 0) {

			msg = "003";
			return msg;

		}

		msg = "004";

		return msg;
	}

	@Override
	public String insertClass(TClass cl) {
		// TODO Auto-generated method stub
		String msg = "";
		int flag = tClassMapper.insert(cl);

		if (flag > 0) {

			msg = "005";
			return msg;
		}

		msg = "006";
		return msg;
	}

	@Override
	public List<TClass> getAllClass4Select(Integer teacherid) {
		// TODO Auto-generated method stub
		
		TClassExample tClassExample = new TClassExample();
		tClassExample.createCriteria().andClassFromteacherEqualTo(teacherid);

		List<TClass> clist = tClassMapper.selectByExample(tClassExample);
		
		
		return clist;
	}

}
