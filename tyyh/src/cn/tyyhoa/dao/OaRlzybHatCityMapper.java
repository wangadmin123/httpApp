package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybHatCity;

public interface OaRlzybHatCityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaRlzybHatCity record);

    int insertSelective(OaRlzybHatCity record);
    

    OaRlzybHatCity selectByCityPojoKey(String city);

    OaRlzybHatCity selectByPrimaryKey(Integer id);
    
    List<OaRlzybHatCity> selectSomeOaRlzybHatCityByfather(@Param("ProvinceId") String ProvinceId);

    int updateByPrimaryKeySelective(OaRlzybHatCity record);

    int updateByPrimaryKey(OaRlzybHatCity record);
}