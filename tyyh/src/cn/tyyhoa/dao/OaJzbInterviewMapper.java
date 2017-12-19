package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaJzbInterview;

public interface OaJzbInterviewMapper {
    int deleteByPrimaryKey(Integer interview_id);

    int insert(OaJzbInterview record);

    int insertSelective(OaJzbInterview record);

    OaJzbInterview selectByPrimaryKey(Integer interview_id);

    int updateByPrimaryKeySelective(OaJzbInterview record);

    int updateByPrimaryKey(OaJzbInterview record);
}