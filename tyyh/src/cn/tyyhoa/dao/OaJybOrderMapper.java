package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaJybOrder;

public interface OaJybOrderMapper {
    int deleteByPrimaryKey(Integer order_id);

    int insert(OaJybOrder record);

    int insertSelective(OaJybOrder record);

    OaJybOrder selectByPrimaryKey(Integer order_id);

    int updateByPrimaryKeySelective(OaJybOrder record);

    int updateByPrimaryKey(OaJybOrder record);
}