package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbClassplansum;

public interface OaJzbClassplansumsService {
	
	 List<OaJzbClassplansum> ShowClassplanSum(int id);
	 
	 int addDbjhSum(int great_id,String SUM,int emp_name_id,Date date2);
	 
	 int UpdateClassplanSum(String sum,int classplansum_id);
	 
	 int deleteClassplansum(int great_id);
}
