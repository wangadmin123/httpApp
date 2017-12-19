package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybWorkorder;
import cn.tyyhoa.pojo.OaRlzybWorkorderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OaRlzybWorkorderMapper {
    long countByExample(OaRlzybWorkorderExample example);

    int deleteByExample(OaRlzybWorkorderExample example);

    int deleteByPrimaryKey(Integer workOrder_id);

    int insert(OaRlzybWorkorder record);

    int insertSelective(OaRlzybWorkorder record);

    List<OaRlzybWorkorder> selectByExample(OaRlzybWorkorderExample example);

    OaRlzybWorkorder selectByPrimaryKey(Integer workOrder_id);

    int updateByExampleSelective(@Param("record") OaRlzybWorkorder record, @Param("example") OaRlzybWorkorderExample example);

    int updateByExample(@Param("record") OaRlzybWorkorder record, @Param("example") OaRlzybWorkorderExample example);

    int updateByPrimaryKeySelective(OaRlzybWorkorder record);

    int updateByPrimaryKey(OaRlzybWorkorder record);
    
    List<OaRlzybWorkorder>  selectAllByMonth (Integer emp_id);
    
    OaRlzybWorkorder selectByPrimaryKeyWithName(Integer workOrder_id);
    
    long countByEmp_id(Integer emp_id);
}