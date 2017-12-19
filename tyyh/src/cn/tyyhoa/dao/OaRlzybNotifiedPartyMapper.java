package cn.tyyhoa.dao;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybNotifiedParty;

public interface OaRlzybNotifiedPartyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaRlzybNotifiedParty record);

    int insertSelective(OaRlzybNotifiedParty record);
    
    /*收件人添加通知信息*/
   public int  addNotified_party(OaRlzybNotifiedParty record);
    /*根据通知id修改通知状态*/
   public int updateNoticeById(@Param("id") Integer id);
   /*根据用户id查询未读通知记录数*/
   public int selectWdCountByUid(@Param("notice_uid") Integer notice_uid);
   
    OaRlzybNotifiedParty selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaRlzybNotifiedParty record);

    int updateByPrimaryKey(OaRlzybNotifiedParty record);
}