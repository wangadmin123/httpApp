package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybTalentPool;

public interface OaRlzybTalentPoolMapper {
	/**
	 * 删除人才储备信息   根据ID
	 * @param talent_pool_id
	 * @return
	 */
    int deleteByPrimaryKey(Integer talent_pool_id);

    
    int updateByTalentPoolId(Integer talent_pool_id);

    /**
     * 添加人才储备信息
     * @param record
     * @return
     */
    int insert(OaRlzybTalentPool record);

    /**
     * 模糊添加
     * @param record
     * @return
     */
    int insertSelective(OaRlzybTalentPool record);

    /**
     * 查询人才储备信息  根据ID
     * @param talent_pool_id
     * @return
     */
    OaRlzybTalentPool selectByPrimaryKey(Integer talent_pool_id);
    
    /**
     * 查询人才储备信息  根据条件
     * @return
     */
    List<OaRlzybTalentPool> selectAll(@Param("position_id")Integer position_id,
    		@Param("startPos")Integer startPos,@Param("PageSize")Integer PageSize);

    /**
     * 查询总数
     * @param position_id
     * @return
     */
    int selectAllCount(@Param("position_id")Integer position_id);
    
    int updateByPrimaryKeySelective(OaRlzybTalentPool record);

    /**
     * 修改人才储备信息
     * @param record
     * @return
     */
    int updateByPrimaryKey(OaRlzybTalentPool record);
}