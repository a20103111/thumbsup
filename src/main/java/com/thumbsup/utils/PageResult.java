package com.thumbsup.utils;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.thumbsup.vo.VO4Classes_Rtn;

public class PageResult<T> {
	private List<T> resultList;
	private PageInfo<T> pageInfo;
	private List<VO4Classes_Rtn> volist;
	
	
	public List<VO4Classes_Rtn> getVolist() {
		return volist;
	}
	public void setVolist(List<VO4Classes_Rtn> volist) {
		this.volist = volist;
	}
	public List<T> getResultList() {
		return resultList;
	}
	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}
	public PageInfo<T> getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(PageInfo<T> pageInfo) {
		this.pageInfo = pageInfo;
	}
	
	
	
	
	
}
