package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybRewards;

public interface OaRlzybRewardsService {

	List<OaRlzybRewards> selectAll(String emp_name,String rewards_type,Integer startPos,Integer PageSize);
	
	int selectCount(String emp_name,String rewards_type);
	
	boolean insertSelective(OaRlzybRewards record);
	
	OaRlzybRewards selectShowInfo(Integer rewards_id);
	
	boolean updateByRewardsId(Integer rewards_id);
}
