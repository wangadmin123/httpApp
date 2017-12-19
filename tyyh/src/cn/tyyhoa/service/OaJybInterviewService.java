package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;





import cn.tyyhoa.pojo.OaJybInterview;
import cn.tyyhoa.pojo.OaJybInterviewScore;

public interface OaJybInterviewService {
	public List<OaJybInterviewScore>   GetAllIntervie( String studentname,
    		String gradename,int index, int pageSize,int position_id, int emp_id);
	
	public int   GetAllCounts( String studentname,
    		String gradename,int index,int pageSize,int position_id, int emp_id);

	public  int updateByPrimaryKeySelective(OaJybInterviewScore record);
	public  int insertByPrimaryKeySelective(OaJybInterviewScore record);
	
	public OaJybInterviewScore GetStudentInterview(int stuid);
	
	 public List<OaJybInterviewScore> GetBanjiInterview(int gradeid);
	 
	 public int insertId( int interview_score_studentId);
	 
	 public  List<OaJybInterviewScore> getstudentid( int id);
	
}
