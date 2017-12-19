package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaXsbDailypaper;

public interface OaXsbDailypaperMapper {
	/**
	 * 添加日报表
	 */
	public int insertDaily(List<OaXsbDailypaper> oaXsbDailypaperList);

	/**
	 * 查看日报表
	 * 
	 * @return
	 */
	public List<OaXsbDailypaper> getAlldaily(@Param("classId") int classId);

	/**
	 * 根据Id查看日报表
	 */
	public OaXsbDailypaper selectDailyById(@Param("id") int id);

	/**
	 * 根据创建时间查询 日报表
	 */
	public List<OaXsbDailypaper> selectDailyByClassIdAndCreatetime(
			@Param("classId") int classId, @Param("createTime") Date createTime);

	/**
	 * 修改日报表
	 */
	public int updateDailystatement(OaXsbDailypaper oaXsbDailypaper);
	
	/**
	 * 查看当天是否录入作业
	 * @param studentClassId
	 * @param dateStyle
	 * @return
	 */
	public Integer zy(@Param("studentClassId") Integer studentClassId,@Param("dateStyle") String dateStyle);

}
