package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbConsultlessonMapper;
import cn.tyyhoa.pojo.OaScbConsultlesson;
import cn.tyyhoa.service.OaScbConsultlessonService;
@Service("oaScbConsultlessonService")
public class OaScbConsultlessonServiceImpl implements OaScbConsultlessonService {
	@Autowired
	OaScbConsultlessonMapper oaScbConsultlessonMapper;
	@Override
	public List<OaScbConsultlesson> selectConsultLessonList() {
		
		return oaScbConsultlessonMapper.selectConsultLessonList();
	}
	@Override
	public int checkUnuseLesson(int[] id) {
		return oaScbConsultlessonMapper.checkUnuseLesson(id);
	}
	@Override
	public int addLesson(OaScbConsultlesson oaScbConsultlesson) {
		
		return oaScbConsultlessonMapper.addLesson(oaScbConsultlesson);
	}
	@Override
	public int editLessonName(OaScbConsultlesson oaScbConsultlesson) {
		
		return oaScbConsultlessonMapper.editLessonName(oaScbConsultlesson);
	}
	@Override
	public List<OaScbConsultlesson> selectConsultUnLessonList() {
		
		return oaScbConsultlessonMapper.selectConsultUnLessonList();
	}
	@Override
	public int moveUnuseLesson(int[] id) {
		
		return oaScbConsultlessonMapper.moveUnuseLesson(id);
	}

}

