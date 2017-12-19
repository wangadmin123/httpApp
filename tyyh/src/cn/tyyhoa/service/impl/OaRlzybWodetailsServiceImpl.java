package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybWodetailsMapper;
import cn.tyyhoa.pojo.OaRlzybWodetails;
import cn.tyyhoa.pojo.OaRlzybWodetailsExample;
import cn.tyyhoa.service.OaRlzybWodetailsService;
@Service("OaRlzybWodetailsService")
public class OaRlzybWodetailsServiceImpl implements OaRlzybWodetailsService{

	@Autowired
	OaRlzybWodetailsMapper wodetailsMapper;
	
	@Override
	public int insertwodetails(OaRlzybWodetails oaRlzybWodetails) {	
		// TODO Auto-generated method stub
		return wodetailsMapper.insertSelective(oaRlzybWodetails);
	}

	@Override
	public List<OaRlzybWodetails> SelectWoByThisMonth(Integer emp_id) {
		// TODO Auto-generated method stub
		return wodetailsMapper.SelectWoByThisMonth(emp_id);
	}

	@Override
	public List<OaRlzybWodetails> selectByWorkorderId(OaRlzybWodetailsExample wodetailsExample) {
		// TODO Auto-generated method stub
		return wodetailsMapper.selectByExample(wodetailsExample);
	}


	public int wodetailsupdate(OaRlzybWodetails wodetails) {
		// TODO Auto-generated method stub
		return wodetailsMapper.updateByPrimaryKeySelective(wodetails);
	}

}
