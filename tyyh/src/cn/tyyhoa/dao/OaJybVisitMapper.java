package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybVisit;

public interface OaJybVisitMapper {
    int deleteByPrimaryKey(Integer visit_id);

    int insert(OaJybVisit record);

    public  int insertSelective(OaJybVisit record);

    OaJybVisit selectByPrimaryKey(Integer visit_id);

    int updateByPrimaryKeySelective(OaJybVisit record);

    int updateByPrimaryKey(OaJybVisit record);
    
    //获得回访信息
    public List<OaJybVisit> GetHuifang(@Param("studentname") String studentname,
    		@Param("gradename")String gradename,@Param("index")int index, @Param("pageSize")int pageSize
    	,@Param("position_id") int position_id,@Param("emp_id") int emp_id);
    public int Gethfcounts(@Param("studentname") String studentname,
    		@Param("gradename")String gradename,
    		@Param("position_id") int position_id,@Param("emp_id") int emp_id
    		);
    
    public List<OaJybVisit>  GetHuifangById(@Param("visit_studentId") int visit_studentId);
    
    public List<OaJybVisit>  GetGrades(@Param("position_id") int position_id,@Param("emp_id") int emp_id);
    //批量插入学号
    public  int    insertId(@Param("visit_studentId") int visit_studentId);
    
}