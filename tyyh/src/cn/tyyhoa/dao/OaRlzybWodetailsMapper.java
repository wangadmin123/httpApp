package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybWodetails;
import cn.tyyhoa.pojo.OaRlzybWodetailsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OaRlzybWodetailsMapper {
    long countByExample(OaRlzybWodetailsExample example);

    int deleteByExample(OaRlzybWodetailsExample example);

    int deleteByPrimaryKey(Integer wodetails_id);

    int insert(OaRlzybWodetails record);

    int insertSelective(OaRlzybWodetails record);

    List<OaRlzybWodetails> selectByExample(OaRlzybWodetailsExample example);

    OaRlzybWodetails selectByPrimaryKey(Integer wodetails_id);

    int updateByExampleSelective(@Param("record") OaRlzybWodetails record, @Param("example") OaRlzybWodetailsExample example);

    int updateByExample(@Param("record") OaRlzybWodetails record, @Param("example") OaRlzybWodetailsExample example);

    int updateByPrimaryKeySelective(OaRlzybWodetails record);

    int updateByPrimaryKey(OaRlzybWodetails record);
    
    List<OaRlzybWodetails> SelectWoByThisMonth(@Param("emp_id")Integer emp_id);
    

}