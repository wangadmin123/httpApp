package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbInterview;
import cn.tyyhoa.pojo.OaJzbPatriarchInterview;

public interface OaJzbPatriarchInterviewMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaJzbPatriarchInterview record);

    int insertSelective(OaJzbPatriarchInterview record);

    OaJzbPatriarchInterview selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaJzbPatriarchInterview record);

    int updateByPrimaryKey(OaJzbPatriarchInterview record);
    
    List<OaJzbPatriarchInterview> getJZFTSById(@Param("stu_id")int stu_id);
    
    List<OaJzbInterview> getInterview();
    
    int addJZFT(@Param("Interview_name")String Interview_name,@Param("Interview_id")int Interview_id,@Param("term")int term,
    		@Param("Interview_time")Date Interview_time,@Param("Entering_time")Date Entering_time,@Param("Interview_way")int Interview_way,
    		@Param("Interview_content")String Interview_content,@Param("remarks")String remarks,@Param("deleteStatus")int deleteStatus
    		,@Param("stu_id")int stu_id);
    OaJzbPatriarchInterview getJZFTByID(@Param("id")int id);
    
    int UpdateJZFT(@Param("Interview_name")String Interview_name,
    		@Param("Interview_way")int Interview_way,@Param("Interview_content")String Interview_content,
    		@Param("id")int id);

    int deleteJZFT(@Param("id")int id);
    
    OaJwbSemester getsemesterById(@Param("stu_Id")int stu_Id);
}