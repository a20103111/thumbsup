package com.thumbsup.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.thumbsup.dto.TTeacher;
import com.thumbsup.serviceImp.TeacherServiceImp;
import com.thumbsup.utils.Md5Utils;
import com.thumbsup.utils.PageResult;

/**
 * 
 * 
 * 
 * @author Lhy
 *
 */

@Controller
public class AdminController {

	@Resource
	private TeacherServiceImp teacherServiceImp;
	
	/**
	 * 根据页数获取班主任信息
	 * @param pageNum 页数
	 * @param session 
	 * @return
	 */
	@RequestMapping(value="/getAllTeachers")
	public @ResponseBody String getAllTeachers(Integer pageNum,HttpSession session){
		
		if(pageNum==null){
			
			
			pageNum=1;
			
			
		}
		
		PageResult<TTeacher> pageResult = teacherServiceImp.getAllTeachers(pageNum);
		
		
		
		String json = getJson(pageResult);
		
		session.setAttribute("teacherPageInfo", pageResult.getPageInfo());
		
		
		
		return json;
		
		
	}
	
	/**
	 * 
	 * 通过班主任名字获取班主任信息
	 * 
	 * @param TeacherName
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/getTeacherByKey")
	public @ResponseBody String getTeacherByKey(String TeacherName,HttpSession session){
		
		
		PageResult<TTeacher> pageResult = teacherServiceImp.getAllTeacherByKey(TeacherName);
		
		String json = getJson(pageResult);
		
		System.out.println(json);
		
		return json;
		
		
	}
	
	/**
	 * 通过版主任id获取班主任
	 * @param model
	 * @param TeacherId
	 * @param flag
	 * @return
	 */
	@RequestMapping(value="/getTeacherByPK")
	public  String getTeacherByPK(Model model,Integer TeacherId,String flag){
		
		TTeacher teacher = teacherServiceImp.getTeacherByPk(TeacherId);
		
		
		model.addAttribute("teacher",teacher);
		if("update".equals(flag)){
			
			
			return "/WEB-INF/admin/teacher/teacherUpdateSingle.jsp";
			
			
		}
		
		//PageResult<TTeacher> pageResult = teacherServiceImp.getAllTeacherByKey(TeacherName);

		
		return "/WEB-INF/admin/teacher/addTeacher.jsp";
		
		
	}
	
	/**
	 * 插入班主任
	 * @param model
	 * @param teacher
	 * @return
	 */
	@RequestMapping(value="/insertTeacher")
	public  String insertTeacher(Model model,TTeacher teacher){
		String Password = teacher.getTeacherPassword();
		//System.out.println(Student.getStudentId());
		if(Password!=null||!("").equals(Password)){
			
			teacher.setTeacherPassword(Md5Utils.encode(Password));
			
			
		}
		
		String msg = teacherServiceImp.insertTeacher(teacher);
		
		//String json = getJson(pageResult);
		model.addAttribute("msg", msg);
		
		return "/WEB-INF/admin/teacher/TeacherTable.jsp";
		
		
	}
	
	/**
	 * 修改班主任信息
	 * @param model
	 * @param teacher
	 * @return
	 */
	@RequestMapping(value="/updateTeacher")
	public  String updateTeacher(Model model,TTeacher teacher){
		String Password = teacher.getTeacherPassword();
		//System.out.println(Student.getStudentId());
		if(Password!=null||!("").equals(Password)){
			
			teacher.setTeacherPassword(Md5Utils.encode(Password));
			
			
		}
		
		String msg = teacherServiceImp.updateTeacher(teacher);
		
		//String json = getJson(pageResult);
		model.addAttribute("msg", msg);
		
		return "/WEB-INF/admin/teacher/TeacherTable.jsp";
	}
	
	
	/**
	 * 通过班主任id删除班主任
	 * @param model
	 * @param TeacherId
	 * @return
	 */
	@RequestMapping(value = "/deleteTeacherByPK")
	public @ResponseBody String deleteTeacherByPK(Model model, Integer TeacherId) {

		String msg = teacherServiceImp.removeTeacher(TeacherId);

		ObjectMapper objmapper = new ObjectMapper();

		String json = "";

		try {
			json = objmapper.writeValueAsString(msg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return json;

	}
	
	
	

	
	/**
	 * 通过json返回班主任分页栏
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/getTeacherPageSession")
	public @ResponseBody String getTeacherPageSession(HttpSession session){
		
		
		PageInfo<TTeacher> pageInfo = (PageInfo<TTeacher>)session.getAttribute("teacherPageInfo");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String json="";
		try {
			json = objectMapper.writeValueAsString(pageInfo);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return json;
		
	}
	
	
	/**
	 * 数据转json方法
	 * @param pageResult
	 * @return
	 */
	public <T> String getJson(PageResult<T> pageResult){
		ObjectMapper objectMapper = new ObjectMapper();
		
		String json="";
		
		try {
			json = objectMapper.writeValueAsString(pageResult.getResultList());
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return json;
		
		
		
	}
	
}
