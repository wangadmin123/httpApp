package cn.tyyhoa.dao;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybGrade;

public interface OaRlzybGradeMapper {
    int deleteByPrimaryKey(Integer grade_id);

    int insert(OaRlzybGrade record);

    int insertSelective(OaRlzybGrade record);

    OaRlzybGrade selectByPrimaryKey(Integer grade_id);
    
    List<OaRlzybGrade> selectAllOaRlzybGrade();

    int updateByPrimaryKeySelective(OaRlzybGrade record);

    int updateByPrimaryKey(OaRlzybGrade record);
}