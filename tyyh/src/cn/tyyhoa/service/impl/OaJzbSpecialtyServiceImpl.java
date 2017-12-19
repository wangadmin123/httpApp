package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbSpecialtyMapper;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.service.OaJzbSpecialtyService;

@Service("oaJzbSpecialtyService")
public class OaJzbSpecialtyServiceImpl implements OaJzbSpecialtyService {
	@Autowired
	OaJzbSpecialtyMapper  oaJzbSpecialtyMapper;

	@Override
	public boolean findinsert(OaJzbSpecialty record) {
		int row=oaJzbSpecialtyMapper.addInsert(record);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
}
