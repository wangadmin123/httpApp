package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import cn.tyyhoa.pojo.OaJzbClassplansum;

public interface OaJzbClassplansumMapper {
    int deleteByPrimaryKey(Integer great_id);

    int insert(OaJzbClassplansum record);

    int insertSelective(OaJzbClassplansum record);

    OaJzbClassplansum selectByPrimaryKey(Integer great_id);

    int updateByPrimaryKeySelective(OaJzbClassplansum record);

    int updateByPrimaryKey(OaJzbClassplansum record);
    
    List<OaJzbClassplansum> getClassplanSumByID(@Param("great_id")int great_id);
    
    int addDbjhSum(@Param("great_id")int great_id,@Param("SUM")String SUM,
    		@Param("emp_name_id")int emp_name_id,@Param("date2")Date date2);
   
    int UpdateClassplanSum(@Param("sum")String sum,@Param("classplansum_id")int classplansum_id);
   
    int deleteClassplansum(@Param("classplansum_id")int classplansum_id);
}