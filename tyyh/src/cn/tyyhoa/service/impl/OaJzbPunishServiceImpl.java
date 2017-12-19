package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbPunishMapper;
import cn.tyyhoa.pojo.OaJzbPunish;
import cn.tyyhoa.service.OaJzbPunishService;
@Service("oaJzbPunishService")
public class OaJzbPunishServiceImpl implements OaJzbPunishService{
	@Autowired
	OaJzbPunishMapper oaJzbPunishMapper;
	
	@Override
	public boolean addOaJzbPunish(OaJzbPunish record) {
		int row=oaJzbPunishMapper.insertOaJzbPunish(record);
		if (row==1) {
			return true;
		}else{
			return false;
		}
		
	}
	@Override
	public List<OaJzbPunish> queryOaJzbPunishListByGradeId(int gradeId) {
		return oaJzbPunishMapper.selectOaJzbPunishListByGradeId(gradeId);
	}

	@Override
	public List<OaJzbPunish> queryOaJzbPunishListByStuName(int stuId) {
		return oaJzbPunishMapper.selectOaJzbPunishListByStuName(stuId);
	}
	@Override
	public OaJzbPunish queryOaJzbPunishById(int punishId) {
		return oaJzbPunishMapper.selectOaJzbPunishById(punishId);
	}
	@Override
	public boolean changeOaJzbPunishById(OaJzbPunish oaJzbPunish) {
		int row=oaJzbPunishMapper.updateOaJzbPunishById(oaJzbPunish);
		if (row==1) {
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean deleteOaJzbPunishDeleteStatus(OaJzbPunish oaJzbPunish) {
		int row=oaJzbPunishMapper.updateOaJzbPunishDeleteStatus(oaJzbPunish);
		if (row==1) {
			return true;
		}else{
			return false;
		}
	}

}
