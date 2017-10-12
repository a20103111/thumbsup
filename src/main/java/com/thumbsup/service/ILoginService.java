package com.thumbsup.service;

import com.thumbsup.dto.TStudent;
import com.thumbsup.vo.VO4Login_Rtn;

public interface ILoginService {
	
	public VO4Login_Rtn selectStudentByUserName(String StudentUserName,String StudentPassWord);
	
	public VO4Login_Rtn selectTeacherByUserName(String StudentUserName,String StudentPassWord);
	
	public VO4Login_Rtn selectAdminByUserName(String StudentUserName,String StudentPassWord);
	
}
