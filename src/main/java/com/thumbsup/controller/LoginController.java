package com.thumbsup.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thumbsup.dto.TAdmin;
import com.thumbsup.dto.TComment;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TTeacher;
import com.thumbsup.dto.TThumbs;
import com.thumbsup.serviceImp.CommentServiceImp;
import com.thumbsup.serviceImp.LoginServiceImp;
import com.thumbsup.serviceImp.TeacherServiceImp;
import com.thumbsup.serviceImp.ThumbsServiceImp;
import com.thumbsup.vo.VO4Login_Rtn;

@Controller
public class LoginController {
	
	@Resource
	private LoginServiceImp loginServiceImp;
	@Resource
	private TeacherServiceImp teacherServiceImp;
	@Resource
	private CommentServiceImp commentServiceImp;
	@Resource
	private ThumbsServiceImp thumbsServiceImp;
	
	@RequestMapping("/Studentlogin")
	public String  Studentlogin(Model model,String userName,String passWord,String code,HttpSession session){
		System.out.println("账号："+userName+"密码："+passWord+"验证码："+code);
		
		
		String randomCode = (String)session.getAttribute("randomCode");
		
		if(!code.equalsIgnoreCase(randomCode)){
			
			
			model.addAttribute("msg","验证码错误");
			
			return "WEB-INF/thumbsupPage/login.jsp";
		}
		VO4Login_Rtn vo4Login_Rtn = loginServiceImp.selectStudentByUserName(userName, passWord);
		TStudent student = vo4Login_Rtn.gettStudent();
		if(vo4Login_Rtn.gettStudent()!=null){
			
			session.setAttribute("Student",student);
			TTeacher teacher = teacherServiceImp.getTeacherByPk(vo4Login_Rtn.gettStudent().getStudentFromteacher());
			model.addAttribute("teacher",teacher);
			
			if("1".equals(student.getStudentIsthumbs())){
				
				TComment comment = commentServiceImp.getCommentByKey(student.getStudentId(), student.getStudentFromteacher());
				TThumbs thumb = thumbsServiceImp.getThumbsByKey(student.getStudentId(), student.getStudentFromteacher());
				
				model.addAttribute("Comment", comment);
				model.addAttribute("Thumb", thumb);
				return "WEB-INF/thumbsupPage/thumpsed.jsp";
				
			}
			return "WEB-INF/thumbsupPage/thumps.jsp";
		}
		
		
		model.addAttribute("msg",vo4Login_Rtn.getMsg());
		
		return "WEB-INF/thumbsupPage/login.jsp";
	}
	
	
	
@RequestMapping("/ManagerLogin")
public String  ManagerLogin(Model model,String userName,String passWord,String type,HttpSession session){
	System.out.println("账号："+userName+"密码："+passWord+"type:"+type);
	
	if("1".equals(type)){
		
		
		VO4Login_Rtn vo4Login_Rtn = loginServiceImp.selectTeacherByUserName(userName, passWord);
		TTeacher teacher = vo4Login_Rtn.gettTeacher();
		
		if(teacher!=null){
			
			session.setAttribute("Teacher",teacher);
			return "WEB-INF/dashboard.jsp";
			
		}
		else{
			
			model.addAttribute("msg",vo4Login_Rtn.getMsg());
			
			return "/Managerlogin.jsp";
			
		}
		
	}
	else if("2".equals(type)){
		VO4Login_Rtn vo4Login_Rtn = loginServiceImp.selectAdminByUserName(userName, passWord);
		TAdmin admin = vo4Login_Rtn.gettAdmin();
		
		if(admin!=null){
			
			session.setAttribute("Admin",admin);
			return "WEB-INF/admin/adminboard.jsp";
		}
		else{
			
			model.addAttribute("msg",vo4Login_Rtn.getMsg());
			
			return "/Managerlogin.jsp";
			
		}
		
		
		
	}
	
	model.addAttribute("msg","系统异常登录失败");
	
	return "/Managerlogin.jsp";
}

@RequestMapping("/Adminlogout")
public String Adminlogout(HttpSession session){
	
	
	
	session.removeAttribute("Teacher");
	session.removeAttribute("Student");
	session.removeAttribute("Admin");
	
	
	return "/Managerlogin.jsp";
	
}
@RequestMapping("/Teacherlogout")
public String Teacherlogout(HttpSession session){
	
	
	
	session.removeAttribute("Teacher");
	session.removeAttribute("Student");
	session.removeAttribute("Admin");
	return "/Managerlogin.jsp";
	
}




}


