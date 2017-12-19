package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import cn.tyyhoa.pojo.OaJwbClasstime;
import cn.tyyhoa.pojo.OaJwbCurriculum;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;

public interface OaJwbClasstimeService {
			//查询班级
			public List<OaJwbGrade> selectAllgrade(String grades);
			//查询机房
			public List<OaJwbMotor> selectMotor(String motor);
			//查询周期
			public List<OaJwbClasstime> selectTime(String classtimes);
			//添加
			public boolean  insert(List<OaJwbCurriculum> curriculumlist);
			//显示
			public List<OaJwbCurriculum> getCurriculum(String lecturer,String name,Date bieTime,Date outTime);
			//更新数据
			public  boolean updateCurriculum(List<OaJwbCurriculum> curriculumlists);
}
