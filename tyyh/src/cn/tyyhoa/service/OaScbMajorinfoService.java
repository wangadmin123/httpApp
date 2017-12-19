package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaScbMajorinfo;

public interface OaScbMajorinfoService {
	public List<OaScbMajorinfo> selectMajorinfoList(int schoolId);
	
	public int findSchoolid(int id);
}
