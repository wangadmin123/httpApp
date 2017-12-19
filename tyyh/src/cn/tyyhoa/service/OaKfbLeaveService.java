package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaKfbGroup;
import cn.tyyhoa.pojo.OaKfbLeave;
import cn.tyyhoa.pojo.OaKfbUser;

public interface OaKfbLeaveService {

	   /**
     * 组员查询请假记录数
     * @param user_id
     * @return
     */
   public int selectCountByUid( Integer user_id);
   
   /**
    *  组员查询请假时间
    * @param user_id
    * @return
    */
   public List<OaKfbLeave> selectTimeByUid( Integer user_id);
   
	

	//组长查看请假记录
	 public List<OaKfbLeave> ZzselectByName(String stuname, Integer groupid);
	
	//添加学员请假表
	public boolean addleave(OaKfbLeave kfbLeave);
	
	/**
	 * 根据id查询学生学号，姓名，联系方式
	 * @param uid
	 * @return
	 */
	public OaKfbUser selectByUid(Integer uid);
	
	
	//查找学生信息
	public List<OaKfbLeave> ZyselectByType(OaKfbLeave oaKfbLeave);
	
	//查看请假详情
	public OaKfbLeave Leavelist(OaKfbLeave oaKfbLeave);
	
	//经理查看请假
	public List<OaKfbLeave> JlLeavelist(OaKfbLeave oaKfbLeave);
	
	//小组查询
	public List<OaKfbGroup> selectxz(OaKfbLeave oaKfbLeave);

	
}
