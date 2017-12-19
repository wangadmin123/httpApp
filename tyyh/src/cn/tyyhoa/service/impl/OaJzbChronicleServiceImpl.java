package cn.tyyhoa.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybChronicleMapper;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.service.OaJzbChronicleService;
@Service
public class OaJzbChronicleServiceImpl implements OaJzbChronicleService{
	@Autowired
	OaJybChronicleMapper oaJybChronicleMapper;
	@Override
	public int insertSelective(OaJybChronicle oaJybChronicle) {
		// TODO Auto-generated method stub
		return oaJybChronicleMapper.insertSelective(oaJybChronicle);
	}
	@Override
	public int delectSelective(String zt, String time, Integer id) {
		// TODO Auto-generated method stub
		return oaJybChronicleMapper.delectSelective(zt, time, id);
	}
	
	/*public int deletea(int student_id, Date event_time) {
		// TODO Auto-generated method stub
		return oaJybChronicleMapper.deletea(student_id, event_time);
	}*/

}
