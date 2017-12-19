package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import cn.tyyhoa.pojo.OaScbMajorinfo;

public interface OaScbMajorinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaScbMajorinfo record);

    int insertSelective(OaScbMajorinfo record);

    OaScbMajorinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaScbMajorinfo record);

    int updateByPrimaryKey(OaScbMajorinfo record);
    
    
    
    
    public List<OaScbMajorinfo> selectMajorinfoList(@Param("schoolId") int schoolId);
    
    public int findSchoolid(@Param("id") int id);
}