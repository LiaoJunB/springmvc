package com.gzkj.mapper;

import com.gzkj.dao.DocumentInf;
import com.gzkj.dao.DocumentInfExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DocumentInfMapper {
    int countByExample(DocumentInfExample example);

    int deleteByExample(DocumentInfExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(DocumentInf record);

    int insertSelective(DocumentInf record);

    List<DocumentInf> selectByExampleWithBLOBs(DocumentInfExample example);

    List<DocumentInf> selectByExample(DocumentInfExample example);

    DocumentInf selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DocumentInf record, @Param("example") DocumentInfExample example);

    int updateByExampleWithBLOBs(@Param("record") DocumentInf record, @Param("example") DocumentInfExample example);

    int updateByExample(@Param("record") DocumentInf record, @Param("example") DocumentInfExample example);

    int updateByPrimaryKeySelective(DocumentInf record);

    int updateByPrimaryKeyWithBLOBs(DocumentInf record);

    int updateByPrimaryKey(DocumentInf record);
}