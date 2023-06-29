package com.gzkj.mapper;

import com.gzkj.dao.NoticeInf;
import com.gzkj.dao.NoticeInfExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeInfMapper {
    int countByExample(NoticeInfExample example);

    int deleteByExample(NoticeInfExample example);

    int insert(NoticeInf record);

    int insertSelective(NoticeInf record);

    List<NoticeInf> selectByExample(NoticeInfExample example);

    int updateByExampleSelective(@Param("record") NoticeInf record, @Param("example") NoticeInfExample example);

    int updateByExample(@Param("record") NoticeInf record, @Param("example") NoticeInfExample example);
}