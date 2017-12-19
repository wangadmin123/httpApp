package cn.tyyhoa.dao;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybHatProvince;

public interface OaRlzybHatProvinceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaRlzybHatProvince record);

    int insertSelective(OaRlzybHatProvince record);

    OaRlzybHatProvince selectByPrimaryKey(Integer id);
    
    List<OaRlzybHatProvince> selectAllOaRlzybHatProvince();

    int updateByPrimaryKeySelective(OaRlzybHatProvince record);

    int updateByPrimaryKey(OaRlzybHatProvince record);
}