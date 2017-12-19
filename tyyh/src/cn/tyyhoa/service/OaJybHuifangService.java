package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;





import cn.tyyhoa.pojo.OaJybVisit;

public interface OaJybHuifangService {
	public List<OaJybVisit> GetHuifang( String studentname,
    		String gradename,int index, int pageSize,int position_id, int emp_id);
	
	 public int Gethfcounts( String studentname,
	    		String gradename,int position_id, int emp_id);
	 
	 public List<OaJybVisit> GetHuifangById( int visit_studentId);
	 
	 public  int insertSelective(OaJybVisit record);
	 
	   public List<OaJybVisit>  GetGrades(int position_id, int emp_id);
	   
	   public  int    insertId( int visit_studentId);

}
