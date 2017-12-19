package cn.tyyhoa.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybActivity;

public interface OaJybActivityMapper {
    int deleteByPrimaryKey(Integer activity_id);

    int insert(OaJybActivity record);
   //新增活动
   public int insertSelective(OaJybActivity record);
   //查询
   public OaJybActivity selectByPrimaryKey(Integer activity_id);

    int updateByPrimaryKeySelective(OaJybActivity record);

    int updateByPrimaryKey(OaJybActivity record);
    //查询活动
   
    public List<OaJybActivity> GetAllActivity(@Param("index") int index,@Param("pageSize") int pageSize);
    //总条数
    public int AllCounts();



}