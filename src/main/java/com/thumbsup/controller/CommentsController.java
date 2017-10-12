package com.thumbsup.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.thumbsup.dto.TComment;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TTeacher;
import com.thumbsup.dto.TThumbs;
import com.thumbsup.serviceImp.CommentServiceImp;
import com.thumbsup.serviceImp.StudentServiceImp;
import com.thumbsup.serviceImp.TeacherServiceImp;
import com.thumbsup.serviceImp.ThumbsServiceImp;
import com.thumbsup.utils.PageResult;
@Controller
public class CommentsController {
	@Resource
	private CommentServiceImp commentServiceImp;
	@Resource
	private TeacherServiceImp teacherServiceImp;
	@Resource
	private ThumbsServiceImp thumbsServiceImp;
	@Resource
	private StudentServiceImp studentServiceImp;
	
	@RequestMapping(value="/getComments")
	public @ResponseBody String getAllComments(Integer pageNum,HttpSession session){
		
		if(pageNum==null){
			
			pageNum=1;
			
		}

		PageResult<TComment> pageResult = commentServiceImp.getAllComment(pageNum);
		String json=getJson(pageResult);
		session.setAttribute("CommentsPageInfo", pageResult.getPageInfo());
		return json;
		
	}
	
	@RequestMapping(value="getCommentByPk")
	public String getCommentByPk(Model model,Integer CommentId){
		
		
		TComment tcomment = commentServiceImp.getCommentByPK(CommentId);
		model.addAttribute("comment",tcomment);
		
		return "/WEB-INF/admin/thumbups/commentSingle.jsp";
	}
	
	@RequestMapping(value = "/deleteCommentByPK")
	public @ResponseBody String deleteThumbsByPK(Model model, Integer CommentId) {

		String msg = commentServiceImp.removeCommentByPk(CommentId);
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
	

	@RequestMapping(value = "/InsertComment")
	public  String InsertComment(Model model,Integer teacherId ,Integer score,TComment tComment,HttpSession session){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		TStudent student = (TStudent) session.getAttribute("Student");
		 TTeacher teacher = teacherServiceImp.getTeacherByPk(teacherId);
		 
		//---封装点赞Bean
		TThumbs thumbs = new TThumbs();
		thumbs.setScore(score);
		thumbs.setCretetime(sdf.format(new Date()));
		thumbs.setStudentName(student.getStudentName());
		thumbs.setTeacherId(teacherId);
		thumbs.setTeacherName(teacher.getTeacherName());
		thumbs.setClassId(student.getStudentClassid());
		thumbs.setStudentId(student.getStudentId());
		//封装留言Bean
		tComment.setStudentId(student.getStudentId());
		tComment.setStudentName(student.getStudentName());
		tComment.setStudentPhone(student.getStudentPhone());
		tComment.setCreatetime(sdf.format(new Date()));
		tComment.setForteacherid(teacherId);
		tComment.setStudentFromclassid(student.getStudentClassid());
		
		
		String msg = commentServiceImp.insertComment(tComment);
		String msg2 = thumbsServiceImp.InsertThumbs(thumbs);
		 TThumbs thb = thumbsServiceImp.getThumbsByKey(student.getStudentId(),teacherId);
		if("022".equals(msg)&&"024".equals(msg2)){
			
			TComment comment = commentServiceImp.getCommentByKey(tComment.getStudentId(), tComment.getForteacherid());
			
			student.setStudentIsthumbs("1");
			studentServiceImp.updateStudentByPK(student);
			session.setAttribute("Student", student);
			model.addAttribute("Comment", comment);
			model.addAttribute("teacher",teacher);
			model.addAttribute("Thumb", thb);
			return "WEB-INF/thumbsupPage/thumpsed.jsp";
		}
		
		
		return "WEB-INF/thumbsupPage/thumps.jsp";

	}
	
	
	
	
	
	@RequestMapping(value = "getCommentsPageSession")
	public @ResponseBody String getPageSession(HttpSession session) {

		ObjectMapper page = new ObjectMapper();
		PageInfo pageInfo = (PageInfo) session.getAttribute("CommentsPageInfo");
		String json = null;

		try {
			json = page.writeValueAsString(pageInfo);
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
