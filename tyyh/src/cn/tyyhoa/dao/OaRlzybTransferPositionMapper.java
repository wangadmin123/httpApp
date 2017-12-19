package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybTransferPosition;

public interface OaRlzybTransferPositionMapper {
    int deleteByPrimaryKey(Integer transfer_position_id);

    int insert(OaRlzybTransferPosition record);

    int insertSelective(OaRlzybTransferPosition record);

    OaRlzybTransferPosition selectByPrimaryKey(Integer transfer_position_id);

    int updateByPrimaryKeySelective(OaRlzybTransferPosition record);

    int updateByPrimaryKey(OaRlzybTransferPosition record);
    
    List<OaRlzybTransferPosition> selectAll(@Param("emp_name")String emp_name,@Param("startPos")Integer startPos,@Param("PageSize")Integer PageSize);

    List<OaRlzybTransferPosition> selectBeforePositionDepart(@Param("emp_name")String emp_name,@Param("startPos")Integer startPos,@Param("PageSize")Integer PageSize);
    
    int selectAllCount(@Param("emp_name")String emp_name);
    
    List<OaRlzybTransferPosition> selectEmployeePositionDepart(@Param("emp_name")String emp_name);
    
    OaRlzybTransferPosition selectAllShow(@Param("transfer_position_id")Integer transfer_position_id);

    OaRlzybTransferPosition selectBeforeShow(@Param("transfer_position_id")Integer transfer_position_id);
    
    int updateDeleteStatus(@Param("transfer_position_id")Integer transfer_position_id);
}