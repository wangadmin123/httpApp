package cn.tyyhoa.service;

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

public interface OaJzbPraiseService {

	//根据班主任id、咨询者姓名、缴费状态查询个人口碑
    public List<OaJzbPraise> selectpraiselist(int depart_id,int Teacher_id,String consultant_name,int payStauts,int currentPage,int pageSize);
    //根据班主任id、咨询者姓名、缴费状态查询个人口碑记录数
    public int selectpraiseCount(int depart_id,int Teacher_id,String consultant_name,int payStauts);
    //查询缴费状态
    public List<OaScbPaystatus> selectpaytype();
    
    //根据编号id查询个人口碑详情信息
    public OaJzbPraise selectpariseinfo(int id);
    
    //根据编号id查询个人口碑介绍人详情信息
    public OaJzbPraise selectpariseinfo2s(int id);
    /**
	 * 添加口碑
	 * @param oaJzbPraise
	 * @return
	 */
    public boolean inOaJzbPraise(OaJzbPraise oaJzbPraise);
    
    //根据班主任id查询所属部门
    public OaJzbPraise selectdepartmentid(int Teacher_id);
    //查询咨询者状态
    public List<OaScbConsultstatus> findShowZxStatus();
    //所有班级
    public List<OaJwbGrade> findShowGrade();
    //班主任查看所带班级
    public List<OaJwbGrade> findshowTeachId(int emp_id);
    //查询班主任
    public List<OaRlzybEmployee> findEmpNameShow();
    //插入咨询量
    public boolean findaddConsult(String consultant_name,int consultant_age,int sex,int status,String contact_way,String contacts,
    		int Record_id,Date date,String follow,String comments);
    //修改咨询量Id
    public boolean findEditConsultId(Date date,String consultant_name,String contact_way,int consultant_age);
}
