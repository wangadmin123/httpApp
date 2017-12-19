package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybRewards;

public interface OaRlzybRewardsMapper {
    int deleteByPrimaryKey(Integer rewards_id);

    int insert(OaRlzybRewards record);

    int insertSelective(OaRlzybRewards record);

    OaRlzybRewards selectByPrimaryKey(Integer rewards_id);

    int updateByPrimaryKeySelective(OaRlzybRewards record);

    int updateByPrimaryKey(OaRlzybRewards record);
    
    
    
    
    
    List<OaRlzybRewards> selectAll(@Param("emp_name")String emp_name,@Param("rewards_type")String rewards_type,@Param("startPos")Integer startPos,@Param("PageSize")Integer PageSize);
    
    int selectCount(@Param("emp_name")String emp_name,@Param("rewards_type")String rewards_type);
    
    OaRlzybRewards selectShowInfo(@Param("rewards_id")Integer rewards_id);
    
    int updateByRewardsId(@Param("rewards_id")Integer rewards_id);
}