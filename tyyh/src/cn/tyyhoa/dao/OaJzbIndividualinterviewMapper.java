package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbIndividualinterview;

public interface OaJzbIndividualinterviewMapper {
    int insert(OaJzbIndividualinterview record);

    int insertSelective(OaJzbIndividualinterview record);
    
    
    
//----------------------------------------------------------------
    
    /*根据姓名查询班级学员个性访谈*/
    public List<OaJzbIndividualinterview> stuList(@Param("stu_name")String stu_name,@Param("Term_id")int Term_id,@Param("month")String month,@Param("grade_id")int grade_id);
    
    
    /*添加学员个性访谈*/
    public int addIndividualinterview(OaJzbIndividualinterview oaJzbIndividualinterview);
    
    
    /*根据id查询学员个性访谈*/
    public OaJzbIndividualinterview getStuIndividualinterviewById(@Param("id")int id);
    
    
    /*修改学员个性访谈*/
    public int editStuIndividualinterview(OaJzbIndividualinterview oaJzbIndividualinterview);
    
    /*删除学生个性化访谈*/
    public int deleteStuIndividualinterview(@Param("id")int id);
    
    /*学期*/
    public List<OaJwbSemester> semesters();
}