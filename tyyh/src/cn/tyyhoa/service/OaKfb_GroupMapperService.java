package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaKfbGroup;

public interface OaKfb_GroupMapperService {

	void updateGroup(OaKfbGroup group);
    
   // 添加小组
    void addgroup(OaKfbGroup group);
    
    //查询全部小组
    public  List<OaKfbGroup> selectByAll();
    
    
    //通过id查询全部小组
    public  OaKfbGroup selectnameByid(Integer id);
    
    //按小组group查询小组
    public  List<OaKfbGroup> selectsxGroup();
    
    
    OaKfbGroup selectGroupById(Integer id);

	void deleteGroup(Integer groupid);




	List<OaKfbGroup> selectsxedGroup(Integer gid);

}
