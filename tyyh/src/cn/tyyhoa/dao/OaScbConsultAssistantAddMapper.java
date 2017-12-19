package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;

/**
 * 新增页面-新增
 * @author lenovo
 *
 */
public interface OaScbConsultAssistantAddMapper {

	/*新增咨询量*/
	public int ConsultAssistantAdd(OaScbConsulter OaScbConsulter);
	
	/*编辑页面-咨询量编辑*/
	public int AssistantReviseEditor(OaScbConsulter OaScbConsulter);

	/*编辑页面-回访表新增*/
	public int OaScbVisitAdd(OaScbVisit OaScbVisit);
	
	/*不再显示-删除*/
	public int displayNone(@Param("id")Integer id);
	
	/*向口碑表插入咨询师*/
	public int praiseConsultantId();
	//记事
	public int insertRecord(OaScbRecord oaScbRecord);
	//最大id
	public int maxId();
}
