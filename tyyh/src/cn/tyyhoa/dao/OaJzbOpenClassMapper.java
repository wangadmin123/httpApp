package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbOpenClass;
import cn.tyyhoa.pojo.OaScbEducation;

public interface OaJzbOpenClassMapper {
	
	//根据条件查询
	public List<OaJzbOpenClass> getNameSelect(@Param("name")String name,@Param("gradeId")int gradeId,
						@Param("currentPage")int currentPage,@Param("pageSize")int pageSize);
	//根据条件查询总条数
	public int getNameSelectCount(@Param("name")String name,@Param("gradeId")int gradeId);
	//添加
	public int addOpenClass(OaJzbOpenClass openclass);
	//修改页面跳转
	public OaJzbOpenClass selOpenClass(@Param("id")int id);
	//修改页面数据
	public int editOpenClass(OaJzbOpenClass openclass);
	//删除
	public int delOpenClass(@Param("id")int id);
	//查询学历
	public List<OaScbEducation> showEducation();
}