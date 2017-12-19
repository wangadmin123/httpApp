package cn.tyyhoa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import cn.tyyhoa.pojo.OaRlzybLeave;

public interface OaRlzybLeaveMapper {
    int deleteByPrimaryKey(Integer leave_id);

    int insert(OaRlzybLeave record);

    //选择性的，①通过id插入离岗原因字段
    int insertSelective(OaRlzybLeave record);

    //查询所有离岗类型(填充离岗信息)
    OaRlzybLeave selectByPrimaryKey(Integer leave_id);
    
    //查询所有离岗信息
    List<OaRlzybLeave>  selectAllByPrimaryKey();

    int updateByPrimaryKeySelective(OaRlzybLeave record);

    int updateByPrimaryKey(OaRlzybLeave record);
    
    //合计天数
    double totaldays(OaRlzybLeave record);
    
    //通过条件查询所有数据,查询数据的条数
    int selectOaRlzybLeaveCountByCondition(Map<String,Object> condition);
    
    //通过分页查询所有数据,查询所有数据
    List<OaRlzybLeave> selectOaRlzybLeaveByPage(Map<String,Object> condition);

    //查看页面
   OaRlzybLeave  selectAllByleave_id(@Param("leave_id") Integer leave_id);
   
   
int deleteOaRlzybLeaveByLeaveId(@Param("leave_id") Integer leave_id);


int updateOaRlzybLeaveLeaveBackTimeByLeaveId(OaRlzybLeave oaRlzybLeave);
}