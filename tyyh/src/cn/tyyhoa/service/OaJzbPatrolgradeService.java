package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbPatrolgrade;
import cn.tyyhoa.pojo.OaJzbQuestion;
import cn.tyyhoa.pojo.OaJzbStudent;

public interface OaJzbPatrolgradeService {
	//根据班级id查询巡班记录列表
	public List<OaJzbPatrolgrade> selectpatrolgrade(int grade_id);

	//根据班主任id查询班级列表
	public List<OaJwbGrade> selectgradelist(int classTeacherID);
    
    //根据班id查询学生列表
    public List<OaJzbStudent> selectstudentlist(int grade_id);
    
    //查询问题列表
    public List<OaJzbQuestion> selectquestlist();
    
    //添加巡班记录
    public int addpatrolgrade(OaJzbPatrolgrade patrol);
    
    //根据班级id查询班主任id
    public OaJzbPatrolgrade selectclassteacherid(int grade_id);
    
    //删除巡班记录
    public int delpatrolgrade(int id);
    
    //根据巡班列表id查询巡班详情记录单个
    public OaJzbPatrolgrade selectpatrol(int id);
    
    //修改巡班记录日期、问题
    public int updatepatrolgrade(int problem,int id);
    
    //删除巡班备注
    public int delxunbanbeizhu(int id);
    
    //根据id查询巡班备注
    public OaJzbPatrolgrade selectxunbanbeizhu(int id);
    
    //根据id修改巡班备注
    public int updatexunbanbeizhu(String problem,int id);
}
