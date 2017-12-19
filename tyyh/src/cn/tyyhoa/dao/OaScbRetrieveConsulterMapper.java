package cn.tyyhoa.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

/**
 * 回收咨询量
 * @author lenovo
 *
 */
public interface OaScbRetrieveConsulterMapper {

	/*回收*/
	public int RetrieveConsulter(@Param("id")Integer num);
	
	/*报名审核-通过*/
	public int PraiseCheckAuditing(@Param("id")Integer id);
	
	/*报名审核-暂缓*/
	public int PraiseCheckAuditingNopass(@Param("id")Integer id);
	
	/*分发功能-分发*/
	public int Todistribute(@Param("consultTeacherid")Integer consultTeacherid,@Param("id")Integer id,@Param("allotTime") Date allotTime );
	
	/*根据id查询——咨询量的口碑*/
	public String FindconsultWayName(@Param("id")Integer id);
	
	/*分发——口碑插入*/
	public int UpdatePraiseInto(@Param("consultTeacherid")Integer consultTeacherid,@Param("id")Integer id);
}
