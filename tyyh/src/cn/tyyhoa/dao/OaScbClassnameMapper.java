package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaScbClassname;

public interface OaScbClassnameMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaScbClassname record);

    int insertSelective(OaScbClassname record);

    OaScbClassname selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaScbClassname record);

    int updateByPrimaryKey(OaScbClassname record);
}