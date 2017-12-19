package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaJzbDailyschedule;

public interface OaJzbDailyscheduleMapper {
    int deleteByPrimaryKey(Integer dailyschedule_id);

    int insert(OaJzbDailyschedule record);

    int insertSelective(OaJzbDailyschedule record);

    OaJzbDailyschedule selectByPrimaryKey(Integer dailyschedule_id);

    int updateByPrimaryKeySelective(OaJzbDailyschedule record);

    int updateByPrimaryKey(OaJzbDailyschedule record);
}