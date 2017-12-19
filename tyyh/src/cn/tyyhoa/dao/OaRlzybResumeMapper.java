package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybResume;

public interface OaRlzybResumeMapper {
    int deleteByPrimaryKey(Integer resume_id);

    int insert(OaRlzybResume record);

    int insertSelective(OaRlzybResume record);

    OaRlzybResume selectByPrimaryKey(Integer resume_id);

    int updateByPrimaryKeySelective(OaRlzybResume record);

    int updateByPrimaryKey(OaRlzybResume record);
}