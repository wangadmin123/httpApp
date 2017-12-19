package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbPatrolgrade;
import cn.tyyhoa.pojo.OaJzbQuestion;
import cn.tyyhoa.pojo.OaJzbStudent;

public interface OaJzbPatrolgradeMapper {
    int insert(OaJzbPatrolgrade record);

    int insertSelective(OaJzbPatrolgrade record);
    
    //根据班级id查询巡班记录列表
    public List<OaJzbPatrolgrade> selectpatrolgrade(@Param("grade_id")int grade_id);
    
    //根据巡班列表id查询巡班详情记录单个
    public OaJzbPatrolgrade selectpatrol(@Param("id")int id);
    
    //根据班主任id查询班级列表
    public List<OaJwbGrade> selectgradelist(@Param("classTeacherID")int classTeacherID);
    
    //根据班id查询学生列表
    public List<OaJzbStudent> selectstudentlist(@Param("grade_id")int grade_id);
    
    //查询问题列表
    public List<OaJzbQuestion> selectquestlist();
    
    //添加巡班记录
    public int addpatrolgrade(OaJzbPatrolgrade patrol);
    
    //根据班级id查询班主任id
    public OaJzbPatrolgrade selectclassteacherid(@Param("grade_id")int grade_id);
    
    //根据id删除巡班记录
    public int delpatrolgrade(@Param("id")int id);
    
    //修改巡班记录日期、问题
    public int updatepatrolgrade(@Param("problem")int problem,@Param("id")int id);
    
    //删除巡班备注
    public int delxunbanbeizhu(@Param("id")int id);
    
    //根据id查询巡班备注
    public OaJzbPatrolgrade selectxunbanbeizhu(@Param("id")int id);
    
    //根据id修改巡班备注
    public int updatexunbanbeizhu(@Param("problem")String problem,@Param("id")int id);
}