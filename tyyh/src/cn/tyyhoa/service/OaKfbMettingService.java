package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaKfbMetting;

public interface OaKfbMettingService {

	/**
	 * 根据组长id查询小组会议记录
	 * 
	 * @param example
	 * @return
	 * ,Date starttime
	 */
	public List<OaKfbMetting> selectHy(Integer uid,String starttime);

	/**
	 * 组长添加会议记录
	 * @param record
	 * @return
	 */
	public boolean insertSelective(OaKfbMetting record);

	/**
	 * 经理根据条件查询小组会议记录
	 * 
	 * @param example
	 * @return
	 */
	public List<OaKfbMetting> selectJlHyByTj(Integer groupid, Date starttime);
	
	public List<OaKfbMetting> selectJlHyByid( Integer groupid);
	/**
	 * 经理查询小组会议记录
	 * 
	 * @param example
	 * @return
	 */
	public List<OaKfbMetting> selectJlHy();
	
	/**
	 * 根据员工id会议id查询会议记录
	 * 
	 * @param example starttime
	 * @return
	 * ,@Param("starttime") Date starttime
	 */
	public OaKfbMetting selectHyByIdAndUId( Integer id);

	/**
	 * 组长修改会议记录
	 * @param record
	 * @return
	 */
	public boolean updateByGroupid(OaKfbMetting record);

	List<OaKfbMetting> gethistoryMet(Map<String, Object> paramMap);
	

	
}
