package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbGradedataMapper;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbGradedata;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.StudentDK;
import cn.tyyhoa.service.GrandDateadd;
@Service("grandDateadd")
public class GrandDateaddimpl implements GrandDateadd{
	@Autowired
    private OaJzbGradedataMapper oaJzbGradedataMapper;

	@Override
	public List<OaJzbGradedata> selectgranddate(int grade_id) {
		return oaJzbGradedataMapper.selectgranddate(grade_id);
	}
	

	@Override
	public List<OaJzbGradedata> selecttime(Date time, int grade_id,int currentPageNo,int pageSize) {
		return oaJzbGradedataMapper.selecttime(time, grade_id,(currentPageNo - 1)*pageSize,pageSize);
	}

	@Override
	public boolean insertGradedata(OaJzbGradedata insertGradedata) {
		int row = oaJzbGradedataMapper.insertGradedata(insertGradedata);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public List<OaJzbStudent> toSelectGradeStu(int grade_id) {
		return oaJzbGradedataMapper.toSelectGradeStu(grade_id);
	}


	@Override
	public int getDataByTime(Date time, int grade_id) {
		return oaJzbGradedataMapper.getDataByTime(time, grade_id);
	}


	@Override
	public List<OaJzbGradedata> selectStuDataBytime(Date time, int grade_id) {
		return oaJzbGradedataMapper.selectStuDataBytime(time, grade_id);
	}


	@Override
	public OaJzbGradedata selectStuDataBytimeAndStudent_id(Date time,
			int student_id) {
		return oaJzbGradedataMapper.selectStuDataBytimeAndStudent_id(time, student_id);
	}


	@Override
	public boolean updateGradeData(OaJzbGradedata insertGradedata) {
		int row = oaJzbGradedataMapper.updateGradeData(insertGradedata);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public List<StudentDK> selListDK(String time, String id) {
		// TODO Auto-generated method stub
		return oaJzbGradedataMapper.selListDK(time, id);
	}
}
	


