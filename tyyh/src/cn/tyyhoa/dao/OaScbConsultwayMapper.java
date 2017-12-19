package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaScbConsultway;

public interface OaScbConsultwayMapper {
	public List<OaScbConsultway> selectConsultWay();
	
	public int addconsultway(OaScbConsultway oaScbConsultway);
	
	public int checkUnuseWay(@Param("id") int[] id);
	
	public int editWayName(OaScbConsultway oaScbConsultway);
	
	public int moveUnuseWay(@Param("id") int[] id);
	
	public List<OaScbConsultway> selectConsultUnWay();
}