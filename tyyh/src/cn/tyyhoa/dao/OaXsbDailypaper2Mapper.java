package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaXsbDailypaper2;

public interface OaXsbDailypaper2Mapper {

	public int add(OaXsbDailypaper2 OaXsbDailypaper2Mapper2);
	
	public List<OaXsbDailypaper2> selectOaXsbDailypaper2(@Param("grade_id") int grade_id,@Param("writeTimeDate2") Date writeTimeDate2);
}
