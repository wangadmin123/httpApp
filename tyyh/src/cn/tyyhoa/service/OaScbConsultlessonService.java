package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;



import cn.tyyhoa.pojo.OaScbConsultlesson;

public interface OaScbConsultlessonService {
	public List<OaScbConsultlesson> selectConsultLessonList();
	
	public int checkUnuseLesson(int[] id);
	
	public int addLesson(OaScbConsultlesson oaScbConsultlesson);
	
	public int editLessonName(OaScbConsultlesson oaScbConsultlesson);
	
	public List<OaScbConsultlesson> selectConsultUnLessonList();
	
	public int moveUnuseLesson(int[] id);
}
