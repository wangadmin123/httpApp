package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybInterviewScore;

public interface OaJybInterviewScoreMapper {
    int deleteByPrimaryKey(Integer interview_score_id);

    int insert(OaJybInterviewScore record);

    int insertSelective(OaJybInterviewScore record);

    OaJybInterviewScore selectByPrimaryKey(Integer interview_score_id);

   public  int updateByPrimaryKeySelective(OaJybInterviewScore record);
	public  int insertByPrimaryKeySelective(OaJybInterviewScore record);

    int updateByPrimaryKey(OaJybInterviewScore record);
    
    public List<OaJybInterviewScore>   GetAllIntervie(@Param("studentname") String studentname,
    		@Param("gradename")String gradename,@Param("index")int index, @Param("pageSize")int pageSize
    		,@Param("position_id") int position_id,@Param("emp_id") int emp_id);
     
    public int   GetAllCounts(@Param("studentname") String studentname,
    		@Param("gradename")String gradename,@Param("index")int index, @Param("pageSize")int pageSize,
    		@Param("position_id") int position_id,@Param("emp_id") int emp_id
    		);
    

    public OaJybInterviewScore GetStudentInterview(@Param("stuid") int stuid);
    
    
    public List<OaJybInterviewScore> GetBanjiInterview(@Param("gradeid") int gradeid
    		);


    public List<OaJybInterviewScore>   GetXinIntervie(@Param("studentname") String studentname,
    		@Param("gradename")String gradename,@Param("index")int index, @Param("pageSize")int pageSize);


    public int insertId(@Param("interview_score_studentId") int interview_score_studentId);
    
    public  List<OaJybInterviewScore> getstudentid(@Param("id") int id);

}

















