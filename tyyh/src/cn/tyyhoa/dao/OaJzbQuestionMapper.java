package cn.tyyhoa.dao;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbQuestion;

public interface OaJzbQuestionMapper {
    int insert(OaJzbQuestion record);

    int insertSelective(OaJzbQuestion record);
    
    int addQuestion(@Param("question")String question);
}