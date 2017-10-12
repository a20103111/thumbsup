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

import com.github.pagehelper.PageInfo;
import com.thumbsup.dto.TComment;
import com.thumbsup.dto.TThumbs;
import com.thumbsup.serviceImp.CommentServiceImp;
import com.thumbsup.serviceImp.ThumbsServiceImp;
import com.thumbsup.utils.PageResult;
import com.thumbsup.vo.VO4Count_Rtn;

@Controller
public class ThumbsController {
	
	@Resource
	private ThumbsServiceImp thumbsServiceImp;
	@Resource
	private CommentServiceImp commentServiceImp;
	
	
	@RequestMapping(value="getThumbsByKey")
	public @ResponseBody String getThumbsByKey(String createTime,Integer ClassId,Integer pageNum,HttpSession session){
		
		System.out.println(createTime+"："+ClassId);
		if(pageNum==null){
			
			pageNum=1;
			
		}
		
		PageResult<TThumbs> pageResult = thumbsServiceImp.getThumbsByKey(ClassId, createTime,pageNum);
		
		
		ObjectMapper objMapper = new ObjectMapper();
		
		
		String json = "";
		
		try {
			json = objMapper.writeValueAsString(pageResult.getResultList());
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
		
		session.setAttribute("ThumbsPageInfo", pageResult.getPageInfo());
		
		System.out.println(json);
		
		return json;
		
	}
	@RequestMapping(value = "getThumbpsPageSession")
	public @ResponseBody String getPageSession(HttpSession session) {

		ObjectMapper page = new ObjectMapper();
		PageInfo pageInfo = (PageInfo) session.getAttribute("ThumbsPageInfo");
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

		System.out.println(json);

		return json;

	}
	
	@RequestMapping(value="/getAvag")
	public @ResponseBody String getAvag(Integer ClassId,String createTime,String TeacherName){
		String json="";
		ObjectMapper objMapper = new ObjectMapper();
		Map<String, Double> map = thumbsServiceImp.getAvagByKey(ClassId, createTime,TeacherName);
		
		try {
			json = objMapper.writeValueAsString(map);
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
		
		
		System.out.println(json);
		
		
		return json;
	}
	
	@RequestMapping(value="/getCount")
	public @ResponseBody String getCount(Integer ClassId,String createTime,String TeacherName){
		String json="";
		ObjectMapper objMapper = new ObjectMapper();
		 VO4Count_Rtn vo = thumbsServiceImp.getCountByKey(ClassId, createTime,TeacherName);
		
		try {
			json = objMapper.writeValueAsString(vo);
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
		
		
		System.out.println(json);
		
		
		return json;
	}
	
	

}
