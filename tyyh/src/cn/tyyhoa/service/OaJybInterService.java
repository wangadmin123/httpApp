package cn.tyyhoa.service;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybInterview;

public interface OaJybInterService {
	  public int updateByPrimaryKeySelective(OaJybInterview record);
	  public int insertByPrimaryKeySelective(OaJybInterview record);
	  
	  public int insertId( int mianshibiao_id);
}
