package cn.tyyhoa.dao;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;

public interface OaScbConsulterMapper {
	//主管新增咨询量
    public int addConsulter(OaScbConsulter oaScbConsulter);
    //主管查询咨询量
    public List<OaScbConsulter> ConsultDirectorQuery(Map<String, Object> map);
    //咨询量记录数
    public int selectconsultercount(Map<String, Object> map);
    //主管审核无效量列表
    public List<OaScbConsulter> selectCheck(Map<String, Object> map);
    //无效量记录数
    public int selectCheckCount(@Param("consultTeacher") int consultTeacher);
    //审核无效量
    public int checkconsulter(@Param("invalid")int invalid ,@Param("id") int id);
    //回收咨询量
    public int retrieveconsulter(@Param("id") int id);
    //查看咨询量
    public OaScbConsulter lookConInfo(@Param("id") Integer id);
    //查看分发咨询量
    public List<OaScbConsulter> selectHandoutConsulter(Map<String, Object> map);
    //查看待分发量记录数
    public int selectHandoutConsulterCount(Map<String, Object> map);
    //分发咨询量
    public int handoutCon(@Param("consultTeacher") int consultTeacher,@Param("id") int id);
    //查看无效原因
    public OaScbConsulter selectResult(@Param("id") Integer id);
    //批量继续跟进无效量
    public int checkSome(int[] id);
    //批量标记无效量
    public int checkinvalid(int[] id);
    //批量分发咨询量
    public int handoutall(Map<String, Object> map);
    //编辑咨询量
    public OaScbConsulter DirectorReviseFind(@Param("id") int id);
    //删除咨询量
    public int displayNone(@Param("id") int id);
    //跟踪咨询量
    public List<OaScbVisit> DirectorOaScbVisitFind(@Param("consultId") int consultId);
    //无效量
    public List<OaScbConsulter> selectUseless(Map<String, Comparable> map);
    //无效量记录数
    public int selectUselessCount(Map<String, Comparable> map);
    //导入咨询量
    public int daoruCon(OaScbConsulter oaScbConsulter);
    
    //记事
  	public int insertRecord(OaScbRecord oaScbRecord);
  	//最大id
  	public int maxId();
  	//历史量
  	public List<OaScbConsulter> selectHistoryCon(Map<String, Integer> map); 
  	
  	public int selectHistoryCount();
    
    //--------------------------------------------------------------------------------
    
    public Integer selectTeacherIdByName(@Param("name") String name);
    
    public Integer selectWayIdByName(@Param("name") String name);
    
    public Integer selectLessonIdByName(@Param("name") String name);
    
    public Integer selectRankIdByName(@Param("name") String name);
    
    public Integer selectEducationIdByName(@Param("name") String name);
    
    public Integer selectStatusIdByName(@Param("name") String name);
    
    //查询学生来源
    public OaScbConsulter ConsultDirectorCome(@Param("Name")String Name);
    //查询重复量
    public List<OaScbConsulter> chongfu(@Param("pagecount")Integer pagecount,@Param("pagesize")Integer pagesize);
    public List<OaScbConsulter> chongfuTotacount ();
    //查询重复的人
    public List<OaScbConsulter> selectCF(@Param("name") String name,@Param("pagecount")Integer pagecount,@Param("pagesize")Integer pagesize);
    public Integer CFtotacount(@Param("name") String name);
    public Integer updexsist(@Param("id") Integer id,@Param("reg") String reg);
    public Integer delete(@Param("id") Integer id);
}