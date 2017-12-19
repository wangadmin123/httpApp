package cn.tyyhoa.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybRewardsMapper;
import cn.tyyhoa.pojo.OaRlzybRewards;
import cn.tyyhoa.service.OaRlzybRewardsService;

@Service("oaRlzybRewardsService")
public class OaRlzybRewardsServiceImpl implements OaRlzybRewardsService {

	@Autowired
	OaRlzybRewardsMapper oaRlzybRewardsMapper;
	
	@Override
	public List<OaRlzybRewards> selectAll(String emp_name,
			 String rewards_type,Integer startPos,Integer PageSize) {
		// TODO Auto-generated method stub
		return oaRlzybRewardsMapper.selectAll(emp_name, rewards_type, startPos, PageSize);
	}

	@Override
	public int selectCount(String emp_name, String rewards_type) {
		
		return oaRlzybRewardsMapper.selectCount(emp_name, rewards_type);
	}

	@Override
	public boolean insertSelective(OaRlzybRewards record) {
		int count = oaRlzybRewardsMapper.insertSelective(record);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public OaRlzybRewards selectShowInfo(Integer rewards_id) {
		// TODO Auto-generated method stub
		return oaRlzybRewardsMapper.selectShowInfo(rewards_id);
	}

	@Override
	public boolean updateByRewardsId(Integer rewards_id) {
		int count = oaRlzybRewardsMapper.updateByRewardsId(rewards_id);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

}
