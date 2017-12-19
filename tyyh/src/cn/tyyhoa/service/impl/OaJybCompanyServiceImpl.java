package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tyyhoa.dao.OaJybCompanyMapper;
import cn.tyyhoa.pojo.OaJybCompany;
import cn.tyyhoa.service.OaJybCompanyService;
@Service("oaJybCompanyService")
public class OaJybCompanyServiceImpl implements OaJybCompanyService{
	
	@Autowired
	OaJybCompanyMapper oaJybCompanyMapper ;
	
	
	
	public OaJybCompanyMapper getOaJybCompanyMapper() {
		return oaJybCompanyMapper;
	}
	public void setOaJybCompanyMapper(OaJybCompanyMapper oaJybCompanyMapper) {
		this.oaJybCompanyMapper = oaJybCompanyMapper;
	}
	@Override
	public List<OaJybCompany> GetCitys() {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.GetCitys();
	}
	@Override
	public List<OaJybCompany> GetStations() {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.GetStations();
	}
	@Override
	public List<OaJybCompany> GetCompanyByContent(String company_name,String company_pinyin,
			String company_station, String company_city,
			String company_category, int index, int pageSize) {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.GetCompanyByContent(company_name, company_pinyin, company_station, company_city, company_category, (index-1)*pageSize, pageSize);
	}
	@Override
	public int GetCountsByContent(String company_name,String company_pinyin, String company_station,
			String company_city, String company_category) {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.GetCountsByContent(company_name,company_pinyin, company_station, company_city, company_category);
	}
	@Override
	public OaJybCompany selectByPrimaryKey(int company_id) {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.selectByPrimaryKey(company_id);
	}
	@Override
	public int updateByPrimaryKeySelective(OaJybCompany oaJybCompany) {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.updateByPrimaryKeySelective(oaJybCompany);
	}
	@Override
	public int insert(OaJybCompany OaJybCompany) {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.insert(OaJybCompany);
	}

}
