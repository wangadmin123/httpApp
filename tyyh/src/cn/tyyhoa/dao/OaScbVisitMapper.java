package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaScbVisit;

public interface OaScbVisitMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaScbVisit record);

    int insertSelective(OaScbVisit record);

    OaScbVisit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaScbVisit record);

    int updateByPrimaryKey(OaScbVisit record);
}