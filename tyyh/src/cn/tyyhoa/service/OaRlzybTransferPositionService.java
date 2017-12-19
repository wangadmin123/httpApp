package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybTalentPool;
import cn.tyyhoa.pojo.OaRlzybTransferPosition;


public interface OaRlzybTransferPositionService {

	/**
	 * 添加调岗信息
	 * @param record
	 * @return
	 */
	public boolean insert(OaRlzybTransferPosition record);

	/**
	 * 删除调岗信息
	 * @param record
	 * @return
	 */
	public boolean deleteByPrimaryKey(Integer transfer_position_id);
	   
	/**
	 * 修改调岗信息
	 * @param record
	 * @return
	 */
	public boolean updateByPrimaryKey(OaRlzybTransferPosition record);
	   
	/**
	 * 查询调岗信息
	 * @param record
	 * @return
	 */
	public OaRlzybTransferPosition selectByPrimaryKey(Integer transfer_position_id);
	
	/**.
     * 查询全部调岗信息
     * @param transfer_position_id
     * @return
     */
    List<OaRlzybTransferPosition> selectAll(String emp_name,Integer startPos,Integer PageSize);
    
    /**.
     * 查询全部原信息
     * @param transfer_position_id
     * @return
     */
    List<OaRlzybTransferPosition> selectBeforePositionDepart(String emp_name,Integer startPos,Integer PageSize);
    
    /**
     * 调岗信息总数
     * @param emp_name
     * @return
     */
    int selectAllCount(String emp_name);
    
    Boolean insertSelective(OaRlzybTransferPosition record);
    
    List<OaRlzybTransferPosition> selectEmployeePositionDepart(String emp_name);
    
    OaRlzybTransferPosition selectAllShow(Integer transfer_position_id);

    OaRlzybTransferPosition selectBeforeShow(Integer transfer_position_id);
    
    boolean updateDeleteStatus(Integer transfer_position_id);
}
