package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaScbConsultlesson;

public interface OaScbConsultlessonMapper {
    public List<OaScbConsultlesson> selectConsultLessonList();
    
    public int checkUnuseLesson(@Param("id") int[] id);
    
    public int addLesson(OaScbConsultlesson oaScbConsultlesson);
    
    public int editLessonName(OaScbConsultlesson oaScbConsultlesson);
    
    public List<OaScbConsultlesson> selectConsultUnLessonList();
    
    public int moveUnuseLesson(@Param("id") int[] id);
}