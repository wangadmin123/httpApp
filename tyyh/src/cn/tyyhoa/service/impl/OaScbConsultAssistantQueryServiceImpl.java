package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsultAssistantQueryService;
import cn.tyyhoa.dao.OaScbConsultAssistantQueryMapper;

/**
 * 查询
 * @author lenovo
 *
 */
@Service("OaScbConsultAssistantQueryService")
public class OaScbConsultAssistantQueryServiceImpl implements
		OaScbConsultAssistantQueryService {
	@Autowired
	OaScbConsultAssistantQueryMapper OaScbConsultAssistantQueryMapper;
	
	/**
	 * 查询咨询量
	 */
	public List<OaScbConsulter> ConsultAssistantQueryFind(Map<String, Object> map) {
		
		return OaScbConsultAssistantQueryMapper.ConsultAssistantQueryFind(map);
	}

	/**
	 * 报名审核查询
	 */
	public List<OaScbConsulter> consultAssistantEnrollCheckFind(
			Map<String, Object> map ) {
		
		return OaScbConsultAssistantQueryMapper.consultAssistantEnrollCheckFind(map);
	}

	/**
	 * 分发咨询量查询
	 */
	public List<OaScbConsulter> HandoutInfoFind(Map<String, Object> map) {
		
		return OaScbConsultAssistantQueryMapper.HandoutInfoFind(map);
	}
	
	

	/**
	 * 编辑页面查询
	 */
	public OaScbConsulter AssistantReviseFind(Integer id) {
		return OaScbConsultAssistantQueryMapper.AssistantReviseFind(id);
	}

	/**
	 * 咨询量表查询
	 */
	public List<OaScbVisit> AssistantOaScbVisitFind(Integer id,Integer stuId) {
		
		return OaScbConsultAssistantQueryMapper.AssistantOaScbVisitFind(id,stuId);
	}

	/**
	 * 分页-查询总记录数
	 */
	public int ConsultAssistantQuerPageCount(Map<String, Object> map) {
		
		return OaScbConsultAssistantQueryMapper.ConsultAssistantQuerPageCount(map);
	}

	/**
	 * 分发页面总记录数
	 */
	public int HandoutInfoFindtotalCount(Map<String, Object> map) {
		
		return OaScbConsultAssistantQueryMapper.HandoutInfoFindtotalCount(map);
	}

	/**
	 * 报名审核总记录数
	 */
	public int consultAssistantEnrollCheckFindtotalCount(Map<String, Object> map) {
		
		return OaScbConsultAssistantQueryMapper.consultAssistantEnrollCheckFindtotalCount(map);
	}
}
