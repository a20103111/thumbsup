package com.thumbsup.vo;

import com.thumbsup.dto.TAdmin;
import com.thumbsup.dto.TStudent;
import com.thumbsup.dto.TTeacher;
import com.thumbsup.dto.TThumbs;

public class VO4Login_Rtn {
	private TStudent tStudent;
	private TTeacher tTeacher;
	private TAdmin tAdmin;
	private String msg;
	public TAdmin gettAdmin() {
		return tAdmin;
	}
	public void settAdmin(TAdmin tAdmin) {
		this.tAdmin = tAdmin;
	}
	
	public TStudent gettStudent() {
		return tStudent;
	}
	public void settStudent(TStudent tStudent) {
		this.tStudent = tStudent;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public TTeacher gettTeacher() {
		return tTeacher;
	}
	public void settTeacher(TTeacher tTeacher) {
		this.tTeacher = tTeacher;
	}
	
	
	
	
}
