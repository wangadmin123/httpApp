package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbClassplanMapper;
import cn.tyyhoa.dao.OaRlzybEmployeeMapper;
import cn.tyyhoa.pojo.OaClassTeacher;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbStruts;
import cn.tyyhoa.pojo.OaJzbClassplan;
import cn.tyyhoa.pojo.OaJzbGradedata;
import cn.tyyhoa.pojo.OaJzbTermstage;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaXsbWeek;
import cn.tyyhoa.service.OaJzbClassplanService;

@Service("OaJzbClassplanService")
public class OaJzbClassplanServiceImpl implements OaJzbClassplanService {
	
	@Autowired
	OaJzbClassplanMapper oaJzbClassplanMapper;

	@Override
	public List<OaJzbClassplan> getClassPlansById(int id) {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.getClassPlanById(id);
	}

	

	

	@Override
	public int deteleClassplan(int id) {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.deteleClassplan(id);
	}

	@Override
	public List<OaJzbTermstage> gettermstages() {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.gettermstages();
	}



	@Override
	public int addClassplan(int emp_id, String question, String WORK,
			int grade_id, int Stage_id, String coursecontent, Date enteringTime) {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.addClassplan(emp_id, question, WORK, grade_id, Stage_id, coursecontent, enteringTime);
	}





	@Override
	public int UpdateClassplan(String question, String WORK, int Stage_id,
			String coursecontent,int Id) {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.UpdateClassplan(question, WORK, Stage_id, coursecontent,Id);
	}





	@Override
	public List<OaXsbWeek> getWeeksByGradeId(int gradeID, String stu_number,
			String stu_name, int pageindex, int pagesize,int whatweek) {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.getWeeksByGradeId(gradeID, stu_number, stu_name, pageindex, pagesize,whatweek);
	}





	@Override
	public int getCountWeek(int gradeID, String stu_number, String stu_name,int whatweek) {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.getCountWeek(gradeID, stu_number, stu_name,whatweek);
	}





	@Override
	public List<OaXsbWeek> getWhatweek() {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.getWhatweek();
	}





	@Override
	public int getClassPlanCount(int grade_id) {
		// TODO Auto-generated method stub
		return oaJzbClassplanMapper.getClassPlanCount(grade_id);
	}

	
	//得到所有班主任
		@Override
		public List<OaRlzybEmployee> ShowClassTeacher() {
			// TODO Auto-generated method stub
			return oaJzbClassplanMapper.getClassTeacher();
		}
		@Override
		public List<OaRlzybEmployee> ShowTeacher() {
			// TODO Auto-generated method stub
			return oaJzbClassplanMapper.getTeacher();
		}
		@Override
		public List<OaRlzybEmployee> ShowCareerteacher() {
			// TODO Auto-generated method stub
			return oaJzbClassplanMapper.getCareerteacher();
		}

		//显示班级详情
		@Override
		public OaJwbGrade ShowGradeByID(int id) {
		
			return oaJzbClassplanMapper.getGradeByID(id);
		}
		//得到班级所有的状态
		@Override
		public List<OaJwbStruts> getGradeStruts() {
			// TODO Auto-generated method stub
			return oaJzbClassplanMapper.getGradeStruts();
		}

		@Override
		public int getGradeCountById(int grade_id) {
			// TODO Auto-generated method stub
			return oaJzbClassplanMapper.getGradeCountById(grade_id);
		}
		@Override
		public List<OaJwbGrade> getGrades(String login_name, String emp_name,
				int strutsId,int emp_id) {
			return oaJzbClassplanMapper.getGrades(login_name, emp_name, strutsId,emp_id);
		}
		@Override
		public List<OaJwbGrade> grade() {
			// TODO Auto-generated method stub
			return oaJzbClassplanMapper.grade();
		}





		@Override
		public List<OaJzbGradedata> getGradedata(Integer classId, Date time) {
			// TODO Auto-generated method stub
			return oaJzbClassplanMapper.getGradedata(classId,time);
		}





		@Override
		public OaClassTeacher gettList(Integer classId) {
			// TODO Auto-generated method stub
			return oaJzbClassplanMapper.gettList(classId);
		}

}
