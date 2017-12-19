package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tyyhoa.dao.OaJzbProjectMapper;
import cn.tyyhoa.pojo.OaJzbGroup;
import cn.tyyhoa.pojo.OaJzbProject;
import cn.tyyhoa.service.OaJzbProjectService;
@Service("oaJzbProjectService")
public class OaJzbProjectServiceImpl implements OaJzbProjectService{
	@Autowired
	private OaJzbProjectMapper oaJzbProjectMapper;

	@Override
	public int addGrupus(String group_name, int grade_id) {
		// TODO Auto-generated method stub
		return oaJzbProjectMapper.addGrupus(group_name, grade_id);
	}

	@Override
	public int addProject(Integer Student_id, Integer group_id,Date entering_time,int stage_id) {
		// TODO Auto-generated method stub
		return oaJzbProjectMapper.addProject(Student_id, group_id,entering_time,stage_id);
	}

	@Override
	public OaJzbGroup getGroupID() {
		// TODO Auto-generated method stub
		return oaJzbProjectMapper.getGroupID();
	}

	@Override
	public List<OaJzbProject> getProjdectsByGrade_id(Integer grade_id) {
		// TODO Auto-generated method stub
		return oaJzbProjectMapper.getProjdectsByGrade_id(grade_id);
	}

	@Override
	public OaJzbProject getProjectByID(int id) {
		// TODO Auto-generated method stub
		return oaJzbProjectMapper.getProjectByID(id);
	}

	@Override
	public int updateProjectByID(double Score, double Group_score,
			String Group_expression, String remarks, int id) {
		// TODO Auto-generated method stub
		return oaJzbProjectMapper.updateProjectByID(Score, Group_score, Group_expression, remarks, id);
	}

	@Override
	public int deleteProjectById(int id) {
		// TODO Auto-generated method stub
		return oaJzbProjectMapper.deleteProjectById(id);
	}
	
}
