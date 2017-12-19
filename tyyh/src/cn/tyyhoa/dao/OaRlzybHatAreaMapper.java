package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybHatArea;

public interface OaRlzybHatAreaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaRlzybHatArea record);

    int insertSelective(OaRlzybHatArea record);

    OaRlzybHatArea selectByPrimaryKey(Integer id);
    
    List<OaRlzybHatArea> getSomeOaRlzybHatAreaByFather(@Param("CityId") String CityId);

    int updateByPrimaryKeySelective(OaRlzybHatArea record);

    int updateByPrimaryKey(OaRlzybHatArea record);
}