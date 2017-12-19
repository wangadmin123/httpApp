package cn.tyyhoa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbQuestionMapper;
import cn.tyyhoa.service.OaJzbQuestionService;
@Service("OaJzbQuestionService")
public class OaJzbQuestionServiceImpl implements OaJzbQuestionService {
	@Autowired
	OaJzbQuestionMapper oaJzbQuestionMapper;
	@Override
	public int addQuestion(String question) {
		// TODO Auto-generated method stub
		return oaJzbQuestionMapper.addQuestion(question);
	}

}
