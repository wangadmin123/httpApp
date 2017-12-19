package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbOpenClassMapper;
import cn.tyyhoa.pojo.OaJzbOpenClass;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.service.OaJzbOpenClassService;
@Service("openclass")
public class OaJzbOpenClassServiceImpl implements OaJzbOpenClassService {
	@Autowired
	OaJzbOpenClassMapper OpenClassMapper;
	
	@Override
	public boolean getAddOpenClass(OaJzbOpenClass openclass) {
		int row=OpenClassMapper.addOpenClass(openclass);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public OaJzbOpenClass findOpenClass(int id) {
		
		return OpenClassMapper.selOpenClass(id);
	}
	@Override
	public boolean updataOpenclass(OaJzbOpenClass openclass) {
		int row=OpenClassMapper.editOpenClass(openclass);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public int deleOpenClass(int id) {
		return OpenClassMapper.delOpenClass(id);
	}
	@Override
	public List<OaJzbOpenClass> findNameSelect(String name,int gradeId,int currentPage,int pageSize) {
		return OpenClassMapper.getNameSelect(name,gradeId,(currentPage-1)*pageSize,pageSize);
	}
	@Override
	public List<OaScbEducation> findShowEducation() {
		// TODO Auto-generated method stub
		return OpenClassMapper.showEducation();
	}
	@Override
	public int findNameSelectCount(String name, int gradeId) {
		// TODO Auto-generated method stub
		return OpenClassMapper.getNameSelectCount(name, gradeId);
	}
}
