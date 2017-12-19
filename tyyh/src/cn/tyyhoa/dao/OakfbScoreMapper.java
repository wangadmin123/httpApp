package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.pojo.OakfbScore;
import cn.tyyhoa.pojo.OakfbScoreExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OakfbScoreMapper {
	
	
	
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
	
	
	
	
	
	
	
	//组长查看考勤详情
	public List<OakfbScore> Byuserid(@Param("user_id") Integer user_id);
	
	//组长添加考勤
	 public int insert(OakfbScore record);
	 
	 //组长修改考勤的姓名
	 public  List<OakfbScore> selectByid(@Param("id") Integer id);
	 
	 
	//组长修改考勤
	public int editbyuserid(OakfbScore record);
	

	
	
	
    long countByExample(OakfbScoreExample example);

    int deleteByExample(OakfbScoreExample example);

    int deleteByPrimaryKey(Integer id);

   

    int insertSelective(OakfbScore record);

    List<OakfbScore> selectByExample(OakfbScoreExample example);

    OakfbScore selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OakfbScore record, @Param("example") OakfbScoreExample example);

    int updateByExample(@Param("record") OakfbScore record, @Param("example") OakfbScoreExample example);

    int updateByPrimaryKeySelective(OakfbScore record);

    int updateByPrimaryKey(OakfbScore record);
}