package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaScbConsultlesson;
import cn.tyyhoa.service.OaScbSpecialtyService;
import cn.tyyhoa.dao.OaScbSpecialtyMapper;

/**
 * 课程
 * @author lenovo
 *
 */
@Service("OaScbSpecialtyService")
public class OaScbSpecialtyServiceImpl implements OaScbSpecialtyService {

	@Autowired
	OaScbSpecialtyMapper OaScbSpecialtyMapper;

	/**
	 * 查询所有的咨询课程
	 */
	public List<OaScbConsultlesson> ConsultlessonFind() {
		
		return OaScbSpecialtyMapper.SpecialtyFind();
	}
	
	
	

}
