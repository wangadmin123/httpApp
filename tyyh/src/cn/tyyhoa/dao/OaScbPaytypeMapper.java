package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaScbPaytype;

public interface OaScbPaytypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaScbPaytype record);

    int insertSelective(OaScbPaytype record);

    OaScbPaytype selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaScbPaytype record);

    int updateByPrimaryKey(OaScbPaytype record);
}