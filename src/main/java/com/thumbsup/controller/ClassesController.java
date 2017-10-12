package com.thumbsup.controller;

import java.io.IOException;
import java.util.List;

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
import com.thumbsup.dto.TClass;
import com.thumbsup.dto.TClasstype;
import com.thumbsup.dto.TTeacher;
import com.thumbsup.serviceImp.ClassTypeServiceImp;
import com.thumbsup.serviceImp.ClassesServiceImp;
import com.thumbsup.utils.PageResult;
import com.thumbsup.vo.VO4ClassSingle_Rtn;

@Controller
public class ClassesController {

	@Resource
	private ClassesServiceImp classesServiceImp;
	@Resource
	private ClassTypeServiceImp classTypeServiceImp;

	/**
	 * 
	 * 分页获取所有班级
	 * 
	 * @param model
	 * @param pageNum  页数
	 * @param session  session存储分页信息
	 * @return
	 */
	@RequestMapping(value = "/getAllClass")
	public @ResponseBody String getAllClasses(Model model, Integer pageNum, HttpSession session) {

		if (pageNum == null) {
			pageNum = 1;
		}
		TTeacher teacher = (TTeacher)session.getAttribute("Teacher");
		PageResult<TClass> result = classesServiceImp.getAllClass(pageNum,teacher.getTeacherId());

	
		
		// 数据转Json
		ObjectMapper objmapper = new ObjectMapper();
		String json = null;
		try {

			json = objmapper.writeValueAsString(result.getVolist());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(json);
		session.removeAttribute("pageInfo");
		session.setAttribute("pageInfo", result.getPageInfo());
		// model.addAttribute("pageInfo", result.getPageInfo());

		return json;

	}

	/**
	 * 
	 * 通过班号查看班级信息
	 * 
	 * @param model
	 * @param classId
	 * @param flag
	 * @return
	 */
	@RequestMapping(value = "/SingleClassById")
	public String getSingleClassById(Model model, Integer classId, String flag) {
		System.out.println("进入Controller");

		if (classId == null) {

			return null;

		}

		TClass c_single = classesServiceImp.getClassSingleById(classId);
		TClasstype c_type = classTypeServiceImp.getClassTypeById(c_single.getClassType());

		VO4ClassSingle_Rtn vo4ClassSingle_Rtn = new VO4ClassSingle_Rtn();
		vo4ClassSingle_Rtn.setTclass(c_single);
		vo4ClassSingle_Rtn.setTclasstype(c_type);

		model.addAttribute("classes", vo4ClassSingle_Rtn);

		if ("update".equals(flag)) {

			return "/WEB-INF/classes/classesupdatesingle.jsp";

		}
		return "/WEB-INF/classes/classessingle.jsp";

	}

	/**
	 * 
	 * 通过输入框输入班号查询班级
	 * 
	 * @param model
	 * @param classId  班级id
	 * @return
	 */
	@RequestMapping(value = "/SingleClassByIdInput")
	public @ResponseBody String getSingleClassByIdInput(Model model, Integer classId) {
		System.out.println("进入Controller");

		if (classId == null) {

			return null;

		}

		TClass c_single = classesServiceImp.getClassSingleById(classId);
		TClasstype c_type = classTypeServiceImp.getClassTypeById(c_single.getClassType());

		VO4ClassSingle_Rtn vo4ClassSingle_Rtn = new VO4ClassSingle_Rtn();
		vo4ClassSingle_Rtn.setTclass(c_single);
		vo4ClassSingle_Rtn.setTclasstype(c_type);
		ObjectMapper objmapper = new ObjectMapper();
		String json = null;

		try {
			json = objmapper.writeValueAsString(vo4ClassSingle_Rtn);
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

	/**
	 * 修改班级信息，需要传入页数，班级id 修改完成后，通过页数查询
	 * 
	 * @param model
	 * @param classId 班级id
	 * @return
	 */
	@RequestMapping(value = "/updateSingeClassByPK")
	public String updateSingeClassById(Model model, TClass cl) {
		System.out.println("ID：" + cl.getClassId() + ",Name:" + cl.getClassName());
		String msg = classesServiceImp.updateClassByPK(cl);
		System.out.println(msg);
		model.addAttribute("msg", msg);
		return "/WEB-INF/classes/classestable.jsp";
	}

	/**
	 * 通过主键班级id删除班级
	 * 
	 * @param model
	 * @param classId 班级id
	 * @return
	 */
	@RequestMapping(value = "/deleteClassByPK")
	public @ResponseBody String deleteClassByPK(Model model, Integer classId) {

		String msg = classesServiceImp.deleteClassByPK(classId);

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
	 * 添加班级方法
	 * 
	 * @param model
	 * @param cl 组成班级bean
	 * @return
	 */
	@RequestMapping(value = "/insertClass")
	public String insertClass(Model model, TClass cl,HttpSession session) {
		cl.setClassNumbers(0);
		TTeacher teacher =(TTeacher)session.getAttribute("Teacher");
		cl.setClassFromteacher(teacher.getTeacherId());
		String msg = classesServiceImp.insertClass(cl);
		model.addAttribute("msg", msg);

		System.out.println(msg);
		return "WEB-INF/classes/classestable.jsp";

	}

	/**
	 * 
	 * 分页信息类存储在session中，由于前端需要分页栏，通过把分页信息类转json通过ajax返回前端
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "getPageSession")
	public @ResponseBody String getPageSession(HttpSession session) {

		ObjectMapper page = new ObjectMapper();
		PageInfo pageInfo = (PageInfo) session.getAttribute("pageInfo");
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
	
	@RequestMapping(value = "/getAllClass4Select")
	public @ResponseBody String getAllClass4Select(Model model,HttpSession session) {

		
		TTeacher teacher = (TTeacher)session.getAttribute("Teacher");
		List<TClass> clist = classesServiceImp.getAllClass4Select(teacher.getTeacherId());

		// 数据转Json
		ObjectMapper objmapper = new ObjectMapper();
		String json = null;
		try {

			json = objmapper.writeValueAsString(clist);
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
