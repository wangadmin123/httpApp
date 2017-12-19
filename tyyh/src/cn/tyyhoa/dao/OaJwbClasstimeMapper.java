package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbClasstime;
import cn.tyyhoa.pojo.OaJwbCurriculum;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;

public interface OaJwbClasstimeMapper {
	//查询班级
	public List<OaJwbGrade> selectAllgrade(String grades);
	
	//查询周期
	
	public List<OaJwbClasstime> selectTime(String classtimes);
	
	//查询机房
	public List<OaJwbMotor> selectMotor(String motor);
	
	//添加
	
	public int insert(List<OaJwbCurriculum> curriculumlist);
	
	//显示课表
	public List<OaJwbCurriculum> getCurriculum(@Param("lecturer") String lecturer,@Param("name") String name,@Param("bieTime")Date bieTime,@Param("outTime")Date outTime);
	//更新
	public int updateCurriculum(List<OaJwbCurriculum> curriculumlists);
}
