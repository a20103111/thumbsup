package com.thumbsup.controller;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thumbsup.dto.TThumbs;
import com.thumbsup.serviceImp.ThumbsServiceImp;
import com.thumbsup.utils.PageResult;

@Controller
public class AdminThumbsController {
	
	@Resource
	private ThumbsServiceImp thumbsServiceImp;
	
	
	
	@RequestMapping(value="/getAdminThumbsByKey")
	public @ResponseBody String getAdminThumbsByKey(Integer classId,String createTime,String TeacherName,Integer pageNum,HttpSession session){
		
		if(pageNum==null){
			
			pageNum=1;
			
		}
		
		
		PageResult<TThumbs> pageResult = thumbsServiceImp.getAdminThumbsByKey(classId, createTime, TeacherName, pageNum);
		
		String json = getJson(pageResult);
		session.setAttribute("ThumbsPageInfo", pageResult.getPageInfo());
		return json;
	}
	
	
	
	
	
	@RequestMapping(value = "/deleteThumbsByPK")
	public @ResponseBody String deleteThumbsByPK(Model model, Integer teacherId) {

		String msg = thumbsServiceImp.removeThumbsupByPk(teacherId);
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
