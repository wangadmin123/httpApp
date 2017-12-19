package cn.tyyhoa.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybWorkorderMapper;
import cn.tyyhoa.pojo.OaRlzybWorkorder;
import cn.tyyhoa.pojo.OaRlzybWorkorderExample;
import cn.tyyhoa.service.OaRlzybWorkordersService;

@Service("OaRlzybWorkorderService")
public class OaRlzybWorkorderServiceImpl implements OaRlzybWorkordersService{

	@Autowired
	OaRlzybWorkorderMapper workorderMapper;
	
	@Override
	public int addWorkorder(OaRlzybWorkorder workorder) {
		// TODO Auto-generated method stub
		return workorderMapper.insertSelective(workorder);
	}
	@Override
	public List<OaRlzybWorkorder> selectAll(Integer emp_id) {
		// TODO Auto-generated method stub
		return workorderMapper.selectAllByMonth(emp_id);
	}
	@Override
	public OaRlzybWorkorder selectById(Integer workorder_id) {
		// TODO Auto-generated method stub
		return workorderMapper.selectByPrimaryKeyWithName(workorder_id);
	}
	@Override
	public int workorderupdate(OaRlzybWorkorder oaRlzybWorkorder) {
		// TODO Auto-generated method stub
		return workorderMapper.updateByPrimaryKeySelective(oaRlzybWorkorder);
	}
	@Override
	public long countByEmp_id(Integer empid) {
		// TODO Auto-generated method stub
		return workorderMapper.countByEmp_id(empid);
	}

}
