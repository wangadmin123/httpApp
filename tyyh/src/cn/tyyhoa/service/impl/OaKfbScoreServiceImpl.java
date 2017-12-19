package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tyyhoa.dao.OakfbScoreMapper;
import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.pojo.OakfbScore;
import cn.tyyhoa.pojo.OakfbScoreExample;
import cn.tyyhoa.service.OaKfbScoreService;

@Service(value = "OaKfbScoreService")
public class OaKfbScoreServiceImpl implements OaKfbScoreService {
	@Autowired
	OakfbScoreMapper oakfbScoreMapper;

	@Override
	public void addscore_click(OakfbScore score) {
		// TODO Auto-generated method stub
		oakfbScoreMapper.insertSelective(score);

	}

	@Override
	public List<OakfbScore> ClickIsExis(OakfbScoreExample example) {
		// TODO Auto-generated method stub
		return oakfbScoreMapper.selectByExample(example);
	}

	@Override
	public void updatescore_out(OakfbScore score) {
		// TODO Auto-generated method stub
		oakfbScoreMapper.updateByPrimaryKeySelective(score);
	}

	/* *
	 * 根据员工id查询未签到次数(non-Javadoc)
	 * 
	 * @see
	 * cn.tyyhoa.service.OakfbScoreService#selectScoreCountByUid(cn.tyyhoa.pojo
	 * .OakfbScore)
	 */

	@Override
	public int selectScoreCountByUid(OakfbScore record) {
		// TODO Auto-generated method stub
		return oakfbScoreMapper.selectScoreCountByUid(record);
	}

	@Override
	public List<OakfbScore> selectScoreTimeByUid(OakfbScore record) {
		// TODO Auto-generated method stub
		return oakfbScoreMapper.selectScoreTimeByUid(record);
	}

	@Override
	public Integer selectScoreFsCount(OakfbScore record) {
		// TODO Auto-generated method stub
		return oakfbScoreMapper.selectScoreFsCount(record);
	}

	@Override
	public int selectCdCountByUid(OakfbScore record) {
		// TODO Auto-generated method stub
		return oakfbScoreMapper.selectCdCountByUid(record);
	}

	@Override
	public List<OakfbScore> selectCdTimeByUid(OakfbScore record) {
		// TODO Auto-generated method stub
		return oakfbScoreMapper.selectCdTimeByUid(record);
	}

	@Override
	public int selectZtCountByUid(OakfbScore record) {
		// TODO Auto-generated method stub
		return oakfbScoreMapper.selectZtCountByUid(record);
	}

	@Override
	public List<OakfbScore> selectZtTimeByUid(OakfbScore record) {
		// TODO Auto-generated method stub
		return oakfbScoreMapper.selectZtTimeByUid(record);
	}

	@Override
	public boolean insert(OakfbScore record) {
		if (oakfbScoreMapper.insert(record) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean editbyuserid(OakfbScore record) {
		if (oakfbScoreMapper.editbyuserid(record) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<OakfbScore> Byuserid(Integer user_id) {
		List<OakfbScore> list = oakfbScoreMapper.Byuserid(user_id);
		if (list.size() != 0) {
			return list;
		}
		return null;
	}

	@Override
	public OakfbScore selectByid(Integer id) {
		if (oakfbScoreMapper.selectByid(id).size() != 0) {
			OakfbScore oakfbScore = oakfbScoreMapper.selectByid(id).get(0);

			return oakfbScore;
		}
		return null;
	}

}
