package cn.tyyhoa.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.service.OaScbRetrieveConsulterService;
import cn.tyyhoa.dao.OaScbRetrieveConsulterMapper;

/**
 * 回收咨询量
 * @author lenovo
 *
 */
@Service("OaScbRetrieveConsulterService")
public class OaScbRetrieveConsulterServiceImpl implements
		OaScbRetrieveConsulterService {

	@Autowired
	OaScbRetrieveConsulterMapper OaScbRetrieveConsulterMapper;

	/*回收*/
	public boolean RetrieveConsulter(Integer num) {
		if(OaScbRetrieveConsulterMapper.RetrieveConsulter(num)==1){
			return true;
			
		}else{
			return false;
		}
		 
	}

	/*报名审核-通过*/
	public boolean PraiseCheckAuditing(Integer id) {
		if(OaScbRetrieveConsulterMapper.PraiseCheckAuditing(id)==1){
			return true;
		}else{
			return false;
			
		}
		
	}

	/*报名审核-暂缓*/
	public boolean PraiseCheckAuditingNopass(Integer id) {
		if(OaScbRetrieveConsulterMapper.PraiseCheckAuditingNopass(id)==1){
			return true;
		}else{
			return false;
		}	
	}

	/**
	 * 分发-分发
	 */
	public boolean Todistribute(Integer consultTeacherid, Integer id,Date allotTime) {
		
		if(OaScbRetrieveConsulterMapper.Todistribute(consultTeacherid, id,allotTime)==1){
			return true;
		}else{
			return false;
		}	
	}

	/*分发——口碑插入*/
	public boolean UpdatePraiseInto(Integer consultTeacherid, Integer id) {
		
		if(OaScbRetrieveConsulterMapper.UpdatePraiseInto(consultTeacherid, id)==1){
			return true;
		}else{
			return false;
		}
	}

	/*根据id查询——咨询量的口碑*/
	public String FindconsultWayName(Integer id) {
		
		return OaScbRetrieveConsulterMapper.FindconsultWayName(id);
	}
	
}
