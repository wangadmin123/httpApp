package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaJybWorkPlan;

public interface OaJybWorkPlanMapper {
    int deleteByPrimaryKey(Integer work_plan_id);

    int insert(OaJybWorkPlan record);

    int insertSelective(OaJybWorkPlan record);

    OaJybWorkPlan selectByPrimaryKey(Integer work_plan_id);

    int updateByPrimaryKeySelective(OaJybWorkPlan record);

    int updateByPrimaryKey(OaJybWorkPlan record);
}