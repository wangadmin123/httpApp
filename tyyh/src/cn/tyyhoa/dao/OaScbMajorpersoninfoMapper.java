package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaScbMajorpersoninfo;

public interface OaScbMajorpersoninfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaScbMajorpersoninfo record);

    int insertSelective(OaScbMajorpersoninfo record);

    OaScbMajorpersoninfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaScbMajorpersoninfo record);

    int updateByPrimaryKey(OaScbMajorpersoninfo record);
}