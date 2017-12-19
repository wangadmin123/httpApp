package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.OaXsbMonthly;

public interface OaXsbMonthTestService {
	/**
	 * 查询月考成绩
	 */
	public List<OaXsbMonthly> getMonthtest(@Param("classId") int classId);

	/**
	 * 新增月考表
	 */
	public boolean insertMonthly(List<OaXsbMonthly> oaXsbMonthly);

	/**
	 * 根据时间查询月考表
	 * 
	 * @param createTime
	 * @return
	 */
	public List<OaXsbMonthly> selectMonthByClassIdAndCreateTime(
			@Param("classId") int classId, @Param("createTime") String createTime);
	/*
	 * 根据学生id查询最近月考笔试机试成绩
	 */
	public OaXsbMonthly selectMonthByStuId(@Param("studentId") int studentId);
	
	/**
	 * 修改成绩
	 * @param id
	 * @param score
	 * @return
	 */
	public Integer xgyk(@Param("id") Integer id,@Param("time") String time,@Param("gradeId") Integer gradeId,@Param("score") Integer score,@Param("i") Integer i);
}
