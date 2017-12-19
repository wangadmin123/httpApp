package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbPraise;
import cn.tyyhoa.pojo.OaJzbStudentstatus;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.pojo.OaScbPaystatus;
import cn.tyyhoa.pojo.OaScbPaytype;

public interface OaJzbPraiseMapper {
    int insert(OaJzbPraise record);

    int insertSelective(OaJzbPraise record);
    
    //根据班主任id、咨询者姓名、缴费状态查询个人口碑
    public List<OaJzbPraise> selectpraiselist(@Param("depart_id")int depart_id,@Param("Teacher_id")int Teacher_id,@Param("consultant_name")String consultant_name,@Param("payStauts")int payStauts,
    					@Param("currentPage")int currentPage,@Param("pageSize")int pageSize);
    //根据班主任id、咨询者姓名、缴费状态查询个人口碑记录数
    public int selectpraiseCount(@Param("depart_id")int depart_id,@Param("Teacher_id")int Teacher_id,@Param("consultant_name")String consultant_name,@Param("payStauts")int payStauts);
    //查询缴费状态
    public List<OaScbPaystatus> selectpaytype();
    
    //根据编号id查询个人口碑咨询者详情信息
    public OaJzbPraise selectpariseinfo(@Param("id")int id);
    
    //根据编号id查询个人口碑介绍人详情信息
    public OaJzbPraise selectpariseinfo2s(@Param("id")int id);
    /**
     * 添加
     * @param oaJzbPraise
     * @return
     */
    public int inOaJzbPraise(OaJzbPraise oaJzbPraise);
    
    //根据班主任id查询所属部门
    public OaJzbPraise selectdepartmentid(@Param("Teacher_id")int Teacher_id);
    //查询咨询者状态
    public List<OaScbConsultstatus> ZXStatus();
    //主管查看所有班级
    public List<OaJwbGrade> showGrade();
    //班主任查看所带班级
    public List<OaJwbGrade> showTeachId(@Param("emp_id")int emp_id);
    //查询班主任
    public List<OaRlzybEmployee> empNameShow();
    //插入咨询量
    public int addConsult(@Param("name")String consultant_name,@Param("age")int consultant_age,@Param("sex")int sex,
    		@Param("status")int status,@Param("telphone1")String contact_way,@Param("ungenTelphone")String contacts,
    		@Param("education")int Record_id,@Param("allotTime")Date date,@Param("follow")String follow,@Param("comments")String comments);
    //修改咨询量Id
    public int editConsultId(@Param("Register_time")Date date,@Param("name")String consultant_name,@Param("contact_way")String contact_way,@Param("consultant_age")int consultant_age);
}