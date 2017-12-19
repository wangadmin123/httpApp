package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybTalentPool;

public interface OaRlzybTalentPoolService {

	/**
	 * 添加人才储备信息
	 * @param record
	 * @return
	 */
	boolean insert(OaRlzybTalentPool record);

	/**
	 * 添加人才储备
	 * @param record
	 * @return
	 */
	boolean insertSelective(OaRlzybTalentPool record);
	
	/**
	 * 修改人才储备信息
	 * @param record
	 * @return
	 */
	boolean updateByPrimaryKey(OaRlzybTalentPool record);
	
	/**
	 * 修改人才储备信息（模糊）
	 * @param record
	 * @return
	 */
	boolean updateByPrimaryKeySelective(OaRlzybTalentPool record);
	
	/**
	 * 删除人才储备信息
	 * @param talent_pool_id
	 * @return
	 */
	boolean deleteByPrimaryKey(Integer talent_pool_id);
	
	/**
	 * 查询人才储备信息(根据ID)
	 * @param talent_pool_id
	 * @return
	 */
	OaRlzybTalentPool selectByPrimaryKey(Integer talent_pool_id);
	
	/**
	 * 查询人才储备信息
	 * @param position_id
	 * @param talent_pool_salaryExpect
	 * @return
	 */
	List<OaRlzybTalentPool> selectAll(Integer position_id,
    		Integer startPos,Integer PageSize);
	
	/**
	 * 查询总数
	 * @param position_id
	 * @return
	 */
	 int selectAllCount(Integer position_id);
	
	 boolean updateByTalentPoolId(Integer talent_pool_id);
}
