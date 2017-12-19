package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaKfbProject;
import cn.tyyhoa.pojo.OaKfbProjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OaKfbProjectMapper {
	
	 /**
     * 根据用户id查询任务列表
     * @Param("pageCount") int pageCount,@Param("index")int index,
     * @param id
     * @return
     */
   public  List<OaKfbProject> selectByStuId(@Param("user_id") Integer user_id);
	
	
	/**
	 * 根据任务id查询任务信息
	 * @param id
	 * @return
	 */
   public OaKfbProject selectByPId(@Param("id") Integer id);
	
	
   /**
    * 组员提交任务信息
    * @param Project
    * @return
    */
   public int tjrenwu(OaKfbProject Project);
   
   //组长删除任务
   public int delbyid(@Param("id") Integer id);
   
	
	
    //组长查看全部任务
    public List<OaKfbProject> selectByExample(OaKfbProject Project);
    

    //组长发布任务
    public int addrenwu(OaKfbProject Project);
    
    
    //组长修改进度之前的信息
    public List<OaKfbProject> selecteditrenwu(@Param("id") Integer id);
    
    
    
    //组长修改进度信息
    
    public int editrenwu(OaKfbProject Project);
    
    
    //主管查询进度
    public List<OaKfbProject> selectBygroup();
    
    
    //查看对应的进度信息
    public List<OaKfbProject> selectBystageid(@Param("groupid") Integer groupid,@Param("eid") Integer eid);
   
    //主管查询历史进度
    public List<OaKfbProject> selectBygrouphistory();
	
	
	
	
	
	
	
	
	
	
	
    long countByExample(OaKfbProjectExample example);

    int deleteByExample(OaKfbProjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OaKfbProject record);

    int insertSelective(OaKfbProject record);

    List<OaKfbProject> selectByExampleWithBLOBs(OaKfbProjectExample example);

    List<OaKfbProject> selectByExample(OaKfbProjectExample example);

    OaKfbProject selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OaKfbProject record, @Param("example") OaKfbProjectExample example);

    int updateByExampleWithBLOBs(@Param("record") OaKfbProject record, @Param("example") OaKfbProjectExample example);

    int updateByExample(@Param("record") OaKfbProject record, @Param("example") OaKfbProjectExample example);

    int updateByPrimaryKeySelective(OaKfbProject record);

    int updateByPrimaryKeyWithBLOBs(OaKfbProject record);

    int updateByPrimaryKey(OaKfbProject record);

	
}