package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybContract;

public interface OaRlzybContractService {
	
	List<OaRlzybContract> selectAllContract();
	
	OaRlzybContract showInfo(Integer emp_id);
	
	Boolean insertSelective(OaRlzybContract record);
	
	Boolean updateByContractEndDate(OaRlzybContract record);
	
	List<OaRlzybContract> selectContractId();

}
