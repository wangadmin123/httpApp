package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbPunish;

public interface OaJzbPunishMapper {
	/**
	 * 添加奖惩信息
	 * @param record
	 * @return
	 */
    int insertOaJzbPunish(OaJzbPunish record);
    /**
     * 根据班级id查询该班所有学生的所有奖惩信息
     * @param gradeId
     * @return
     */
    List<OaJzbPunish> selectOaJzbPunishListByGradeId(@Param("gradeId")int gradeId);
    /**
     * 根据学生姓名查询该学生的所有奖惩信息
     * @param stuId
     * @return
     */
    List<OaJzbPunish> selectOaJzbPunishListByStuName(@Param("stuId")int stuId);
    /**
     * 根据奖惩id查询奖惩信息
     * @return
     */
    OaJzbPunish selectOaJzbPunishById(@Param("punishId")int punishId);
    /**
     * 根据奖惩id修改奖惩信息
     * @param punishId
     * @return
     */
     int updateOaJzbPunishById(OaJzbPunish oaJzbPunish);
     /**
      * 修改删除状态，0为在页面显示，1为不在页面显示
      * @param id
      * @return
      */
     int updateOaJzbPunishDeleteStatus(OaJzbPunish oaJzbPunish);
}