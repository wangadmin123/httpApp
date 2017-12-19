package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import cn.tyyhoa.pojo.OaKfbProject;

public interface OaKfbProjectservice {
	// 增加
	public boolean addrenwu(OaKfbProject Project);

	/*
	 * //组长查看全部记录 public int selectcount();
	 */

	
	 //组长删除任务
	public boolean delbyid( Integer id);
	// 组长查看全部任务
	public List<OaKfbProject> selectByExample(OaKfbProject Project);

	// 组长修改进度之前的信息
	public OaKfbProject selecteditrenwu(Integer id);

	// 组长修改进度信息

	public boolean editrenwu(OaKfbProject Project);

	// 组长的全部任务
	public List<OaKfbProject> selectBygroup();
	// 历史组长的全部任务
	public List<OaKfbProject> selectBygrouphistory();
	// 查看对应的进度信息
	public List<OaKfbProject> selectBystageid(Integer groupid, Integer eid);

	/*
	 * 根据用户id查询任务列表 ,Integer cnindex,Integer pageCount
	 * 
	 * @param id
	 * 
	 * @return
	 */
	public List<OaKfbProject> selectByStu_Id(Integer user_id);

	/**
	 * 根据任务id查询任务信息
	 * 
	 * @param id
	 * @return
	 */
	public OaKfbProject selectByPId(@Param("id") Integer id);

	/**
	 * 组员提交任务
	 * 
	 * @param Project
	 * @return
	 */

	public boolean tjrenwu(OaKfbProject Project);

}
