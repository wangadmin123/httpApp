package cn.tyyhoa.dao;

import java.util.List;

import cn.tyyhoa.pojo.OaScbSchoolinfo;

public interface OaScbSchoolinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaScbSchoolinfo record);

    int insertSelective(OaScbSchoolinfo record);

    OaScbSchoolinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaScbSchoolinfo record);

    int updateByPrimaryKey(OaScbSchoolinfo record);
    
    
}