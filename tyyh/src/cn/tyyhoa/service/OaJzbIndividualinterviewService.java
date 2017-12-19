package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbIndividualinterview;

public interface OaJzbIndividualinterviewService {
	/*根据姓名查询班级学员个性访谈*/
    public List<OaJzbIndividualinterview> stuList(String stu_name,int Term_id,String month,int grade_id);
    
    /*添加学员个性访谈*/
    public boolean addIndividualinterview(OaJzbIndividualinterview oaJzbIndividualinterview);
    
    /*根据id查询学员个性访谈*/
    public OaJzbIndividualinterview getStuIndividualinterviewById(int id);
    
    /*修改学员个性访谈*/
    public boolean editStuIndividualinterview(OaJzbIndividualinterview oaJzbIndividualinterview);
    
    /*删除学生个性化访谈*/
    public boolean deleteStuIndividualinterview(int id);
    
    /*学期*/
    public List<OaJwbSemester> semesters();
}
