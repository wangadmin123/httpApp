package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.pojo.OakfbScore;
import cn.tyyhoa.pojo.OakfbScoreExample;


public interface OaKfbScoreService {
	

	void updatescore_out(OakfbScore score);

	List<OakfbScore> ClickIsExis(OakfbScoreExample example);

	void addscore_click(OakfbScore score);

	

	/* 根据员工id查询未签到次数*/
    public int  selectScoreCountByUid(OakfbScore record);
    /*根据员工id查询未签到日期*/
    public List<OakfbScore> selectScoreTimeByUid(OakfbScore record);
    /*根据员工id查询近期总分*/
    public Integer selectScoreFsCount (OakfbScore record);
    
    /*根据员工id查询迟到次数*/ 
    public int selectCdCountByUid(OakfbScore record);
    /*根据员工id查询迟到日期*/
    public List<OakfbScore> selectCdTimeByUid(OakfbScore record);
    
    /*根据员工id查询早退次数*/ 
    public int selectZtCountByUid(OakfbScore record);
    /*根据员工id查询早退日期*/
    public List<OakfbScore> selectZtTimeByUid(OakfbScore record);
	
	
	
	
	 //组长修改考勤的姓名
	 public  OakfbScore selectByid(Integer id);
	
	
	//组长查看考勤详情
	public List<OakfbScore> Byuserid(Integer user_id);
	
	//组长添加考勤
	 public boolean insert(OakfbScore record);
	 
	 

	 
	//组长修改考勤
	public boolean editbyuserid(OakfbScore record);
	
	

}
