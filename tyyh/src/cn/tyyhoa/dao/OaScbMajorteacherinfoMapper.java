package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaScbMajorteacherinfo;

public interface OaScbMajorteacherinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaScbMajorteacherinfo record);

    int insertSelective(OaScbMajorteacherinfo record);

    OaScbMajorteacherinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaScbMajorteacherinfo record);

    int updateByPrimaryKey(OaScbMajorteacherinfo record);
}