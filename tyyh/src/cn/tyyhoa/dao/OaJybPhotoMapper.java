package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaJybPhoto;

public interface OaJybPhotoMapper {
    int deleteByPrimaryKey(Integer photo_id);

    int insert(OaJybPhoto record);

    int insertSelective(OaJybPhoto record);

    OaJybPhoto selectByPrimaryKey(Integer photo_id);

    int updateByPrimaryKeySelective(OaJybPhoto record);

    int updateByPrimaryKey(OaJybPhoto record);
}