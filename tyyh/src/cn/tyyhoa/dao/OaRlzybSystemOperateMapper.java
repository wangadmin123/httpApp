package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybSystemOperate;

public interface OaRlzybSystemOperateMapper {
    int deleteByPrimaryKey(Integer system_operate_id);

    int insert(OaRlzybSystemOperate record);

    int insertSelective(OaRlzybSystemOperate record);

    OaRlzybSystemOperate selectByPrimaryKey(Integer system_operate_id);

    int updateByPrimaryKeySelective(OaRlzybSystemOperate record);

    int updateByPrimaryKey(OaRlzybSystemOperate record);
}