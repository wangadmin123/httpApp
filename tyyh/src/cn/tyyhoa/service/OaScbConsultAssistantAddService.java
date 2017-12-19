package cn.tyyhoa.service;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;

/**
 * 新增页面-新增
 * @author lenovo
 *
 */
public interface OaScbConsultAssistantAddService {
	
	/*新增咨询量*/
	public boolean ConsultAssistantAdd(OaScbConsulter OaScbConsulter);

	/*编辑页面-咨询量编辑*/
	public boolean AssistantReviseEditor(OaScbConsulter OaScbConsulter);
	
	/*编辑页面-回访表新增*/
	public boolean OaScbVisitAdd(OaScbVisit OaScbVisit);
	
	/*不再显示-删除*/
	public boolean displayNone(Integer id);
	//记事
	public int insertRecord(OaScbRecord oaScbRecord);
	//最大id
	public int maxId();
}
