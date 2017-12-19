package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybPositionfunctionKey;

public interface OaRlzybPositionfunctionMapper {
    int deleteByPrimaryKey(OaRlzybPositionfunctionKey key);

    int insert(OaRlzybPositionfunctionKey record);

    int insertSelective(OaRlzybPositionfunctionKey record);
}