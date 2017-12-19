package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybHatCity;
import cn.tyyhoa.pojo.OaRlzybHatProvince;

public interface OaJybCityService {
	List<OaRlzybHatProvince> selectAllOaRlzybHatProvince();
	
	List<OaRlzybHatCity> selectSomeOaRlzybHatCityByfather(@Param("ProvinceId") String ProvinceId);

}
