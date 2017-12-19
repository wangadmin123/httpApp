package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbOpenClass;
import cn.tyyhoa.pojo.OaScbEducation;

public interface OaJzbOpenClassService {


	//根据条件查询列表
	public List<OaJzbOpenClass> findNameSelect(String name,int gradeId,int currentPage,int pageSize);
	//根据条件查询总条数
	public int findNameSelectCount(String name,int gradeId);
	//新增
	public boolean getAddOpenClass(OaJzbOpenClass openclass);
	//修改跳转页面
	public OaJzbOpenClass findOpenClass(int id);
	//修改
	public boolean updataOpenclass(OaJzbOpenClass openclass);
	//删除
	public int deleOpenClass(int id);
	//查询学历
	public List<OaScbEducation> findShowEducation();
}
