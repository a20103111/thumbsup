
package com.thumbsup.serviceImp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.thumbsup.dto.TTeacherExample;
import com.thumbsup.dto.TThumbs;
import com.thumbsup.dto.TThumbsExample;
import com.thumbsup.dto.TThumbsExample.Criteria;
import com.thumbsup.mapper.TTeacherMapper;
import com.thumbsup.mapper.TThumbsMapper;
import com.thumbsup.service.IThumbsService;
import com.thumbsup.utils.PageResult;
import com.thumbsup.vo.VO4Count_Rtn;
@Service
public class ThumbsServiceImp implements IThumbsService {

	@Resource
	private TThumbsMapper tThumbsMapper;
	@Resource
	private TTeacherMapper tTeacherMapper;
	
	
	@Override
	public PageResult<TThumbs> getThumbsByKey(Integer ClassId, String createTime,Integer pageNum) {
		// TODO Auto-generated method stub
		
		
		TThumbsExample thumbsExample = new TThumbsExample();
		Criteria cri = thumbsExample.createCriteria();
		if(ClassId!=null){
			
			cri.andClassIdEqualTo(ClassId);
			
		}
		if(createTime!=null||createTime!=""){
			
			cri.andCretetimeLike(createTime+"%");
			
		}
		
		
		PageHelper.startPage(pageNum, 10);
		
		List<TThumbs> tlist = tThumbsMapper.selectByExample(thumbsExample);
		
		PageResult<TThumbs>  pageResult = new PageResult<TThumbs>();
		PageInfo<TThumbs> pageInfo = new PageInfo<TThumbs>(tlist);
		
		pageResult.setResultList(tlist);
		pageResult.setPageInfo(pageInfo);
		return pageResult;
	}



	@Override
	public Map<String, Double> getAvagByKey(Integer ClassId, String createTime,String TeacherName) {
		// TODO Auto-generated method stub
		TThumbsExample thumbsExample = new TThumbsExample();
		Criteria cri = thumbsExample.createCriteria();
		if(ClassId!=null){
			
			cri.andClassIdEqualTo(ClassId);
			
		}
		if(createTime!=null||createTime!=""){
			
			cri.andCretetimeLike(createTime+"%");
			
		}
		
		cri.andScoreIsNotNull();
		List<TThumbs> tlist = tThumbsMapper.selectByExample(thumbsExample);
		Map<String,Double> map = new HashMap<String,Double>();
		if(tlist.size()>0){
			map.put("avag", avag(tlist));
		}
		else{
			map.put("avag", 0.0);
		}
		return map;
	}

	public double avag(List<TThumbs> list){
		double sum =0;
		for(int i=0;i<list.size();i++){
			sum=sum+list.get(i).getScore();
		}
		return  (double)Math.round((sum/list.size())*10)/10;
	
	}



	@Override
	public VO4Count_Rtn getCountByKey(Integer ClassId,String createTime,String TeacherName) {
		// TODO Auto-generated method stub
		
		int[] array = new int[5];
		
		for(int i=0;i<5;i++){
			
			
			array[i]=ScoreCount(i,ClassId,createTime,TeacherName);
			
			
		}
		
		
		String[] sarray = new String[]{"1-2分","3-4分","5-6分","7-8分","9-10分"};
	
		VO4Count_Rtn vo = new VO4Count_Rtn();
		vo.setNames(sarray);
		vo.setNumbers(array);
		
		return vo;
	}
	
	
public int ScoreCount(int i,Integer ClassId,String createTime,String TeacherName){
	
	
	TThumbsExample thumbsExample = new TThumbsExample();
	Criteria cri = thumbsExample.createCriteria();
	if(ClassId!=null){
		
		cri.andClassIdEqualTo(ClassId);
		
	}
	if(createTime!=null&&!"".equals(createTime)){
		
		cri.andCretetimeLike(createTime+"%");
		
	}
	if(TeacherName!=null&&!"".equals(TeacherName)){
			
			cri.andTeacherNameEqualTo(TeacherName);
			
		}
	
	
	
	if(i==0){
		
		
		cri.andScoreBetween(1, 2);
		
	}
	else if(i==1){
		cri.andScoreBetween(3, 4);
			
		}
	else if(i==2){
		cri.andScoreBetween(5, 6);
		
	}
	else if(i==3){
		cri.andScoreBetween(7, 8);
		
	}
	else if(i==4){
		cri.andScoreBetween(9, 10);
		
	}
	
	return tThumbsMapper.countByExample(thumbsExample);
}



@Override
public PageResult<TThumbs> getAdminThumbsByKey(Integer ClassId, String createTime, String TeacherName,Integer pageNum) {
	// TODO Auto-generated method stub
	
	TThumbsExample thumbsExample = new TThumbsExample();
	Criteria cri = thumbsExample.createCriteria();
	
	
	
	if(ClassId!=null){
		
		cri.andClassIdEqualTo(ClassId);
		
	}
	if(createTime!=null&&!"".equals(createTime)){
		
		cri.andCretetimeLike(createTime+"%");
		
	}
	if(TeacherName!=null&&!"".equals(TeacherName)){
				
		cri.andTeacherNameEqualTo(TeacherName);		
	}
	
		
	PageHelper.startPage(pageNum, 10);
	
	List<TThumbs> tlist = tThumbsMapper.selectByExample(thumbsExample);
	
	PageResult<TThumbs>  pageResult = new PageResult<TThumbs>();
	PageInfo<TThumbs> pageInfo = new PageInfo<TThumbs>(tlist);
	
	pageResult.setResultList(tlist);
	pageResult.setPageInfo(pageInfo);
	return pageResult;
}



@Override
public String removeThumbsupByPk(Integer teacherId) {
	// TODO Auto-generated method stub
	
	int flag = tThumbsMapper.deleteByPrimaryKey(teacherId);
	
	if(flag>0){
		
		return "018";
		
	}
	
	return "019";
}



@Override
public Map<String, Double> getAdminAvagByKey(Integer ClassId, String createTime, String TeacherName) {
	// TODO Auto-generated method stub
	TThumbsExample thumbsExample = new TThumbsExample();
	Criteria cri = thumbsExample.createCriteria();

	if(ClassId!=null){
			
			cri.andClassIdEqualTo(ClassId);
			
		}
		if(createTime!=null&&createTime!=""){
			
			cri.andCretetimeLike(createTime+"%");
			
		}
		if(TeacherName!=null&&TeacherName!=""){
			
			cri.andTeacherNameEqualTo(TeacherName);
			
		}
		
	
	cri.andScoreIsNotNull();
	List<TThumbs> tlist = tThumbsMapper.selectByExample(thumbsExample);
	Map<String,Double> map = new HashMap<String,Double>();
	if(tlist.size()>0){
		map.put("avag", avag(tlist));
	}
	else{
		map.put("avag", 0.0);
	}
	return map;
	
}
public int ScoreCount2(int i,Integer ClassId,String createTime,String TeacherName){
	
	
	TThumbsExample thumbsExample = new TThumbsExample();
	Criteria cri = thumbsExample.createCriteria();
	if(ClassId!=null){
		
		cri.andClassIdEqualTo(ClassId);
		
	}
	if(createTime!=null||createTime!=""){
		
		cri.andCretetimeLike(createTime+"%");
		
	}
	
	
	
	if(i==0){
		
		
		cri.andScoreBetween(1, 2);
		
	}
	else if(i==1){
		cri.andScoreBetween(3, 4);
			
		}
	else if(i==2){
		cri.andScoreBetween(5, 6);
		
	}
	else if(i==3){
		cri.andScoreBetween(7, 8);
		
	}
	else if(i==4){
		cri.andScoreBetween(9, 10);
		
	}
	
	return tThumbsMapper.countByExample(thumbsExample);
}



@Override
public String InsertThumbs(TThumbs thumbs) {
	// TODO Auto-generated method stub
	
	int flag = tThumbsMapper.insert(thumbs);
	if(flag>0){
		
		return "024";
		
	}
	return "025";
}



@Override
public TThumbs getThumbsByKey(Integer StudentId, Integer TeacherId) {
	// TODO Auto-generated method stub
	TThumbsExample thumbsExample = new TThumbsExample();
	Criteria cri = thumbsExample.createCriteria();
	cri.andStudentIdEqualTo(StudentId);
	cri.andTeacherIdEqualTo(TeacherId);
	
	List<TThumbs> list = tThumbsMapper.selectByExample(thumbsExample);
	
	return list.get(0);
}

}
