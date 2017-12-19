package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaKfbMetting;
import cn.tyyhoa.pojo.OaKfbMettingExample;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OaKfbMettingMapper {
	long countByExample(OaKfbMettingExample example);

	int deleteByExample(OaKfbMettingExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(OaKfbMetting record);

	/**
	 * 组长添加会议记录
	 * 
	 * @param record
	 * @return
	 */
	public int addSelective(OaKfbMetting record);

	/**
	 * 根据员工id会议id查询会议记录
	 * 
	 * @param example starttime
	 * @return
	 * ,@Param("starttime") Date starttime
	 */
	public OaKfbMetting selectHyByIdAndUid(@Param("id") Integer id);

	/**
	 * 根据员工id查询小组会议记录
	 * 
	 * @param example starttime
	 * @return
	 * ,@Param("starttime") Date starttime
	 */
	public List<OaKfbMetting> selectHy(@Param("groupid") Integer groupid,@Param("starttime") String starttime);
	
	
	/**
	 * 经理根据条件查询小组会议记录
	 * 
	 * @param example
	 * @return
	 */
	public List<OaKfbMetting> selectJlHyByTj(@Param("groupid") Integer groupid,@Param("starttime") Date starttime);
	public List<OaKfbMetting> selectJlHyByid(@Param("groupid") Integer groupid);
	public List<OaKfbMetting> SelectHistoryMetting(Map<String, Object> paramMap);
	/**
	 * 经理查询全部小组会议记录
	 * 
	 * @param example
	 * @return
	 */
	public List<OaKfbMetting> selectJlHy();
	
	
	/**
	 * 组长修改会议记录
	 * @param uid
	 * @return
	 */
	public int updateByGroupid(OaKfbMetting record);
	
	
	
	List<OaKfbMetting> selectByExample(OaKfbMettingExample example);

	OaKfbMetting selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") OaKfbMetting record,
			@Param("example") OaKfbMettingExample example);

	int updateByExample(@Param("record") OaKfbMetting record,
			@Param("example") OaKfbMettingExample example);

	int updateByPrimaryKeySelective(OaKfbMetting record);

	int updateByPrimaryKey(OaKfbMetting record);
}