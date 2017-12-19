package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaJwbCourse;

public interface OaJwbCourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaJwbCourse record);

    int insertSelective(OaJwbCourse record);

    OaJwbCourse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaJwbCourse record);

    int updateByPrimaryKey(OaJwbCourse record);
}