package cn.tyyhoa.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;
import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.service.OaJwbGradeService;
import cn.tyyhoa.service.OaJzbHebanService;

@Controller
@RequestMapping("/oajzb")
public class OaJzbHebanController {
	@Resource(name="OaJzbHebanService")
	private OaJzbHebanService ojhs;
	@Autowired
	OaJwbGradeService oaJwbGradeService;
	/**
	 * 查询教员
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="teacherID",produces="application/json;charset=utf-8")
	public Object teacherID(){
		List<OaRlzybEmployee> list = new ArrayList<OaRlzybEmployee>();
		list = ojhs.selectJY();
		String json = JSON.toJSONString(list);
		System.out.println(json);
		return json;
	}

	/**
	 * 查询班主任
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="classTeacherID",produces="application/json;charset=utf-8")
	public Object classTeacherID(){
		List<OaRlzybEmployee> list = new ArrayList<OaRlzybEmployee>();
		list = ojhs.selectBZR();
		String json = JSON.toJSONString(list);
		System.out.println(json);
		return json;
	}

	/**
	 * 查询就业老师
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="obtainID",produces="application/json;charset=utf-8")
	public Object obtainID(){
		List<OaRlzybEmployee> list = new ArrayList<OaRlzybEmployee>();
		list = ojhs.selectJYLS();
		String json = JSON.toJSONString(list);
		System.out.println(json);
		return json;
	}

	/**
	 * 查询可用机房
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="motorid",produces="application/json;charset=utf-8")
	public Object motorid(){
		List<OaJwbMotor> list = new ArrayList<OaJwbMotor>();
		list = ojhs.selectJF();
		String json = JSON.toJSONString(list);
		System.out.println(json);
		return json;
	}

	/**
	 * 查询班级类型
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="specialtyID",produces="application/json;charset=utf-8")
	public Object specialtyID(){
		List<OaJzbSpecialty> list = new ArrayList<OaJzbSpecialty>();
		list = ojhs.selectGradeType();
		String json = JSON.toJSONString(list);
		System.out.println(json);
		return json;
	}

	/**
	 * 查询所有班级
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="gradeId",produces="application/json;charset=utf-8")
	public Object gradeId(){
		List<OaJwbGrade> list = new ArrayList<OaJwbGrade>();
		list = ojhs.selectGrade();
		String json = JSON.toJSONString(list);
		System.out.println(json);
		return json;
	}

	/**
	 * 查询所有阶段
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="stage",produces="application/json;charset=utf-8")
	public Object stage(){
		List<OaJwbSemester> list = new ArrayList<OaJwbSemester>();
		list = ojhs.selectsemester();
		String json = JSON.toJSONString(list);
		System.out.println(json);
		return json;
	}

	@Transactional
	@ResponseBody
	@RequestMapping(value="ins",produces="application/json;charset=utf-8")
	public Object ins(
			Integer gradeId,
			Integer gradeId2,
			String name,
			Integer teacherID,
			Integer classTeacherID,
			Integer obtainID,
			Integer motorid,
			Integer specialtyID,
			Integer stage,
			String createTime){
		OaJwbGrade ojg = new OaJwbGrade();
		ojg.setName(name);
		ojg.setTeacherID(teacherID);
		ojg.setClassTeacherID(classTeacherID);
		ojg.setObtainID(obtainID);
		ojg.setMotorid(motorid);
		ojg.setStage(stage);
		ojg.setSpecialtyID(specialtyID);
		ojg.setCreateTime(Date.valueOf(createTime));



		try {

			
			
				ojhs.deleteZDGrade(gradeId, gradeId2);
				ojhs.insertGrade(ojg);
				Integer GId = ojhs.selectZDGrade(name);
				ojhs.updateStuGrade(gradeId, gradeId2, GId);
				oaJwbGradeService.insertFuckClass();
				return "true";
		} catch (Exception e) {
			// TODO: handle exception
			return "false";
		}

		
	}

	@RequestMapping(value="OaJzbHeban")
	public String OaJzbHeban(){
		return "human_resource_department/OaJzbHeban";
	}

	public OaJzbHebanService getOjhs() {
		return ojhs;
	}

	public void setOjhs(OaJzbHebanService ojhs) {
		this.ojhs = ojhs;
	}
}
