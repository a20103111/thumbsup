package com.thumbsup.serviceImp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thumbsup.dto.TClasstype;
import com.thumbsup.mapper.TClasstypeMapper;
import com.thumbsup.service.IClassTypeService;


@Service
public class ClassTypeServiceImp implements IClassTypeService {

	@Resource
	TClasstypeMapper tClasstypeMapper;
	
	
	@Override
	public TClasstype getClassTypeById(Integer typeId) {
		// TODO Auto-generated method stub
		
		TClasstype type = tClasstypeMapper.selectByPrimaryKey(typeId);
		
		
		return type;
	}

}
