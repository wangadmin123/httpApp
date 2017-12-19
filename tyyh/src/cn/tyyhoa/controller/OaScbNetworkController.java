package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbConsultlesson;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.pojo.OaScbConsultway;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbMedianame;
import cn.tyyhoa.pojo.OaScbRanktype;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsultlessonService;
import cn.tyyhoa.service.OaScbConsultstatusService;
import cn.tyyhoa.service.OaScbConsultwayService;
import cn.tyyhoa.service.OaScbEducationService;
import cn.tyyhoa.service.OaScbInfosourceService;
import cn.tyyhoa.service.OaScbMedianameService;
import cn.tyyhoa.service.OaScbNetworkService;
import cn.tyyhoa.service.OaScbRanktypeService;
import cn.tyyhoa.service.impl.OaScbNetworkServiceImpl;

@RequestMapping("/Network")
@Controller
public class OaScbNetworkController {
	@Autowired
	OaScbNetworkService oaScbNetworkService;
	@Autowired
	OaScbConsultlessonService oaScbConsultlessonService;
	@Autowired
	OaScbConsultstatusService oaScbConsultstatusService;
	@Autowired
	OaScbConsultwayService oaScbConsultwayService;
	@Autowired
	OaScbEducationService oaScbEducationService;
	@Autowired
	OaScbInfosourceService oaScbInfosourceService;
	@Autowired
	OaScbMedianameService oaScbMedianameService;
	@Autowired
	OaScbRanktypeService oaScbRanktypeService;	
	//加载新增页面
	@RequestMapping(value="/networkAdd",method=RequestMethod.GET)
	public String showNetWorkAdd(HttpServletRequest request) {
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();		
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService.selectMediaNameList();
		request.setAttribute("EducationList",EducationList );		
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);		
		return "marketDepartment/networkAdd";
	}
	//新增保存
	@RequestMapping(value="/networkAdda",method=RequestMethod.POST)
	public String showNetWorkAdd(OaScbConsulter oaScbConsulter,HttpSession session) {
		if(oaScbConsulter.getProvince().equals("省份")){
			oaScbConsulter.setProvince("未知");
			oaScbConsulter.setCity("未知");
			oaScbConsulter.setDistrict("未知");
		}
		if(oaScbConsulter.getCity().equals("地级市")){
			oaScbConsulter.setCity("未知");
			oaScbConsulter.setDistrict("未知");
		}
		
		if(oaScbConsulter.getDistrict().equals("市、县级市、县")){
			
			oaScbConsulter.setDistrict("未知");
		}
		if(oaScbConsulter.getAge()==null || oaScbConsulter.getAge()==0){
			oaScbConsulter.setAge(0);
		}
		
		
		oaScbConsulter.setAllotstatus(2);
		oaScbConsulter.setType(1);
		
		oaScbConsulter.setInfoStatus(1);
		oaScbConsulter.setFirstConsultTime(new Date());
		oaScbNetworkService.networkAdd(oaScbConsulter);	
		
		int id=oaScbNetworkService.maxId();
		OaScbRecord oaScbRecord=new OaScbRecord();		
		oaScbRecord.setConsulterId(id);
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		oaScbRecord.setEnterPeople(user.getEmp_name());
		oaScbRecord.setEnterTime(new Date());
		oaScbRecord.setEventName("首次咨询");
		oaScbRecord.setEventTime(new Date());
		
		
		oaScbNetworkService.insertRecord(oaScbRecord);
		return "marketDepartment/networkHandin";
	}
	//新增（提交）
	@RequestMapping(value="/networkAddaa",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object showNetWorkSubmit(OaScbConsulter oaScbConsulter,HttpSession session) {	
		if(oaScbConsulter.getProvince().equals("省份")){
			oaScbConsulter.setProvince("未知");
			oaScbConsulter.setCity("未知");
			oaScbConsulter.setDistrict("未知");
		}
		if(oaScbConsulter.getCity().equals("地级市")){
			oaScbConsulter.setCity("未知");
			oaScbConsulter.setDistrict("未知");
		}
		
		if(oaScbConsulter.getDistrict().equals("市、县级市、县")){
			
			oaScbConsulter.setDistrict("未知");
		}
		if(oaScbConsulter.getAge()==null || oaScbConsulter.getAge()==0){
			oaScbConsulter.setAge(0);
		}
		
		oaScbConsulter.setAllotstatus(2);
		oaScbConsulter.setType(1);
		oaScbConsulter.setInfoStatus(2);
		oaScbConsulter.setFirstConsultTime(new Date());
		oaScbNetworkService.networkAdd(oaScbConsulter);	
		int id=oaScbNetworkService.maxId();
		OaScbRecord oaScbRecord=new OaScbRecord();		
		oaScbRecord.setConsulterId(id);
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		oaScbRecord.setEnterPeople(user.getEmp_name());
		oaScbRecord.setEnterTime(new Date());
		oaScbRecord.setEventName("首次咨询");
		oaScbRecord.setEventTime(new Date());
		
		
		oaScbNetworkService.insertRecord(oaScbRecord);
		return "";
	}	
	//查询信息量
	@RequestMapping(value="/networkQuery",method=RequestMethod.GET)
	public String queryNetwork(HttpServletRequest request){
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService.selectMediaNameList();
		request.setAttribute("EducationList",EducationList );
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);
		return "marketDepartment/networkQuery";
	}	
	//查询信息量
	@RequestMapping(value="/networkQuery",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object categorylevellist(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String enrollTimes,String firstConsultTimes,String pageSizes) throws ParseException{
		if(index==null || index.equals("")){
			index="1";
		}
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}		
		int pageSize=Integer.parseInt(pageSizes);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date enrollTimesDate=null;
		Date firstConsultTimesDate=null;		
		if(enrollTimes!=null && !enrollTimes.equals("")){
			enrollTimesDate=sdf.parse(enrollTimes);  //报名日期
		}
		oaScbConsulter.setEnrollTime(enrollTimesDate);		
		if(firstConsultTimes!=null && !firstConsultTimes.equals("")){
			firstConsultTimesDate=sdf.parse(firstConsultTimes);  //首次咨询日期
		}
		oaScbConsulter.setFirstConsultTime(firstConsultTimesDate);		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("consulter", oaScbConsulter);
		int totalCount=oaScbNetworkService.getNetworkcount(oaScbConsulter);		
		int pageCount= totalCount % pageSize==0? totalCount/pageSize: totalCount/pageSize+1;
		map.put("index", (Integer.parseInt(index)-1)*pageSize);
		map.put("pageSize", pageSize);
		List<OaScbConsulter> checkList = oaScbNetworkService.NetworkQuery(map);
		map.put("checkList", checkList);
		map.put("index", (Integer.parseInt(index)));
		map.put("pageCount", pageCount);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);		
		return JSONArray.toJSONString(map);	
	}
	//查询学生详情
	@RequestMapping(value="/networklookcon")
	@ResponseBody
	  public Object categorylevel(@RequestParam String id){		
		OaScbConsulter oaScbConsulter = oaScbNetworkService.selectOne(Integer.parseInt(id));	
		return JSONArray.toJSONString(oaScbConsulter);
	}	
	//查询基本信息
	@RequestMapping(value="/networkHand",method=RequestMethod.GET)
	public String handIn(){		
		return "marketDepartment/networkHandin";
	}	
	//查询基本信息
	@RequestMapping(value="/networkHandin",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object selectInfo(@RequestParam(required=false) String name,@RequestParam(required=false) String index,@RequestParam(required=false) String sex,String pageSizes) {
		if(index==null || index.equals("")){
			index="1";
		}
		if(sex == null || sex.equals("")){
			
			sex="0";
		}
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}		
		int pageSize=Integer.parseInt(pageSizes);
		Map<String, Object> map = new HashMap<String, Object>();
		OaScbConsulter oaScbConsulter = new OaScbConsulter();
		oaScbConsulter.setName(name);
		oaScbConsulter.setSex(Integer.parseInt(sex));
		map.put("oaScbConsulter", oaScbConsulter);
		int totalCount=oaScbNetworkService.selectInfoCount(oaScbConsulter);
		int pageCount= totalCount % pageSize==0? totalCount/pageSize: totalCount/pageSize+1;
		map.put("index", (Integer.parseInt(index)-1)*pageSize);
		map.put("pageSize", pageSize);		
		List<OaScbConsulter> checkList =oaScbNetworkService.selectstudentInfo(map);
		map.put("checkList", checkList);
		map.put("index", (Integer.parseInt(index)));
		map.put("pageCount", pageCount);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		return JSONArray.toJSONString(map);
	}
	//提交
	@RequestMapping(value="/handOnInfo",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object handOnInfo(@RequestParam String id){		
		oaScbNetworkService.editConInfoStatus(Integer.parseInt(id));
		return "提交成功";
	}
	//提交量
	@RequestMapping(value="/handall",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object handOnInfo(@RequestParam String[] s){		
		int[] id = new int[s.length];
		
		for (int i = 0; i < s.length; i++) {
			id[i] = Integer.parseInt(s[i]);
		}
		oaScbNetworkService.handallInfo(id);		
		return "提交成功";
	}
	//跟踪
	@RequestMapping(value="/OaScbVisitFollowing",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object NetworkVisitFind(String consultId){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<OaScbVisit> OaScbVisit=oaScbNetworkService.networkVisitFind(Integer.parseInt(consultId));
		OaScbConsulter OaScbConsulter=new OaScbConsulter();
		OaScbConsulter.setId(Integer.parseInt(consultId));		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("consulter", OaScbConsulter);
		List<OaScbConsulter> OaScbConsulterInfoList=oaScbNetworkService.NetworkQueryfollwing(map);		
		String consultTeacherName=null;
		if(OaScbConsulterInfoList.size()==1){
			for (OaScbConsulter oaScbConsulter2 : OaScbConsulterInfoList) {
				consultTeacherName=oaScbConsulter2.getConsultTeacherName();
			}
		}else{
			consultTeacherName="查询错误";
		    }		
		for (OaScbVisit oaScbVisit2 : OaScbVisit) {
			oaScbVisit2.setConsultTeacherName(consultTeacherName);/*当前负责咨询师*/
			if(oaScbVisit2.getReturnvisitTime()!=null){/*本次回访时间*/
				oaScbVisit2.setReturnvisitTimes(sdf.format(oaScbVisit2.getReturnvisitTime()));
			}else{
				oaScbVisit2.setReturnvisitTimes("暂无");
			}
			if(oaScbVisit2.getNextvisitTime()!=null){/*下次回访时间*/
				oaScbVisit2.setNextvisitTimes(sdf.format(oaScbVisit2.getNextvisitTime()));
			}else{
				oaScbVisit2.setNextvisitTimes("暂无");
			}
			if(oaScbVisit2.getConsultName()==null||oaScbVisit2.getConsultName().equals("")){/*咨询量姓名*/
				oaScbVisit2.setConsultName("未获得");
			}
			if(oaScbVisit2.getReturnvisitPeopleName()==null||oaScbVisit2.getReturnvisitPeopleName().equals("")){/*回访人*/
				oaScbVisit2.setReturnvisitPeopleName("暂无");
			}
			if(oaScbVisit2.getReturnvisitRecord()==null||oaScbVisit2.getReturnvisitRecord().equals("")){
				
				oaScbVisit2.setReturnvisitRecord("无回访记录");
			}			
		}		
		return JSONArray.toJSONString(OaScbVisit);		
	}	
}
