package com.thumbsup.mapper;

import com.thumbsup.dto.TClasstype;
import com.thumbsup.dto.TClasstypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TClasstypeMapper {
    int countByExample(TClasstypeExample example);

    int deleteByExample(TClasstypeExample example);

    int deleteByPrimaryKey(Integer typeId);

    int insert(TClasstype record);

    int insertSelective(TClasstype record);

    List<TClasstype> selectByExample(TClasstypeExample example);

    TClasstype selectByPrimaryKey(Integer typeId);

    int updateByExampleSelective(@Param("record") TClasstype record, @Param("example") TClasstypeExample example);

    int updateByExample(@Param("record") TClasstype record, @Param("example") TClasstypeExample example);

    int updateByPrimaryKeySelective(TClasstype record);

    int updateByPrimaryKey(TClasstype record);
}