package cn.tyyhoa.service;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
/**
 * 回收咨询量
 * @author lenovo
 *
 */
public interface OaScbRetrieveConsulterService {
	/*回收*/
	public boolean RetrieveConsulter(Integer num);
	
	/*报名审核-通过*/
	public boolean PraiseCheckAuditing(Integer id);
	
	/*报名暂缓*/
	public boolean PraiseCheckAuditingNopass(Integer id);
	
	/*分发功能-分发*/
	public boolean Todistribute(Integer consultTeacherid,Integer id,Date allotTime);
	
	/*根据id查询——咨询量的口碑*/
	public String FindconsultWayName(Integer id);
	
	/*分发——口碑插入*/
	public boolean UpdatePraiseInto(Integer consultTeacherid,Integer id);
}
