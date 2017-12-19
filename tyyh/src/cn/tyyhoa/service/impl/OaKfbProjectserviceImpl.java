package cn.tyyhoa.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaKfbProjectMapper;
import cn.tyyhoa.pojo.OaKfbProject;
import cn.tyyhoa.service.OaKfbProjectservice;

@Service(value = "OaKfbProjectservice")
public class OaKfbProjectserviceImpl implements OaKfbProjectservice {

	@Autowired
	OaKfbProjectMapper projectMapper;

	/**
	 * , int cnindex,int pageCount ,(cnindex - 1) * pageCount,pageCount
	 * 根据stu_id查询任务并分页
	 */
	@Override
	public List<OaKfbProject> selectByStu_Id(Integer user_id) {

		List<OaKfbProject> oaKfbProject = projectMapper.selectByStuId(user_id);
		
			return oaKfbProject;

	}

	@Override
	public OaKfbProject selectByPId(@Param("id") Integer id) {
		OaKfbProject OaKfbProject = projectMapper.selectByPId(id);
		if (OaKfbProject != null) {
			return OaKfbProject;
		}
		return null;
	}

	@Override
	public boolean tjrenwu(OaKfbProject Project) {
		if (projectMapper.tjrenwu(Project) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean addrenwu(OaKfbProject Project) {
		if (projectMapper.addrenwu(Project) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<OaKfbProject> selectByExample(OaKfbProject Project) {
		List<OaKfbProject> list = projectMapper.selectByExample(Project);
			return list;
	}



	@Override
	public boolean editrenwu(OaKfbProject Project) {
		if (projectMapper.editrenwu(Project) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public OaKfbProject selecteditrenwu(Integer id) {
		if (projectMapper.selecteditrenwu(id).size() != 0) {
			OaKfbProject oaKfbProject = projectMapper.selecteditrenwu(id)
					.get(0);
			return oaKfbProject;

		}

		return null;
	}

	@Override
	public List<OaKfbProject> selectBygroup() {
		List<OaKfbProject> list2 = projectMapper.selectBygroup();
		if (list2.size() != 0) {
			return list2;
		}
		return null;
	}
	@Override
	public List<OaKfbProject> selectBygrouphistory() {
		List<OaKfbProject> list2 = projectMapper.selectBygrouphistory();
		if (list2.size() != 0) {
			return list2;
		}
		return null;
	}
	@Override
	public List<OaKfbProject> selectBystageid(Integer groupid, Integer eid) {
		List<OaKfbProject> list3 = projectMapper.selectBystageid(groupid, eid);
		return list3;
	}

	@Override
	public boolean delbyid(Integer id) {
		if(projectMapper.delbyid(id)==1){
			return true;
		}
		return false;
		}	

}
