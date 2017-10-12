package com.thumbsup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	@RequestMapping("/dash")
	public String test(Model model){
		
		return "/WEB-INF/dashboard.jsp";
	
	}
	
	@RequestMapping("/classes")
	public String gomain(Model model){
		return "/WEB-INF/classes/classestable.jsp";
	
	}
	@RequestMapping("/students")
	public String goStudent(Model model){
		return "/WEB-INF/teacher/StudentTable.jsp";
	
	}
	@RequestMapping("/classsingle")
	public String getclasssingle(Model model){
		return "/WEB-INF/classes/classessingle.jsp";
	
	}
	
	@RequestMapping("/updatesingle")
	public String getupdateclasses(Model model){
		return "/WEB-INF/classes/classesupdatesingle.jsp";
	
	}
	
	@RequestMapping("/addClass")
	public String addClass(Model model){
		return "/WEB-INF/classes/addClass.jsp";
	
	}
	@RequestMapping("/addStudent")
	public String addStudent(Model model){
		return "/WEB-INF/teacher/addStudent.jsp";
	
	}
	
	@RequestMapping("/thumbsup")
	public String tothumbsupTable(Model model){
		return "/WEB-INF/thumbsup/ThumbsupTable.jsp";
	
	}
	
	@RequestMapping("/comments")
	public String toComments(Model model){
		return "/WEB-INF/thumbsup/CommentTable.jsp";
	
	}
	
	@RequestMapping(value="/login")
	public String login(Model model){
	
		return "/WEB-INF/admin/adminboard.jsp";
		
	}
	
	@RequestMapping(value="/toTeahcer")
	public String toTeahcer(Model model){
	
		return "/WEB-INF/admin/teacher/TeacherTable.jsp";
		
	}
	
	@RequestMapping(value="/toAddTeahcer")
	public String toAddTeahcer(Model model){
	
		return "/WEB-INF/admin/teacher/addTeacher.jsp";
		
	}
	
	@RequestMapping(value="/toadminThumbup")
	public String toadminThumbup(Model model){
	
		return "/WEB-INF/admin/thumbups/ThumbsupTable.jsp";
		
	}
	@RequestMapping(value="/toadminComments")
	public String toadminComments(Model model){
	
		return "/WEB-INF/admin/thumbups/CommentTable.jsp";
		
	}
	
	@RequestMapping(value="/toStudentLogin")
	public String toStudentLogin(Model model){
	
		return "/WEB-INF/thumbsupPage/login.jsp";
		
	}
	@RequestMapping(value="/toStudentIndex")
	public String toStudentIndex(Model model){
	
		return "/WEB-INF/thumbsupPage/index.jsp";
		
	}
	@RequestMapping(value="/toImportStudent")
	public String toImportStudent(Model model){
	
		return "/WEB-INF/teacher/importStudent.jsp";
		
	}

}
