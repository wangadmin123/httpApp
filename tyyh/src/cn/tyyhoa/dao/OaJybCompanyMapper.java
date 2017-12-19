package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybCompany;

public interface OaJybCompanyMapper {
    int deleteByPrimaryKey(Integer company_id);
   //添加企业
   public  int insert(OaJybCompany OaJybCompany);

    int insertSelective(OaJybCompany record);
    //根据ID查询企业
    public  OaJybCompany selectByPrimaryKey(@Param("company_id") int company_id);

    int updateByPrimaryKeySelective(OaJybCompany record);
    //更新信息
    public  int updateByPrimaryKey(OaJybCompany oaJybCompany);
    //查询符合条件的企业
    public List<OaJybCompany> GetCompanyByContent(@Param("company_name") String company_name,
    		@Param("company_pinyin") String company_pinyin,
    		@Param("company_station") String company_station,@Param("company_city") String company_city,@Param("company_category") String company_category,
    		@Param("index")int index, @Param("pageSize")int pageSize);
    //查询企业的城市分布
    public List<OaJybCompany> GetCitys();
    //查询招聘的岗位
    public List<OaJybCompany> GetStations();
    //查询符合条件的总记录数
    public int GetCountsByContent(@Param("company_name") String company_name,@Param("company_pinyin") String company_pinyin,@Param("company_station") String company_station,@Param("company_city") String company_city,@Param("company_category") String company_category);
    
    //查询所有企业
    public List<OaJybCompany> GetAllComList();
    //查询指定企业的招聘岗位
    public OaJybCompany GetByComLEnglist(Integer comid);

    
}