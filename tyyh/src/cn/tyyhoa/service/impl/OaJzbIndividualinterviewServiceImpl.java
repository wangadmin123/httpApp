package cn.tyyhoa.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbIndividualinterviewMapper;
import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbIndividualinterview;
import cn.tyyhoa.service.OaJzbIndividualinterviewService;

/**
 * 个性化访谈
 * @author 曲行舟
 *
 */
@Service("oaJzbIndividualinterviewService")
public class OaJzbIndividualinterviewServiceImpl implements OaJzbIndividualinterviewService{
	
	@Autowired
	OaJzbIndividualinterviewMapper oaJzbIndividualinterviewMapper;
	
	public void setOaJzbIndividualinterviewMapper(
			OaJzbIndividualinterviewMapper oaJzbIndividualinterviewMapper) {
		this.oaJzbIndividualinterviewMapper = oaJzbIndividualinterviewMapper;
	}

	
	
	 /*添加学员个性访谈*/
	@Override
	public boolean addIndividualinterview(
			OaJzbIndividualinterview oaJzbIndividualinterview) {
		int row = oaJzbIndividualinterviewMapper.addIndividualinterview(oaJzbIndividualinterview);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}
	
	/*根据id查询学员个性访谈*/
	@Override
	public OaJzbIndividualinterview getStuIndividualinterviewById(int id) {
		return oaJzbIndividualinterviewMapper.getStuIndividualinterviewById(id);
	}

	/*修改学员个性访谈*/
	@Override
	public boolean editStuIndividualinterview(
			OaJzbIndividualinterview oaJzbIndividualinterview) {
		int row = oaJzbIndividualinterviewMapper.editStuIndividualinterview(oaJzbIndividualinterview);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}

	
	/*删除学生个性化访谈*/
	@Override
	public boolean deleteStuIndividualinterview(int id) {
		int row = oaJzbIndividualinterviewMapper.deleteStuIndividualinterview(id);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}
	
	
	/*根据姓名查询班级学员个性访谈*/
	@Override
	public List<OaJzbIndividualinterview> stuList(String stu_name,int Term_id,String month,int grade_id) {
		// TODO Auto-generated method stub
		return oaJzbIndividualinterviewMapper.stuList(stu_name,Term_id,month,grade_id);
	}



	/*学期*/
	@Override
	public List<OaJwbSemester> semesters() {
		return oaJzbIndividualinterviewMapper.semesters();
	}
	
}
