package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;
import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaRlzybEmployee;

public interface OaJzbHebanService {
	
	/**
	 * 查询所有教员
	 * @return
	 */
	List<OaRlzybEmployee> selectJY();

	/**
	 * 查询所有班主任
	 * @return
	 */
	List<OaRlzybEmployee> selectBZR();
	
	/**
	 * 查询所有就业老师
	 * @return
	 */
	List<OaRlzybEmployee> selectJYLS();
	
	/**
	 * 查询所有可用机房
	 * @return
	 */
	List<OaJwbMotor> selectJF();
	
	/**
	 * 新增班级
	 * @return
	 */
	Integer insertGrade(OaJwbGrade ojg);
	
	/**
	 * 查询指定班级编号
	 * @return
	 */
	Integer selectZDGrade(String name);
	
	/**
	 * 删除指定班级
	 * @return
	 */
	Integer deleteZDGrade(Integer id,Integer id2);
	
	/**
	 * 查询班级类型
	 * @return
	 */
	List<OaJzbSpecialty> selectGradeType();
	
	/**
	 * 修改机房为已被占用
	 * @param id
	 * @return
	 */
	Integer updateMotor(Integer id);
	
	/**
	 * 修改机房为可用
	 * @param id
	 * @return
	 */
	Integer updateMotorKY(Integer id,Integer id2);
	
	/**
	 * 修改学生原班级编号为现班级
	 * @return
	 */
	Integer updateStuGrade(Integer yId,Integer yId2,Integer xId);
	
	/**
	 * 查询所有班级
	 */
	List<OaJwbGrade> selectGrade();
	
	/**
	 * 查询所有学期
	 */
	List<OaJwbSemester> selectsemester();
	
	/**
	 * 根据ID查询
	 * @return
	 */
	OaJwbGrade selectGradeId(Integer id);
}
