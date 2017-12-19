package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaJzbPunish;

public interface OaJzbPunishService {

	/**
	 * 添加奖惩信息
	 * @param record
	 * @return
	 */
    boolean addOaJzbPunish(OaJzbPunish record);
    /**
     * 根据班级id查询该班所有学生的所有奖惩信息
     * @param gradeId
     * @return
     */
    List<OaJzbPunish> queryOaJzbPunishListByGradeId(int gradeId);
    /**
     * 根据学生姓名查询该学生的所有奖惩信息
     * @param stuId
     * @return
     */
    List<OaJzbPunish> queryOaJzbPunishListByStuName(int stuId);
    /**
     * 根据奖惩id查询奖惩信息
     * @return
     */
    OaJzbPunish queryOaJzbPunishById(int punishId);
    /**
     * 根据奖惩id修改奖惩信息
     * @param punishId
     * @return
     */
     boolean changeOaJzbPunishById(OaJzbPunish oaJzbPunish);
     /**
      * 从页面删除奖惩信息
      * @param id
      * @return
      */
    boolean deleteOaJzbPunishDeleteStatus(OaJzbPunish oaJzbPunish);
}
