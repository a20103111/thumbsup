package com.thumbsup.mapper;

import com.thumbsup.dto.TThumbs;
import com.thumbsup.dto.TThumbsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TThumbsMapper {
    int countByExample(TThumbsExample example);

    int deleteByExample(TThumbsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TThumbs record);

    int insertSelective(TThumbs record);

    List<TThumbs> selectByExample(TThumbsExample example);

    TThumbs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TThumbs record, @Param("example") TThumbsExample example);

    int updateByExample(@Param("record") TThumbs record, @Param("example") TThumbsExample example);

    int updateByPrimaryKeySelective(TThumbs record);

    int updateByPrimaryKey(TThumbs record);
}