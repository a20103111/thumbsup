package com.thumbsup.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.thumbsup.dto.TAdmin;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TTeacher;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		 //获取请求的URL  
        String url = request.getRequestURI();  
        
        System.out.println(url);
        
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制  
        if(url.indexOf("toStudentLogin.do")>=0||url.indexOf("tlogin.do")>=0||url.indexOf("ManagerLogin.do")>=0
        		||url.indexOf("Teacherlogout.do")>=0||url.indexOf("Adminlogout.do")>=0||url.indexOf("toStudentIndex")>=0){  
            return true;  
        }  
        //获取Session  
        HttpSession session = request.getSession();  
        TStudent student = (TStudent)session.getAttribute("Student");  
        TTeacher teacher =  (TTeacher)session.getAttribute("Teacher"); 
        TAdmin admin = (TAdmin)session.getAttribute("Admin");
        
        if(student != null||teacher!=null||admin!=null){  
            return true;  
        }  
        
        
        if(url.indexOf("toadminThumbup.do")>=0||url.indexOf("toadminComments.do")>=0||url.indexOf("toTeahcer.do")>=0||
        		url.indexOf("dash.do")>=0||url.indexOf("classes.do")>=0||url.indexOf("students.do")>=0
        		||url.indexOf("login.do")>=0||url.indexOf("comments.do")>=0){
        	
        	request.getRequestDispatcher("/Managerlogin.jsp").forward(request, response);  
        	return true;  
        	
        }
        
        //不符合条件的，跳转到登录界面  
        request.getRequestDispatcher("/WEB-INF/thumbsupPage/login.jsp").forward(request, response);  
        return false;  
		
		
	}

}
