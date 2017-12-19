package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.OaXsbWeekTest;

public interface OaXsbWeekTestService {

	/**
	 * 查询周考成绩
	 */
	public List<OaXsbWeekTest> getWeektest(@Param("classId") int classId);

	/**
	 * 新增周考表
	 */
	public boolean insertWeek(List<OaXsbWeekTest> oaXsbWeekTestlist);

	/**
	 * 根据周时间查询周考表
	 * 
	 * @return
	 */
	public List<OaXsbWeekTest> selectWeekByClassIdAndCreateTime(
			@Param("classId") int classId, @Param("whatweek") int whatweek);
	
	
	/**
	 * 查询第几次周考
	 * @return
	 */
	public int getwhatWeek();
	
	/**
	 * 根据班级ID查询第几次周考
	 * @return
	 */
	public Integer selectWhatweekByClassId(@Param("classId") int classId);
	/**
	 * 根据班级Id查询周考次数
	 */
	public List<OaXsbWeekTest> selectAllWeekByClassId(@Param("classId") int classId);
	
	/**
	 * 修改成绩
	 * @param id
	 * @param score
	 * @return
	 */
	public Integer xgzk(@Param("id") Integer id,@Param("jc") Integer jc,@Param("gradeId") Integer gradeId,@Param("score") Integer score,@Param("i") Integer i);
	
}
