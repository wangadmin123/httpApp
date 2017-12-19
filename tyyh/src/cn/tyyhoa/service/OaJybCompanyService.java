package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;






import cn.tyyhoa.pojo.OaJybCompany;

public interface OaJybCompanyService {
	 //查询符合条件的企业
	 public List<OaJybCompany> GetCompanyByContent( String company_name, String company_pinyin,String company_station, String company_city,String company_category,
	    		int index, int pageSize);
	 
	    //查询企业的城市分布
	    public List<OaJybCompany> GetCitys();
	    //查询招聘的岗位
	    public List<OaJybCompany> GetStations();
	    
	  //查询符合条件的总记录数
	    public int GetCountsByContent( String company_name,String company_pinyin, String company_station, String company_city, String company_category);
       
	    //根据ID查找
	    public  OaJybCompany selectByPrimaryKey( int company_id);
	    //更新
	    public  int updateByPrimaryKeySelective(OaJybCompany oaJybCompany);
	    //添加企业
	    public  int insert(OaJybCompany OaJybCompany);
}
