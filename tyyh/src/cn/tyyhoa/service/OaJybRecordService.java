package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybReport;

public interface OaJybRecordService {
	 public int insertSelective(OaJybReport oaJybReport);
	 
	 public List<OaJybReport>  GetAllReport( int index, int pageSize,String report_type,Date report_createtime,int emp_id);
	 
	 public int allcounts(String report_type,Date report_createtime,int emp_id);
	 
	 public OaJybReport selectByPrimaryKey(Integer report_id);
	 
	 public int updateByPrimaryKeySelective(OaJybReport record);
	 
	 public List<OaJybReport> GetAllpeople();
	 
	//主管查询总记录数
     public int allbumencounts(  String report_type, Date report_createtime,
    		 String report_people
    		 );
     
     
     //主管查询报表列表
      public List<OaJybReport>  GetbumenReport( int index, int pageSize,
     		 String report_type, Date report_createtime,
     		  String report_people
     		 );

}
