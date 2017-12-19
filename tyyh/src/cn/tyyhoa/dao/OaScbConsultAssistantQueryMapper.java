package cn.tyyhoa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbVisit;

/**
 * 咨询量查询
 * @author lenovo
 *
 */
public interface OaScbConsultAssistantQueryMapper {

	/*咨询量查询*/
	public List<OaScbConsulter>  ConsultAssistantQueryFind(Map<String, Object> map);
	
	/*查询页面-总记录数*/
	public int ConsultAssistantQuerPageCount(Map<String, Object> map);
	
	/*报名审核*/
	public List<OaScbConsulter> consultAssistantEnrollCheckFind(Map<String, Object> map);
	
	/*报名审核总记录数*/
	public int consultAssistantEnrollCheckFindtotalCount(Map<String, Object> map);

	/*分发咨询量查询*/
	public List<OaScbConsulter>	HandoutInfoFind(Map<String, Object> map);
	
	/*分发咨询量总记录数*/
	public int HandoutInfoFindtotalCount(Map<String, Object> map);
	
	/*编辑页面查询*/
	public OaScbConsulter AssistantReviseFind(@Param("id")Integer id);
	
	/*回访表查询*/
	public List<OaScbVisit> AssistantOaScbVisitFind(@Param("id")Integer id,@Param("stuId") Integer stuId);
}
