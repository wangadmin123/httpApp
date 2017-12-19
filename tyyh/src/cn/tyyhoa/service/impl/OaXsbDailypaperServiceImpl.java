/**
 * 
 */
package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaXsbDailypaperMapper;
import cn.tyyhoa.pojo.OaXsbDailypaper;
import cn.tyyhoa.service.OaXsbDailypaperService;

/**
 * @author AYao
 * 
 */
@Service("oaXsbDailypaperService")
public class OaXsbDailypaperServiceImpl implements OaXsbDailypaperService {
	@Autowired
	private OaXsbDailypaperMapper oaXsbDailypaperMapper;

	public void setOaXsbDailypaperMapper(
			OaXsbDailypaperMapper oaXsbDailypaperMapper) {
		this.oaXsbDailypaperMapper = oaXsbDailypaperMapper;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.tyyhoa.service.OaXsbDailypaperService#getAlldaily()
	 */
	@Override
	public List<OaXsbDailypaper> getAlldaily(@Param("classId") int classId) {
		return oaXsbDailypaperMapper.getAlldaily(classId);
	}

	@Override
	public OaXsbDailypaper selectDailyById(@Param("id") int id) {
		return oaXsbDailypaperMapper.selectDailyById(id);
	}

	@Override
	public boolean updateDailystatement(OaXsbDailypaper oaXsbDailypaper) {
		int row = oaXsbDailypaperMapper.updateDailystatement(oaXsbDailypaper);
		if (row == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean insertDaily(List<OaXsbDailypaper> oaXsbDailypaperList) {
		int row = oaXsbDailypaperMapper.insertDaily(oaXsbDailypaperList);
		if (row > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<OaXsbDailypaper> selectDailyByClassIdAndCreatetime(
			@Param("classId") int classId, @Param("createTime") Date createTime) {
		return oaXsbDailypaperMapper.selectDailyByClassIdAndCreatetime(classId,
				createTime);
	}

	@Override
	public Integer zy(Integer studentClassId, String dateStyle) {
		// TODO Auto-generated method stub
		return oaXsbDailypaperMapper.zy(studentClassId, dateStyle);
	}

}
