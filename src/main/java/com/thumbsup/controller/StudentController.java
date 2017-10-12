package com.thumbsup.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TTeacher;
import com.thumbsup.serviceImp.StudentServiceImp;
import com.thumbsup.utils.ExcelUtil;
import com.thumbsup.utils.Md5Utils;
import com.thumbsup.utils.PageResult;

@Controller
public class StudentController {
		
	@Resource
	private StudentServiceImp studentServiceImp;
	
	
	@RequestMapping(value="/getAllStuent")
	public @ResponseBody String getAllStudent(Integer pageNum,HttpSession session){
		
		TTeacher teacher = (TTeacher)session.getAttribute("Teacher");
		 PageResult<TStudent> pageResult = studentServiceImp.getAllStudent(pageNum,teacher.getTeacherId());
		 String json=getJson(pageResult);
		 session.setAttribute("StudentPageInfo", pageResult.getPageInfo());
		 return json;
	}
	/**
	 * 
	 * 分页信息类存储在session中，由于前端需要分页栏，通过把分页信息类转json通过ajax返回前端
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "getStudentPageSession")
	public @ResponseBody String getPageSession(HttpSession session) {

		ObjectMapper page = new ObjectMapper();
		PageInfo pageInfo = (PageInfo) session.getAttribute("StudentPageInfo");
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
	@RequestMapping(value="/getStudentById")
	public String getStudentById(Model model,Integer StudentId){
		
		System.out.println("学生Id:"+StudentId);
		TStudent student = studentServiceImp.getStudentById(StudentId);
		
		model.addAttribute("student",student);
		
		return "WEB-INF/teacher/StudentUpdateSingle.jsp?StudentId="+StudentId;
	}
	
	
	@RequestMapping(value="/deleteStudentById")
	public @ResponseBody String deleteStudentById(Integer StudentId){
		
		System.out.println("学生Id:"+StudentId);
		String msg = studentServiceImp.deleteStudentById(StudentId);
		ObjectMapper objmapper = new ObjectMapper();
		String json = "";

		try {
			json = objmapper.writeValueAsString(msg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(json);
		
		return json;
	}
	
	@RequestMapping(value="/updateStudent")
	public String updateStudent(Model model,TStudent Student){
		String Password = Student.getStudentPassword();
		//System.out.println(Student.getStudentId());
		if(Password!=null||!("").equals(Password)){
			
			Student.setStudentPassword(Md5Utils.encode(Password));
			
			
		}
		String msg = studentServiceImp.updateStudentByPK(Student);
		
		model.addAttribute("msg",msg);
		
		return "WEB-INF/teacher/StudentTable.jsp";
	}
	
	@RequestMapping(value="/insertStudent")
	public String insertStudent(Model model,TStudent Student,HttpSession session){
		String Password = Student.getStudentPassword();
		TTeacher teacher = (TTeacher)session.getAttribute("Teacher");
		Student.setStudentFromteacher(teacher.getTeacherId());
		if(Password!=null||!("").equals(Password)){
			
			Student.setStudentPassword(Md5Utils.encode(Password));
			
			
		}
		
		String msg = studentServiceImp.insertStudent(Student);
		
		model.addAttribute("msg",msg);
		
		return "WEB-INF/teacher/StudentTable.jsp";
	}
	
	@RequestMapping(value="/selectStudentByKey")
	public @ResponseBody String selectStudentByKey(String StudentName,Integer ClassId,HttpSession session){
//		if((StudentName==null||"".equals(StudentName)) && (ClassId==null||ClassId==0)){
//			
//			return getAllStudent(1, session);
//
//		}
		//System.out.println(StudentName+":"+ClassId);
		TTeacher teacher = (TTeacher)session.getAttribute("Teacher");
		PageResult<TStudent> pageResult = studentServiceImp.selectStudentByKey(StudentName, ClassId,teacher.getTeacherId());
		
		
		String json=getJson(pageResult);
		
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
	
	@RequestMapping(value="exportStudent")
	public  ResponseEntity<byte[]>  exportStudent(HttpSession session){
		TTeacher teacher = (TTeacher)session.getAttribute("Teacher");
		List<TStudent> exports = studentServiceImp.getAllStudentsNoKey(teacher.getTeacherId());
		
		
		// 执行excel导出
		
		
		
		
					ExcelUtil excelutil = new ExcelUtil();
					File file = new File("D:" + File.separator + "ExportDownload");

					if (!file.exists())
						file.mkdirs();
					
					
					File file1 = new File(
							"D:" + File.separator + "ExportDownload" + File.separator + new Date().getTime() + ".xls");

					if (!file1.exists()) {
						try {
							file1.createNewFile();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					try {
						// 输出流
						FileOutputStream fos = new FileOutputStream(file1);
						excelutil.exportDataToExcel(exports,
								new String[] {"学号","学生姓名","班号","入学时间","学生电话","选择课程","班主任编号","学生账号","密码","是否评分"},
								"Export", fos);
					} catch (FileNotFoundException e) {
						e.printStackTrace();
					}

					String filePath = file1.getPath();
					File exportFile = new File(filePath);
					String dfileName = null;
					try {
						dfileName = new String(exportFile.getName().getBytes("utf-8"), "utf-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					HttpHeaders headers = new HttpHeaders();
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.setContentDispositionFormData("attachment", dfileName);
					try {
						return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(exportFile), headers,
								HttpStatus.CREATED);
					} catch (IOException e) {
						e.printStackTrace();
					}
					return null;
	
	}
}




