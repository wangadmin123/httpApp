package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaJybTraining;

public interface OaJybTrainingMapper {
    int deleteByPrimaryKey(Integer training_id);

    int insert(OaJybTraining record);

    int insertSelective(OaJybTraining record);

    OaJybTraining selectByPrimaryKey(Integer training_id);

    int updateByPrimaryKeySelective(OaJybTraining record);

    int updateByPrimaryKey(OaJybTraining record);
}