package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybTechnicalTitle;

public interface OaRlzybTechnicalTitleMapper {
    int deleteByPrimaryKey(Integer technical_title_id);

    int insert(OaRlzybTechnicalTitle record);

    int insertSelective(OaRlzybTechnicalTitle record);

    OaRlzybTechnicalTitle selectByPrimaryKey(Integer technical_title_id);

    int updateByPrimaryKeySelective(OaRlzybTechnicalTitle record);

    int updateByPrimaryKey(OaRlzybTechnicalTitle record);
    
    List<OaRlzybTechnicalTitle> selectOaRlzybTechnicalTitleByEmpId(@Param("emp_id") int emp_id);
}