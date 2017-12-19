package cn.tyyhoa.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;

public interface OaScbConsulterService {
	//主管新增咨询量
	public boolean addConsulter(OaScbConsulter oaScbConsulter);
	//主管查询咨询量列表
	public List<OaScbConsulter> queryConsulters(Map<String,Object> map);
	//主管查询咨询量记录数
	public int selectconsultercount(Map<String,Object> map );
	//主管无效量列表
	public List<OaScbConsulter> selectCheck(Map<String,Object> map);
	//主管无效量记录数
	public int selectCheckCount(int consultTeacher);
	//主管审核无效量
	public boolean checkconsulter(int invalid,int id);
	//主管回收咨询量
	public boolean retrieveconsulter(int id);
    
    public OaScbConsulter lookConInfo(Integer id);
    //主管分发咨询量列表
    public List<OaScbConsulter> selectHandoutConsulter(Map<String,Object> map);
    //主管分发咨询量列表记录数
    public int selectHandoutConsulterCount(Map<String, Object> map);
    //主管分发咨询量
    public int handoutCon(int consultTeacher,int id);
    //查看无效原因
    public OaScbConsulter selectResult(Integer id);
    
    public int checkSome(int[] id);
    
    public int checkinvalid(int[] id);
    
    public int handoutall(Map<String, Object> map);
    
    public OaScbConsulter DirectorReviseFind(int id);
    
    public int displayNone(int id);
    
    public List<OaScbVisit> DirectorOaScbVisitFind(int consultId);
    
    //无效量
    public List<OaScbConsulter> selectUseless(Map<String, Comparable> map);
    //无效量记录数
    public int selectUselessCount(Map<String, Comparable> map);
    //导入
    public boolean daoruCon(OaScbConsulter oaScbConsulter);
    
    //记事
  	public int insertRecord(OaScbRecord oaScbRecord);
  	//最大id
  	public int maxId();
  	//查询历史量
  	public List<OaScbConsulter> selectHistoryCon(Map<String, Integer> map); 
  	
  	public int selectHistoryCount();
  	
    //-------------------------------------------------------------
    
    public Integer selectTeacherIdByName(String name);

    public Integer selectWayIdByName(String name);
    
    public Integer selectLessonIdByName(String name);
    
    public Integer selectRankIdByName(String name);
    
    public Integer selectEducationIdByName(String name);
    
    public Integer selectStatusIdByName(String name);
    
    //查询学生来源
    public OaScbConsulter ConsultDirectorCome(@Param("Name")String Name);
    //查询重复量
    public List<OaScbConsulter> chongfu(@Param("pagecount")Integer pagecount,@Param("pagesize")Integer pagesize);
    public List<OaScbConsulter>chongfuTotacount();
    //查询重复的人
    public List<OaScbConsulter> selectCF(@Param("name") String name,@Param("pagecount")Integer pagecount,@Param("pagesize")Integer pagesize);
    public Integer CFtotacount(@Param("name") String name);
    public Integer updexsist(@Param("id") Integer id,@Param("reg") String reg);
    public Integer delete(@Param("id") Integer id);
}
