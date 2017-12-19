package cn.tyyhoa.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tyyhoa.dao.OaScbConsulterMapper;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsulterService;
@Service("oaScbConsulterService")
public class OaScbConsulterServiceImpl implements OaScbConsulterService {

	@Autowired
	OaScbConsulterMapper oaScbConsulterMapper;
	
	@Override
	public boolean addConsulter(OaScbConsulter oaScbConsulter) {
			int row = oaScbConsulterMapper.addConsulter(oaScbConsulter);
			if(row==1){
				return true;
			}else{
				return false;
			}
	}

	@Override
	public List<OaScbConsulter> queryConsulters(Map<String,Object> map) {
		return oaScbConsulterMapper.ConsultDirectorQuery(map);
	}

	

	@Override
	public int selectconsultercount(Map<String,Object> map) {
		
		return oaScbConsulterMapper.selectconsultercount(map);
	}

	@Override
	public List<OaScbConsulter> selectCheck(Map<String,Object> map) {
		
		return oaScbConsulterMapper.selectCheck(map);
	}
	
	@Override
	public int selectCheckCount(int consultTeacher) {
		
		return oaScbConsulterMapper.selectCheckCount(consultTeacher);
	}

	@Override
	public boolean checkconsulter(int invalid,int id) {
		int row = oaScbConsulterMapper.checkconsulter(invalid,id);
		if(row==1){
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public boolean retrieveconsulter(int id) {
		int row = oaScbConsulterMapper.retrieveconsulter(id);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public OaScbConsulter lookConInfo(Integer id) {
		
		return oaScbConsulterMapper.lookConInfo(id);
	}

	

	@Override
	public List<OaScbConsulter> selectHandoutConsulter(Map<String,Object> map) {

		return oaScbConsulterMapper.selectHandoutConsulter(map);
	}

	@Override
	public int selectHandoutConsulterCount(Map<String, Object> map) {
		
		return oaScbConsulterMapper.selectHandoutConsulterCount(map);
	}

	@Override
	public int handoutCon(int consultTeacher, int id) {

		return oaScbConsulterMapper.handoutCon(consultTeacher, id);
	}

	@Override
	public OaScbConsulter selectResult(Integer id) {

		return oaScbConsulterMapper.selectResult(id);
	}

	@Override
	public int checkSome(int[] id) {
		
		return oaScbConsulterMapper.checkSome(id);
	}

	@Override
	public int checkinvalid(int[] id) {
		
		return oaScbConsulterMapper.checkinvalid(id);
	}

	@Override
	public int handoutall(Map<String, Object> map) {
		
		return oaScbConsulterMapper.handoutall(map);
	}

	@Override
	public OaScbConsulter DirectorReviseFind(int id) {
		
		return oaScbConsulterMapper.DirectorReviseFind(id);
	}

	@Override
	public int displayNone(int id) {
		
		return oaScbConsulterMapper.displayNone(id);
	}

	@Override
	public List<OaScbVisit> DirectorOaScbVisitFind(int consultId) {
		
		return oaScbConsulterMapper.DirectorOaScbVisitFind(consultId);
	}

	@Override
	public List<OaScbConsulter> selectUseless(Map<String, Comparable> map) {
		
		return oaScbConsulterMapper.selectUseless(map);
	}

	@Override
	public int selectUselessCount(Map<String, Comparable> map) {
		return oaScbConsulterMapper.selectUselessCount(map);
	}

	@Override
	public boolean daoruCon(OaScbConsulter oaScbConsulter) {
		
		int row  =  oaScbConsulterMapper.daoruCon(oaScbConsulter);
		if(row ==1){
			return true;
		}else{
			return false;
		}
	}
	
	/*@Override
	public List<Map<String, Object>> readExcelFile(MultipartFile file) {
		ReadExcelDemo readExcelDemo=new ReadExcelDemo();
		List<Map<String, Object>> list=new ArrayList<>();
		try {
			list = readExcelDemo.getExcel(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}*/
	
	
	

	

	//-----------------------------------------------------------------------
	
	@Override
	public Integer selectTeacherIdByName(String name) {
		
		return oaScbConsulterMapper.selectTeacherIdByName(name);
	}

	@Override
	public Integer selectWayIdByName(String name) {
		
		return oaScbConsulterMapper.selectWayIdByName(name);
	}

	@Override
	public Integer selectLessonIdByName(String name) {
		
		return oaScbConsulterMapper.selectLessonIdByName(name);
	}

	@Override
	public Integer selectRankIdByName(String name) {
		
		return oaScbConsulterMapper.selectRankIdByName(name);
	}

	@Override
	public Integer selectEducationIdByName(String name) {
		
		return oaScbConsulterMapper.selectEducationIdByName(name);
	}

	@Override
	public Integer selectStatusIdByName(String name) {
		
		return oaScbConsulterMapper.selectStatusIdByName(name);
	}

	@Override
	public int insertRecord(OaScbRecord oaScbRecord) {
		
		return oaScbConsulterMapper.insertRecord(oaScbRecord);
	}

	@Override
	public int maxId() {
		
		return oaScbConsulterMapper.maxId();
	}

	@Override
	public List<OaScbConsulter> selectHistoryCon(Map<String, Integer> map) {
		
		return oaScbConsulterMapper.selectHistoryCon(map);
	}

	@Override
	public int selectHistoryCount() {
		
		return oaScbConsulterMapper.selectHistoryCount();
	}

	@Override
	public OaScbConsulter ConsultDirectorCome(String Name) {

		return oaScbConsulterMapper.ConsultDirectorCome(Name);
	}

	@Override
	public List<OaScbConsulter> chongfu(Integer pagecount, Integer pagesize) {

		return oaScbConsulterMapper.chongfu(pagecount, pagesize);
	}

	@Override
	public List<OaScbConsulter> chongfuTotacount() {

		return oaScbConsulterMapper.chongfuTotacount();
	}

	@Override
	public List<OaScbConsulter> selectCF(String name, Integer pagecount, Integer pagesize) {
		// TODO Auto-generated method stub
		return oaScbConsulterMapper.selectCF(name, pagecount, pagesize);
	}

	@Override
	public Integer CFtotacount(String name) {
		// TODO Auto-generated method stub
		return oaScbConsulterMapper.CFtotacount(name);
	}

	@Override
	public Integer updexsist(Integer id, String reg) {
		// TODO Auto-generated method stub
		return oaScbConsulterMapper.updexsist(id, reg);
	}

	@Override
	public Integer delete(Integer id) {
		// TODO Auto-generated method stub
		return oaScbConsulterMapper.delete(id);
	}





	
	
}
