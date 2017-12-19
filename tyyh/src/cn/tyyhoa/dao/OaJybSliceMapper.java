package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaJybSlice;

public interface OaJybSliceMapper {
    int deleteByPrimaryKey(Integer slice_id);

    int insert(OaJybSlice record);

    int insertSelective(OaJybSlice record);

    OaJybSlice selectByPrimaryKey(Integer slice_id);

    int updateByPrimaryKeySelective(OaJybSlice record);

    int updateByPrimaryKey(OaJybSlice record);
}