package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaKfbStage;

public interface OaKfbStageMapper {
	
	
	
	
	  //查询阶段列表
    public List<OaKfbStage> selectByExample();
    
    //查询阶段列表
    public List<OaKfbStage> selectBygroup(@Param("did") Integer did);
	
	
	
    int deleteByPrimaryKey(Integer id);

    int insert(OaKfbStage record);

    int insertSelective(OaKfbStage record);

    OaKfbStage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaKfbStage record);

    int updateByPrimaryKey(OaKfbStage record);
}