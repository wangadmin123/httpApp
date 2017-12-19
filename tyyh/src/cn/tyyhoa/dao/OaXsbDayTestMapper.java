package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaXsbDayTest;

public interface OaXsbDayTestMapper {

	/**
	 * 查看日考表
	 */
	public List<OaXsbDayTest> getAlldaytest(@Param("classId") int classId);

	/**
	 * 新增日考表
	 */
	public int insertDay(List<OaXsbDayTest> oaXsbDayTestList);

	/**
	 * 根据班级Id时间查询周考表
	 * 
	 * @return
	 */
	public List<OaXsbDayTest> selectDatByClassIdAndCreateTime(
			@Param("classId") int classId, @Param("createTime") Date createTime);
	
	/**
	 * 修改成绩
	 * @return
	 */
	public Integer xg(@Param("id") Integer id,@Param("score") Integer score,@Param("time") String time);

	/**
	 * 查看当天是否录入日考
	 * @param studentClassId
	 * @param dateStyle
	 * @return
	 */
	public Integer ck(@Param("studentClassId") Integer studentClassId,@Param("dateStyle") String dateStyle);
	
	/**
	 * 查询当天是否添加作业
	 */
	public Integer zy(@Param("studentClassId") Integer studentClassId,@Param("dateStyle") String dateStyle);
}
