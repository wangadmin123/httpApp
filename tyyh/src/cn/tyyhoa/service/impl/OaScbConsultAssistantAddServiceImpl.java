package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsultAssistantAddService;
import cn.tyyhoa.service.OaScbConsultAssistantQueryService;
import cn.tyyhoa.dao.OaScbConsultAssistantAddMapper;

/**
 * 新增页面新增
 * @author lenovo
 *
 */
@Service("OaScbConsultAssistantAddService")
public class OaScbConsultAssistantAddServiceImpl implements
OaScbConsultAssistantAddService {

	
	@Autowired
	OaScbConsultAssistantAddMapper OaScbConsultAssistantAddMapper;
	/**
	 * 新增
	 */
	public boolean ConsultAssistantAdd(OaScbConsulter OaScbConsulter) {
		
	int result=OaScbConsultAssistantAddMapper.ConsultAssistantAdd(OaScbConsulter);
	
		if(result==1){
			return true;
		}else{
			return false;
		}
	
	
	}

	/**
	 * 编辑页面-修改咨询量
	 */
	public boolean AssistantReviseEditor(OaScbConsulter OaScbConsulter) {
		int result=OaScbConsultAssistantAddMapper.AssistantReviseEditor(OaScbConsulter);

		if(result==1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 编辑页面-新增回访表
	 */
	public boolean OaScbVisitAdd(OaScbVisit OaScbVisit) {
		int result=OaScbConsultAssistantAddMapper.OaScbVisitAdd(OaScbVisit);
		
		if(result==1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 不再显示
	 */
	public boolean displayNone(Integer id) {
		int result=OaScbConsultAssistantAddMapper.displayNone(id);
		
		if(result==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int insertRecord(OaScbRecord oaScbRecord) {
		
		return OaScbConsultAssistantAddMapper.insertRecord(oaScbRecord);
	}

	@Override
	public int maxId() {
		
		return OaScbConsultAssistantAddMapper.maxId();
	}


}
