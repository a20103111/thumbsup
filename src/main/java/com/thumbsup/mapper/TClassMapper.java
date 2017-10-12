package com.thumbsup.mapper;

import com.thumbsup.dto.TClass;
import com.thumbsup.dto.TClassExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TClassMapper {
    int countByExample(TClassExample example);

    int deleteByExample(TClassExample example);

    int deleteByPrimaryKey(Integer classId);

    int insert(TClass record);

    int insertSelective(TClass record);

    List<TClass> selectByExample(TClassExample example);

    TClass selectByPrimaryKey(Integer classId);

    int updateByExampleSelective(@Param("record") TClass record, @Param("example") TClassExample example);

    int updateByExample(@Param("record") TClass record, @Param("example") TClassExample example);

    int updateByPrimaryKeySelective(TClass record);

    int updateByPrimaryKey(TClass record);
}