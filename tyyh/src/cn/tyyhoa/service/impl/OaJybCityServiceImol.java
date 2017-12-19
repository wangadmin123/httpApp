package cn.tyyhoa.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybHatCityMapper;
import cn.tyyhoa.dao.OaRlzybHatProvinceMapper;
import cn.tyyhoa.pojo.OaRlzybHatCity;
import cn.tyyhoa.pojo.OaRlzybHatProvince;
import cn.tyyhoa.service.OaJybCityService;
@Service("OaJybCityService")
public class OaJybCityServiceImol implements OaJybCityService {
	@Autowired
	OaRlzybHatProvinceMapper oaRlzybHatProvinceMapper;
	@Autowired
	OaRlzybHatCityMapper oaRlzybHatCityMapper;
	@Override
	public List<OaRlzybHatProvince> selectAllOaRlzybHatProvince() {
		// TODO Auto-generated method stub
		return oaRlzybHatProvinceMapper.selectAllOaRlzybHatProvince();
	}

	@Override
	public List<OaRlzybHatCity> selectSomeOaRlzybHatCityByfather(
			@Param("ProvinceId") String ProvinceId) {
		// TODO Auto-generated method stub
		return oaRlzybHatCityMapper.selectSomeOaRlzybHatCityByfather(ProvinceId);
	}

}
