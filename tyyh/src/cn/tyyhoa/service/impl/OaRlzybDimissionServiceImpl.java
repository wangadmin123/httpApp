package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybDimissionMapper;
import cn.tyyhoa.pojo.OaRlzybDimission;
import cn.tyyhoa.service.OaRlzybDimissionService;

@Service("oaRlzybDimissionService")
public class OaRlzybDimissionServiceImpl implements OaRlzybDimissionService {

	@Autowired
	OaRlzybDimissionMapper oaRlzybDimissionMapper;
	
	@Override
	public List<OaRlzybDimission> selectAll(String emp_name, Date dimission_date1,
   		 Date dimission_date2,
			Integer startPos, Integer PageSize) {
		// TODO Auto-generated method stub
		return oaRlzybDimissionMapper.selectAll(emp_name, dimission_date1,dimission_date2, startPos, PageSize);
	}

	@Override
	public int selectCount(String emp_name,Date dimission_date1,
   		 Date dimission_date2) {
		// TODO Auto-generated method stub
		return oaRlzybDimissionMapper.selectCount(emp_name, dimission_date1,dimission_date2);
	}

	@Override
	public boolean insertSelective(OaRlzybDimission record) {
		int count = oaRlzybDimissionMapper.insertSelective(record);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public OaRlzybDimission selectShow(Integer dimission_id) {
		// TODO Auto-generated method stub
		return oaRlzybDimissionMapper.selectShow(dimission_id);
	}

	@Override
	public boolean updateDelete(Integer dimission_id) {
		int count = oaRlzybDimissionMapper.updateDelete(dimission_id);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

}
