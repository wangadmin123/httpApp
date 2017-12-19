package cn.tyyhoa.dao;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybNative;

public interface OaRlzybNativeMapper {
    int deleteByPrimaryKey(Integer naNo);

    int insert(OaRlzybNative record);

    int insertSelective(OaRlzybNative record);

    OaRlzybNative selectByPrimaryKey(Integer naNo);
    
    List<OaRlzybNative> selectAllOaRlzybNative();

    int updateByPrimaryKeySelective(OaRlzybNative record);

    int updateByPrimaryKey(OaRlzybNative record);
}