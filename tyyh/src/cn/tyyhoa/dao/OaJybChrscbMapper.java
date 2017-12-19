package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaScbRecord;

public interface OaJybChrscbMapper {
	public List<OaScbRecord> GetChrscbById(@Param("stu_id") int stu_id);
	/*查询学生咨询信息*/
	public List<OaScbRecord>  GetChrscbByTime(@Param("eventtime") Date eventtime,@Param("stu_id") int stu_id);

}
