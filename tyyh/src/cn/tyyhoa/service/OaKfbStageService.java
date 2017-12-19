package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaKfbStage;

public interface OaKfbStageService {
    //查询阶段列表
    public List<OaKfbStage> selectByExample();
    
    //查询阶段列表
    public OaKfbStage selectBygroup(Integer did);
}
