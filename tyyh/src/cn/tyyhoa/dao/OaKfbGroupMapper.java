package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaKfbGroup;
import cn.tyyhoa.pojo.OaKfbGroupExample;

public interface OaKfbGroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaKfbGroup record);
    //查询全部小组
    public  List<OaKfbGroup> selectByAll();

    int insertSelective(OaKfbGroup record);
    
    //通过id查询全部小组
    public  List<OaKfbGroup> selectnameByid(@Param("id") Integer id);
    

    OaKfbGroup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaKfbGroup record);

    int updateByPrimaryKey(OaKfbGroup record);
    
    List<OaKfbGroup> selectSxGroup(OaKfbGroupExample example);
    
    List<OaKfbGroup> selectSxedGroup(Integer gradeid);
}