package cn.tyyhoa.dao;




import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybReport;

public interface OaJybReportMapper {
    int deleteByPrimaryKey(Integer report_id);
    //新增报表
    public int insert(OaJybReport oaJybReport);
    
    public int insertSelective(OaJybReport oaJybReport);
    //根据ID查找
    public OaJybReport selectByPrimaryKey(Integer report_id);
    //提交报表
    public int updateByPrimaryKeySelective(OaJybReport record);

    int updateByPrimaryKey(OaJybReport record);
    //查询总记录数
    public int allcounts(@Param("report_type")  String report_type,@Param("report_createtime") Date report_createtime,@Param("emp_id") int emp_id );
    
    
    //报表列表
     public List<OaJybReport>  GetAllReport(@Param("index") int index,@Param("pageSize") int pageSize,
    		@Param("report_type")  String report_type,@Param("report_createtime") Date report_createtime
    		,@Param("emp_id") int emp_id );
     
     public List<OaJybReport> GetAllpeople();
     
     
     //主管查询总记录数
     public int allbumencounts(@Param("report_type")  String report_type,@Param("report_createtime") Date report_createtime,
    		 @Param("report_people") String report_people
    		 );
     
     
     //主管查询报表列表
      public List<OaJybReport>  GetbumenReport(@Param("index") int index,@Param("pageSize") int pageSize,
     		@Param("report_type")  String report_type,@Param("report_createtime") Date report_createtime,
     		 @Param("report_people") String report_people
     		 );
      
     
     
}