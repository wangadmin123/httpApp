package cn.tyyhoa.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybTransferPositionMapper;
import cn.tyyhoa.pojo.OaRlzybTalentPool;
import cn.tyyhoa.pojo.OaRlzybTransferPosition;
import cn.tyyhoa.service.OaRlzybTransferPositionService;

@Service("oaRlzybTransferPositionService")
public class OaRlzybTransferPositionServiceImpl implements OaRlzybTransferPositionService {

	@Autowired
	OaRlzybTransferPositionMapper oaRlzybTransferPositionMapper;
	
	public OaRlzybTransferPositionMapper getOaRlzybTransferPositionMapper() {
		return oaRlzybTransferPositionMapper;
	}

	public void setOaRlzybTransferPositionMapper(
			OaRlzybTransferPositionMapper oaRlzybTransferPositionMapper) {
		this.oaRlzybTransferPositionMapper = oaRlzybTransferPositionMapper;
	}

	/**
	 * 添加调岗信息
	 */
	@Override
	public boolean insert(OaRlzybTransferPosition record) {
		
		int result = oaRlzybTransferPositionMapper.insert(record);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 删除调岗信息
	 */
	@Override
	public boolean deleteByPrimaryKey(Integer transfer_position_id) {

		int result = oaRlzybTransferPositionMapper.deleteByPrimaryKey(transfer_position_id);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 修改调岗信息
	 */
	@Override
	public boolean updateByPrimaryKey(OaRlzybTransferPosition record) {
		
		int result = oaRlzybTransferPositionMapper.updateByPrimaryKey(record);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 查询调岗信息
	 */
	@Override
	public OaRlzybTransferPosition selectByPrimaryKey(
			Integer transfer_position_id) {
		
		return oaRlzybTransferPositionMapper.selectByPrimaryKey(transfer_position_id);
	}

	@Override
	public List<OaRlzybTransferPosition> selectAll(String emp_name,Integer startPos,Integer PageSize) {
		
		return oaRlzybTransferPositionMapper.selectAll(emp_name,startPos,PageSize);
	}
	
	@Override
	public List<OaRlzybTransferPosition> selectBeforePositionDepart(String emp_name,Integer startPos,Integer PageSize) {
		
		return oaRlzybTransferPositionMapper.selectBeforePositionDepart(emp_name,startPos,PageSize);
	}

	@Override
	public int selectAllCount(@Param("emp_name") String emp_name) {
		
		return oaRlzybTransferPositionMapper.selectAllCount(emp_name);
	}

	@Override
	public Boolean insertSelective(OaRlzybTransferPosition record) {
		
		int result = oaRlzybTransferPositionMapper.insertSelective(record);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<OaRlzybTransferPosition> selectEmployeePositionDepart(
			String emp_name) {
		
		return oaRlzybTransferPositionMapper.selectEmployeePositionDepart(emp_name);
	}

	@Override
	public OaRlzybTransferPosition selectAllShow(Integer transfer_position_id) {
		
		return oaRlzybTransferPositionMapper.selectAllShow(transfer_position_id);
	}

	@Override
	public OaRlzybTransferPosition selectBeforeShow(Integer transfer_position_id) {
		
		return oaRlzybTransferPositionMapper.selectBeforeShow(transfer_position_id);
	}

	@Override
	public boolean updateDeleteStatus(Integer transfer_position_id) {
		int result = oaRlzybTransferPositionMapper.updateDeleteStatus(transfer_position_id);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

}
