package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybContractMapper;
import cn.tyyhoa.pojo.OaRlzybContract;
import cn.tyyhoa.service.OaRlzybContractService;

@Service("oaRlzybContractService")
public class OaRlzybContractServiceImpl implements OaRlzybContractService {
	
	@Autowired
	OaRlzybContractMapper oaRlzybContractMapper;

	@Override
	public List<OaRlzybContract> selectAllContract() {
		
		return oaRlzybContractMapper.selectAllContract();
	}

	@Override
	public OaRlzybContract showInfo(Integer emp_id) {
		
		return oaRlzybContractMapper.showInfo(emp_id);
	}

	@Override
	public Boolean insertSelective(OaRlzybContract record) {
		int result = oaRlzybContractMapper.insertSelective(record);
		if(result == 0){
			return false; 
		}else{
			return true;
		}
	}

	@Override
	public Boolean updateByContractEndDate(OaRlzybContract record) {
		int result = oaRlzybContractMapper.updateByContractEndDate(record);
		if(result == 0){
			return false; 
		}else{
			return true;
		}
	}

	@Override
	public List<OaRlzybContract> selectContractId() {
		
		return oaRlzybContractMapper.selectContractId();
	}

}
