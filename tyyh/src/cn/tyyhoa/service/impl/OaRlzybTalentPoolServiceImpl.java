package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybTalentPoolMapper;
import cn.tyyhoa.pojo.OaRlzybTalentPool;
import cn.tyyhoa.service.OaRlzybTalentPoolService;

@Service("oaRlzybTalentPoolService")
public class OaRlzybTalentPoolServiceImpl implements OaRlzybTalentPoolService {

	@Autowired
	OaRlzybTalentPoolMapper oaRlzybTalentPoolMapper;
	
	/**
	 * 添加调岗信息
	 */
	@Override
	public boolean insert(OaRlzybTalentPool record) {
		
		int result = oaRlzybTalentPoolMapper.insert(record);
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
	public boolean updateByPrimaryKey(OaRlzybTalentPool record) {
		
		int result = oaRlzybTalentPoolMapper.updateByPrimaryKey(record);
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
	public boolean deleteByPrimaryKey(Integer talent_pool_id) {

		int result = oaRlzybTalentPoolMapper.deleteByPrimaryKey(talent_pool_id);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 查询调岗信息(根据ID)
	 */
	@Override
	public OaRlzybTalentPool selectByPrimaryKey(Integer talent_pool_id) {
		
		return oaRlzybTalentPoolMapper.selectByPrimaryKey(talent_pool_id);
	}

	/**
	 * 查询调岗信息
	 */
	@Override
	public List<OaRlzybTalentPool> selectAll(Integer position_id,Integer startPos ,Integer PageSize) {
		
		return oaRlzybTalentPoolMapper.selectAll(position_id, startPos, PageSize);
	}

	@Override
	public boolean insertSelective(OaRlzybTalentPool record) {
		int result = oaRlzybTalentPoolMapper.insertSelective(record);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updateByPrimaryKeySelective(OaRlzybTalentPool record) {

		int result = oaRlzybTalentPoolMapper.updateByPrimaryKeySelective(record);

		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectAllCount(Integer position_id) {
		
		return oaRlzybTalentPoolMapper.selectAllCount(position_id);
	}

	@Override
	public boolean updateByTalentPoolId(Integer talent_pool_id) {
		int result = oaRlzybTalentPoolMapper.updateByTalentPoolId(talent_pool_id);

		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

}
