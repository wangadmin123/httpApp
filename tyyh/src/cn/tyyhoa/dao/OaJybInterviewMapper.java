package cn.tyyhoa.dao;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybInterview;

public interface OaJybInterviewMapper {
    int deleteByPrimaryKey(Integer interview_id);

    int insert(OaJybInterview record);

    public int insertSelective(OaJybInterview record);

    OaJybInterview selectByPrimaryKey(Integer interview_id);

   public int updateByPrimaryKeySelective(OaJybInterview record);
   
   public int insertByPrimaryKeySelective(OaJybInterview record);

    int updateByPrimaryKey(OaJybInterview record);
    
    public int insertId(@Param("mianshibiao_id") int mianshibiao_id);
}