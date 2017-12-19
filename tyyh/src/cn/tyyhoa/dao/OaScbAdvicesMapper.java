package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbAdvices;
import cn.tyyhoa.util.MessageUtil;

public interface OaScbAdvicesMapper {
	/**
	 * 获取全部通知
	 * @param id
	 * @return
	 */
	public List<OaScbAdvices> getById(@Param("id") Integer id);
	
	/**
	 * 修改通知状态为已读
	 * @param id
	 * @return
	 */
	public Integer yidu(@Param("id") Integer id);
	
	/**
	 * 删除通知
	 * @param aid
	 * @return
	 */
	public Integer del(@Param("aid") Integer aid);
	
	/**
	 * 添加通知
	 * @param mu
	 * @return
	 */
	public Integer add(MessageUtil mu);
	
	/**
	 * 根据职位查询职员id
	 * @param aid
	 * @return
	 */
	public List<OaRlzybUser> getByPname(@Param("pname") String pname);
	
	/**
	 * 未读信息的条数
	 * @param id
	 * @return
	 */
	public Integer weidu(@Param("id") Integer id);
	
}
