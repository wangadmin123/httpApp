package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybNotice;

public interface OaRlzybNoticeMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(OaRlzybNotice record);

	int insertSelective(OaRlzybNotice record);

	/* 插入通知信息 */
	public int insertNotice(OaRlzybNotice record);

	/* 根据用户id查询已读通知信息 */
	public List<OaRlzybNotice> selectYdNoticeByUid(
			@Param("notice_uid") Integer notice_uid);

	/* 根据用户id查询未读通知信息 */
	public List<OaRlzybNotice> selectWdNoticeByUid(
			@Param("notice_uid") Integer notice_uid);
	/*根据通知id查询通知详情*/
	public OaRlzybNotice selectXqNotice(@Param("id") Integer id,@Param("notice_uid") Integer notice_uid);
	
	
	OaRlzybNotice selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(OaRlzybNotice record);

	int updateByPrimaryKey(OaRlzybNotice record);

	List<OaRlzybNotice> selectnotice(@Param("status")Integer status,@Param("user_id") Integer user_id);
}