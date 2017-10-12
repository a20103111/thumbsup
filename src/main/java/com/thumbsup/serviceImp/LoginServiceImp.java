package com.thumbsup.serviceImp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thumbsup.dto.TAdmin;
import com.thumbsup.dto.TAdminExample;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TStudentExample;
import com.thumbsup.dto.TTeacher;
import com.thumbsup.dto.TTeacherExample;
import com.thumbsup.mapper.TAdminMapper;
import com.thumbsup.mapper.TStudentMapper;
import com.thumbsup.mapper.TTeacherMapper;
import com.thumbsup.service.ILoginService;
import com.thumbsup.utils.Md5Utils;
import com.thumbsup.vo.VO4Login_Rtn;
@Service
public class LoginServiceImp implements ILoginService {

	@Resource
	private TStudentMapper tStudentMapper;
	@Resource
	private TTeacherMapper tTeacherMapper;
	@Resource
	private TAdminMapper tAdminMapper;
	
	
	@Override
	public VO4Login_Rtn selectStudentByUserName(String StudentUserName,String StudentPassword) {
		// TODO Auto-generated method stub
		
		TStudentExample tStudentExample = new TStudentExample();
		tStudentExample.createCriteria().andStudentAccountEqualTo(StudentUserName);
		List<TStudent> tlist = tStudentMapper.selectByExample(tStudentExample);
		VO4Login_Rtn vo = new VO4Login_Rtn();
		String msg="";
		if(tlist.size()>1){
			
			msg="数据库出错，用户名重复！";
			vo.setMsg(msg);
			System.out.println(msg);
			return vo;
		}
		else if(tlist.size()>0&&tlist.size()<=1){
			
			if((Md5Utils.encode(StudentPassword)).equals(tlist.get(0).getStudentPassword())){
				
				msg="登录成功";
				vo.settStudent(tlist.get(0));
				vo.setMsg(msg);
				System.out.println(msg);
				return vo;
				
				
				
			}
			else{
				msg="密码错误";
				vo.setMsg(msg);
				System.out.println(msg);
				return vo;
			}
			
			
		}
		else if(tlist.size()==0){
			
			msg="用户名错误";
			vo.setMsg(msg);
			System.out.println(msg);
			return vo;
			
			
			
		}
		return vo;
		
	}

	@Override
	public VO4Login_Rtn selectTeacherByUserName(String TeacherAccount, String TeacherPassWord) {
		// TODO Auto-generated method stub
		
		TTeacherExample teacherExample = new TTeacherExample();
		
		teacherExample.createCriteria().andTeacherAccountEqualTo(TeacherAccount);
		List<TTeacher> tlist = tTeacherMapper.selectByExample(teacherExample);
		
		VO4Login_Rtn vo = new VO4Login_Rtn();
		String msg="";
		if(tlist.size()>1){
			
			msg="数据库出错，用户名重复！";
			vo.setMsg(msg);
			System.out.println(msg);
			return vo;
		}
		else if(tlist.size()>0&&tlist.size()<=1){
			
			if((Md5Utils.encode(TeacherPassWord)).equals(tlist.get(0).getTeacherPassword())){
				
				msg="登录成功";
				vo.settTeacher(tlist.get(0));
				vo.setMsg(msg);
				System.out.println(msg);
				return vo;
				
				
				
			}
			else{
				msg="密码错误";
				vo.setMsg(msg);
				System.out.println(msg);
				return vo;
			}
			
			
		}
		else if(tlist.size()==0){
			
			msg="用户名错误";
			vo.setMsg(msg);
			System.out.println(msg);
			return vo;
			
			
			
		}
		return vo;
		
	}

	@Override
	public VO4Login_Rtn selectAdminByUserName(String AdminAccount, String AdminPassWord) {
		// TODO Auto-generated method stub
		TAdminExample tAdminExample = new TAdminExample();
		tAdminExample.createCriteria().andAdminAccountEqualTo(AdminAccount);
		List<TAdmin> alist = tAdminMapper.selectByExample(tAdminExample);
		
		VO4Login_Rtn vo = new VO4Login_Rtn();
		String msg="";
		if(alist.size()>1){
			
			msg="数据库出错，用户名重复！";
			vo.setMsg(msg);
			System.out.println(msg);
			return vo;
		}
		else if(alist.size()>0&&alist.size()<=1){
			
			if((Md5Utils.encode(AdminPassWord)).equals(alist.get(0).getAdminPassword())){
				
				msg="登录成功";
				vo.settAdmin(alist.get(0));
				vo.setMsg(msg);
				System.out.println(msg);
				return vo;
				
				
				
			}
			else{
				msg="密码错误";
				vo.setMsg(msg);
				System.out.println(msg);
				return vo;
			}
			
			
		}
		else if(alist.size()==0){
			
			msg="用户名错误";
			vo.setMsg(msg);
			System.out.println(msg);
			return vo;
			
			
			
		}
		return vo;
	}

}
