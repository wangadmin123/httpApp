package cn.tyyhoa.controller;




import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbConsultlesson;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.pojo.OaScbConsultway;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbMajorinfo;
import cn.tyyhoa.pojo.OaScbMajorpersoninfo;
import cn.tyyhoa.pojo.OaScbMajorteacherinfo;
import cn.tyyhoa.pojo.OaScbMedianame;
import cn.tyyhoa.pojo.OaScbPaystatus;
import cn.tyyhoa.pojo.OaScbPaytype;
import cn.tyyhoa.pojo.OaScbRanktype;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbSchoolinfo;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsultTeacherService;
import cn.tyyhoa.service.OaScbConsulterService;
import cn.tyyhoa.service.OaScbConsultlessonService;
import cn.tyyhoa.service.OaScbConsultstatusService;
import cn.tyyhoa.service.OaScbConsultwayService;
import cn.tyyhoa.service.OaScbEducationService;
import cn.tyyhoa.service.OaScbInfosourceService;
import cn.tyyhoa.service.OaScbMajorinfoService;
import cn.tyyhoa.service.OaScbMarketService;
import cn.tyyhoa.service.OaScbMedianameService;
import cn.tyyhoa.service.OaScbRanktypeService;



@RequestMapping("/market")
@Controller
public class OaScbMarketController {
	@Autowired 
	OaScbMarketService oaScbMarketService;
	@Autowired 
	OaScbInfosourceService oaScbInfosourceService;
	@Autowired 
	OaScbEducationService oaScbEducationService;
	@Autowired 
	OaScbMajorinfoService oaScbMajorinfoService;
	@Autowired
	OaScbConsultwayService oaScbConsultwayService;
	@Autowired
	OaScbRanktypeService oaScbRanktypeService;
	@Autowired
	OaScbConsultstatusService oaScbConsultstatusService;
	@Autowired
	OaScbConsultlessonService oaScbConsultlessonService;
	@Autowired
	OaScbMedianameService oaScbMedianameService;
	@Autowired
	OaScbConsultTeacherService oaScbConsultTeacherService;
	@Autowired
	OaScbMarketService OaScbMarketService;
	
	
	
	//新增加载页面
	@RequestMapping(value="/amarketAdd",method=RequestMethod.GET)
	public String marketadd(HttpServletRequest request){
		System.out.println("新增页面");
		List <OaScbEducation>Educationlist = oaScbEducationService.selectEducationList();
	 	List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService.selectMediaNameList();
		List<OaRlzybEmployee> employees=OaScbMarketService.getEmployee();
		request.setAttribute("EducationList", Educationlist);
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);
		request.setAttribute("employeesList", employees);
		
		return "marketDepartment/marketAdd";
	}
	//新增提交
	@RequestMapping(value="marketAdd",method=RequestMethod.POST)
	public String marketadd(OaScbConsulter oaScbConsulter,HttpSession session){
		if(oaScbConsulter.getProvince().equals("省份")){
			oaScbConsulter.setProvince("未知");
			oaScbConsulter.setCity("未知");
			oaScbConsulter.setDistrict("未知");
		}
		if(oaScbConsulter.getCity().equals("地级市")){
			oaScbConsulter.setCity("未知");
			oaScbConsulter.setDistrict("未知");
		}
		
	/*	if(oaScbConsulter.getDistrict().equals("市、县级市、县")){
			
			oaScbConsulter.setDistrict("未知");
		}
		*/
		
		if(oaScbConsulter.getStatus()==0){
			oaScbConsulter.setStatusName("未知");
		}
		if(oaScbConsulter.getConsultLesson()==0){
			oaScbConsulter.setConsultLessonName("未知");
		}
		if(oaScbConsulter.getEducation()==0){
			oaScbConsulter.setEducationName("未知");
		}
		oaScbConsulter.setAllotstatus(2);
		oaScbConsulter.setType(2);
		oaScbConsulter.setInfoStatus(2);
		oaScbConsulter.setFirstConsultTime(new Date());
		oaScbMarketService.addmarket(oaScbConsulter);
		int id=oaScbMarketService.maxId();
		OaScbRecord oaScbRecord=new OaScbRecord();		
		oaScbRecord.setConsulterId(id);
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		oaScbRecord.setEnterPeople(user.getEmp_name());
		oaScbRecord.setEnterTime(new Date());
		oaScbRecord.setEventName("首次咨询");
		oaScbRecord.setEventTime(new Date());
		
		
		oaScbMarketService.insertRecord(oaScbRecord);
			return "marketDepartment/marketQuery";
		
		
	}
	//新增保存
		@RequestMapping(value="marketAdd2",produces="application/json;charset=utf-8")
		@ResponseBody
	public Object marketadd2(OaScbConsulter oaScbConsulter,HttpSession session){
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
			
			
			if(oaScbConsulter.getStatus()==0){
				oaScbConsulter.setStatusName("未知");
			}
			if(oaScbConsulter.getConsultLesson()==0){
				oaScbConsulter.setConsultLessonName("未知");
			}
			if(oaScbConsulter.getEducation()==0){
				oaScbConsulter.setEducationName("未知");
			}
			
			oaScbConsulter.setAllotstatus(2);
			oaScbConsulter.setType(2);
			oaScbConsulter.setInfoStatus(1);
			oaScbConsulter.setFirstConsultTime(new Date());
			oaScbMarketService.addmarket(oaScbConsulter);
			
			int id=oaScbMarketService.maxId();
			OaScbRecord oaScbRecord=new OaScbRecord();		
			oaScbRecord.setConsulterId(id);
			OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
			oaScbRecord.setEnterPeople(user.getEmp_name());
			oaScbRecord.setEnterTime(new Date());
			oaScbRecord.setEventName("首次咨询");
			oaScbRecord.setEventTime(new Date());
			
			
			oaScbMarketService.insertRecord(oaScbRecord);
			
			
			return "成功";
			
			
		}
	
		
		@RequestMapping(value="/getBySchoolName",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object getBySchool(String schoolName,String index,String number){
			if(index==null || index.equals("")){
				index="1";
			}
			if(number==null||number.equals("")){
				number="10";
			}
			int count=oaScbMarketService.getschoolcount(schoolName);
			int pageSize=Integer.parseInt(number);
			int pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
			List<OaScbConsulter> marketlist=oaScbMarketService.getBySchoolName(schoolName, (Integer.parseInt(index)-1)*pageSize, pageSize);
			Map<String , Object>maps=new HashMap<String , Object>();
			maps.put("marketlist", marketlist);
			maps.put("index", (Integer.parseInt(index)));
			maps.put("pageCount", pageCount);
			maps.put("count", count);
			maps.put("pageSize", pageSize);
			
			return JSONArray.toJSONString(maps);
		}
		//查询信息量
		@RequestMapping(value="/marketQuery",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object marketQuery(OaScbConsulter oaScbConsulter,
				@RequestParam(required=false) String index,String pageSizes){
			
			if(index==null || index.equals("")){
				index="1";
			}
			if(pageSizes==null||pageSizes.equals("")){
				pageSizes="10";
			}
			int pageSize=Integer.parseInt(pageSizes);
			Map<String , Object>map=new HashMap<String , Object>();
			map.put("consulter", oaScbConsulter);
			
			int count=oaScbMarketService.getCount(oaScbConsulter);
		
			int pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
			
			map.put("index", (Integer.parseInt(index)-1)*pageSize);
			map.put("pageSize", pageSize);
			
			List<OaScbConsulter>marketlist= oaScbMarketService.getmarketInfo(map);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (OaScbConsulter oaScbConsulter2 : marketlist) {
			
			 if(oaScbConsulter2.getAllotTime()!=null){
				 oaScbConsulter2.setAllotTimes(sdf.format(oaScbConsulter2.getAllotTime()));
			 }
			 
			}
			
			
			Map<String , Object>maps=new HashMap<String , Object>();
			maps.put("marketlist", marketlist);
			maps.put("index", Integer.parseInt(index));
			maps.put("pageCount", pageCount);
			maps.put("count", count);
			maps.put("pageSize", pageSize);
			
			return JSONArray.toJSONString(maps);
		}
	
	
	
	@RequestMapping(value="/amarketQuery")
	public String marketQuery(HttpServletRequest request,
			OaScbConsulter oaScbConsulter){
		
			//下拉框显示
		 	List <OaScbEducation>Educationlist = oaScbEducationService.selectEducationList();
		 	List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
			List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
			List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
			List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();
			List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
			List<OaScbMedianame> mediaNameList = oaScbMedianameService.selectMediaNameList();
			List<OaRlzybEmployee> empList = oaScbConsultTeacherService.ConsultTeacherFind();
			List<OaScbPaystatus> oaScbPaystatusList= oaScbConsultTeacherService.selectpaystatus();
			List<OaScbPaytype> oaScbPaytypeList=oaScbConsultTeacherService.selectpayType();
			

			request.setAttribute("ConsultTeacherList", empList);	/*返回所有咨询师*/
			request.setAttribute("oaScbPaystatusList", oaScbPaystatusList);//缴费状态
			request.setAttribute("oaScbPaytypeList", oaScbPaytypeList);/*缴费方式*/
			request.setAttribute("EducationList", Educationlist);
			request.setAttribute("InfosourceList", InfosourceList);
			request.setAttribute("consultWayList", consultWayList);
			request.setAttribute("rankList", rankList);
			request.setAttribute("consultStatusList", consultStatusList);
			request.setAttribute("consultLessonList", consultLessonList);
			request.setAttribute("mediaNameList", mediaNameList);
			
		return "marketDepartment/marketQuery";
	}

	//获得院校专业列表
	@RequestMapping(value="getMajor",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object getMajor(){
		int id = oaScbMarketService.selectschoolmaxid();
		List<OaScbMajorinfo> majorList = oaScbMarketService.selectSchoolMajor(id);
		return JSONArray.toJSONString(majorList);
	}
	
	//院校新增加载页面
	@RequestMapping(value="amarketSchoolAdd",method=RequestMethod.GET)
	public String marketSchoolAdd(HttpServletRequest request){
		
		
		return "marketDepartment/marketSchoolAdd";
	}
	
	//院校添加
		@RequestMapping(value="marketSchoolInfoAdd",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object marketSchoolInfoAdd(OaScbSchoolinfo oaScbSchoolinfo){
			
			
			oaScbMarketService.addschoolInfo(oaScbSchoolinfo);
			
			return "redirect:amarketSchoolAdd";
			
		}
	
	//院校信息修改
	@RequestMapping(value="marketSchoolInfoUpdate",method=RequestMethod.POST)
	public String marketSchoolInfoUpdate(@RequestParam(required=false) String schoolTimePlan,
										 @RequestParam(required=false) String opptSituation,
										 @RequestParam(required=false) String schoolsSchedule,
										 @RequestParam(required=false) String pushingSchedule,
										 @RequestParam(required=false) String studentsSituation){
		int id = oaScbMarketService.selectschoolmaxid();
		oaScbMarketService.updateschoolInfo(schoolTimePlan, opptSituation, schoolsSchedule, pushingSchedule, studentsSituation, id);
		
		return "marketDepartment/marketSchoolShow";
		
	}
	
	
	//专业信息添加
	@RequestMapping(value="marketMajorInfoAdd",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object marketMajorInfoAdd(OaScbMajorinfo oaScbMajorinfo){
			
		int id = oaScbMarketService.selectschoolmaxid();
		oaScbMajorinfo.setSchoolId(id);
		oaScbMarketService.addmajorInfo(oaScbMajorinfo);
		
		return "redirect:amarketSchoolAdd";
		
			
	}
	
	
	@RequestMapping(value="remarketMajorInfoAdd",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object remarketMajorInfoAdd(OaScbMajorinfo oaScbMajorinfo){
			
		int id = oaScbMarketService.selectschoolmaxid();
		oaScbMajorinfo.setSchoolId(id);
		oaScbMarketService.addmajorInfo(oaScbMajorinfo);
		
		
			return "redirect:amarketSchoolAdd";		
	}
	
		//院系负责人添加
		@RequestMapping(value="marketMajorPersonInfoAdd",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object marketMajorPersonInfoAdd(OaScbMajorpersoninfo oaScbMajorpersoninfo){
			
			int id = oaScbMarketService.selectschoolmaxid();
			oaScbMajorpersoninfo.setSchoolId(id);
			oaScbMarketService.addmajorpersonInfo(oaScbMajorpersoninfo);
				
				return "redirect:amarketSchoolAdd";
			
			
		}
		
		//班主任信息添加
		@RequestMapping(value="marketMajorTeacherInfoAdd",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object marketMajorTeacherInfoAdd(OaScbMajorteacherinfo oaScbMajorteacherinfo){
			
			int id = oaScbMarketService.selectschoolmaxid();
			oaScbMajorteacherinfo.setSchoolId(id);
			oaScbMarketService.addmajorteacherInfo(oaScbMajorteacherinfo);
			return "redirect:amarketSchoolAdd";
			
			
		}
		//取消操作
		@RequestMapping(value="cancelOperate",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object cancelOperate(){
			int id = oaScbMarketService.selectschoolmaxid();
			oaScbMarketService.deleteMajorTeacher(id);
			oaScbMarketService.deleteMajorPerson(id);
			oaScbMarketService.deleteMajor(id);
			oaScbMarketService.deleteSchool(id);
			return "取消操作！";
		}
		
		
		//加载院校查询
		@RequestMapping(value="amarketSchoolShow",method=RequestMethod.GET)
		public String marketSchoolShow(HttpServletRequest request){						
			
			/*List<OaScbSchoolinfo> schoolNamelist= oaScbMarketService.getschoolName();
			
			request.setAttribute("SchoolNameList", schoolNamelist);*/
				
			return "marketDepartment/marketSchoolShow";		
					
		}
		
		
		
		
		//查询院校信息1
		@RequestMapping(value="marketSchoolInfoShow1",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object marketSchoolInfoShow1(OaScbSchoolinfo oaScbSchoolinfo,@RequestParam(required=false) String index,String pageSizes){
			if(pageSizes==null||pageSizes.equals("")){
				pageSizes="10";
				}
			if(index==null || index.equals("")){
								index="1";
				}
							
						
					Map<String , Object>map=new HashMap<String , Object>();
					map.put("schoolinfo", oaScbSchoolinfo);
						
					int totalCount = oaScbMarketService.getschoolInfo1Count(oaScbSchoolinfo);
					int pageSize = Integer.parseInt(pageSizes);
					int pageCount = totalCount%pageSize==0? totalCount/pageSize:totalCount/pageSize+1;
						
					map.put("index", (Integer.parseInt(index)-1)*pageSize);
					map.put("pageSize", pageSize);
						
						
				List<OaScbSchoolinfo> marketlist=oaScbMarketService.getschoolInfo1(map);
						
				Map<String , Object>maps=new HashMap<String , Object>();
				maps.put("marketlist", marketlist);
				maps.put("index", Integer.parseInt(index));
				maps.put("pageCount", pageCount);
				maps.put("totalCount", totalCount);
				maps.put("pageSize", pageSize);
					
				return JSON.toJSONString(maps);
									
				}
		
		
		//查询院校信息2
				@RequestMapping(value="marketSchoolInfoShow2",produces="application/json;charset=utf-8")
				@ResponseBody
				public Object marketSchoolInfoShow2(@RequestParam String id){
					
					
					HashMap<String, Object> map = new HashMap<String, Object>();		
					OaScbSchoolinfo schoolinfo=oaScbMarketService.getschoolInfo2(Integer.parseInt(id));
					List<OaScbMajorinfo> majorinfoList = oaScbMarketService.getmajorInfo(Integer.parseInt(id));	
					map.put("schoolinfo", schoolinfo);
					map.put("majorinfoList", majorinfoList);
					return JSON.toJSONString(map);
											
				}
			@RequestMapping(value="marketmajorInfo",produces="application/json;charset=utf-8")
			@ResponseBody	
			public Object marketmajorInfo(@RequestParam String id){
				HashMap<String, Object> map = new HashMap<String, Object>();
				List<OaScbMajorpersoninfo> majorpersonList = oaScbMarketService.getmajorpersonInfo(Integer.parseInt(id));
				
				List<OaScbMajorteacherinfo> majorteacherList = oaScbMarketService.getmajorteacherInfo(Integer.parseInt(id));
				
				OaScbMajorinfo oaScbMajorinfo =oaScbMarketService.getspeciaInfo(Integer.parseInt(id));
				

				
				
				map.put("majorpersonList", majorpersonList);
				map.put("majorteacherList", majorteacherList);
				map.put("oaScbMajorinfo", oaScbMajorinfo);
				return JSONArray.toJSONString(map);
			}	
		
			
			
		
		
		//查询未提交信息量
		
		@RequestMapping(value="/getquery")
		public String query(){
			
			return "marketDepartment/MarktHandin";
							
		}
		
		//查询未提交量
				@RequestMapping(value="/query",produces="application/json;charset=utf-8")
				@ResponseBody
				public Object query(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String pageSizes ){
					
					if(index==null || index.equals("")){
						index="1";
					}
					
					if(pageSizes==null||pageSizes.equals("")){
						pageSizes="10";
					}
					int pageSize=Integer.parseInt(pageSizes);
					Map<String , Object>map=new HashMap<String , Object>();
					map.put("consulter", oaScbConsulter);
					
					int count=oaScbMarketService.getHandallCount(oaScbConsulter);
					
					int pageCount = count%pageSize == 0?count/pageSize:count/pageSize+1;
					
					map.put("index", (Integer.parseInt(index)-1)*pageSize);
					map.put("pageSize", pageSize);
					List<OaScbConsulter> querylist = oaScbMarketService.query(map);
					
					
					Map<String , Object>maps=new HashMap<String , Object>();
					maps.put("querylist", querylist);
					maps.put("index", Integer.parseInt(index));
					maps.put("pageCount", pageCount);
					maps.put("count", count);
					maps.put("pageSize", pageSize);
					
					
					
					return JSONArray.toJSONString(maps);
				}
		
		//修改状态
		/*@RequestMapping(value="/update",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object update( @RequestParam(required=false) String id){
			
			oaScbMarketService.update(Integer.parseInt(id));
					
					
			return "marketDepartment/MarktHandin";
		}*/
		@RequestMapping(value="/update/{id}",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object update( @PathVariable String id){
			
			oaScbMarketService.update(Integer.parseInt(id));
					
					
			return "marketDepartment/MarktHandin";
		}
		//查询追踪AssistantOaScbVisitFind
		
		@RequestMapping(value="/AssistantOaScbVisitFind",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object VisitFind(String consultId){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			List<OaScbVisit> OaScbVisit=oaScbMarketService.AssistantOaScbVisitFind(Integer.parseInt(consultId));
			OaScbConsulter OaScbConsulter=new OaScbConsulter();
			OaScbConsulter.setId(Integer.parseInt(consultId));
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("consulter", OaScbConsulter);
			List<OaScbConsulter> OaScbConsulterInfoList=oaScbMarketService.Queryfollwing(map);
			
			String consultTeacherName=null;
			if(OaScbConsulterInfoList.size()==1){
				for (OaScbConsulter oaScbConsulter2 : OaScbConsulterInfoList) {
					consultTeacherName=oaScbConsulter2.getConsultTeacherName();
				}
			}else{
				consultTeacherName="暂无";
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
		
		
		//提交量
		@RequestMapping(value="/handall",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object handOnInfo(@RequestParam String[] s){
			
			int[] id = new int[s.length];
			
			for (int i = 0; i < s.length; i++) {
				id[i] = Integer.parseInt(s[i]);
			}
			oaScbMarketService.handallInfo(id);
			
			return "提交成功";
		}
		
		//系主任加载
				@RequestMapping(value="marketPersonAdd")
				public String marketPersonAdd(HttpServletRequest request ,@RequestParam(required=false) String id){
					
					List<OaScbMajorinfo> MajorinfoList=oaScbMajorinfoService.selectMajorinfoList(Integer.parseInt(id));
					request.setAttribute("specialtyList", MajorinfoList);
						return "marketDepartment/marketPersonAdd";		
							
				}
				//系主任
				@RequestMapping(value="remarketPersonAdd",method=RequestMethod.POST)
				public String marketPersonAdd(OaScbMajorpersoninfo oaScbMajorpersoninfo){
					
					
					int id = oaScbMajorpersoninfo.getSpecialtId();
					
					int schoolId = oaScbMajorinfoService.findSchoolid(id);
					oaScbMajorpersoninfo.setSchoolId(schoolId);
					
					oaScbMarketService.addmajorpersonInfo(oaScbMajorpersoninfo);	
					
					return "marketDepartment/marketSchoolShow";		
									
				}
				
				//班主任加载
				@RequestMapping(value="marketTeacherAdd",method=RequestMethod.GET)
				public String marketTeacherAdd(HttpServletRequest request,@RequestParam(required=false) String id){						
					List<OaScbMajorinfo> MajorinfoList=oaScbMajorinfoService.selectMajorinfoList(Integer.parseInt(id));
					request.setAttribute("specialtyList", MajorinfoList);
					return "marketDepartment/marketTeacherAdd";		
									
				}
				//班主任
				@RequestMapping(value="remarketTeacherAdd",method=RequestMethod.POST)
				public String marketTeacherAdd(OaScbMajorteacherinfo oaScbMajorteacherinfo){						
					int id=oaScbMajorteacherinfo.getSpecialtId();
					
					int schoolId = oaScbMajorinfoService.findSchoolid(id);
					oaScbMajorteacherinfo.setSchoolId(schoolId);
					oaScbMarketService.addmajorteacherInfo(oaScbMajorteacherinfo);
					return "marketDepartment/marketSchoolShow";		
											
				}
				//专业加载
				@RequestMapping(value="marketMajorAdd",method=RequestMethod.GET)
				public String marketMajorAdd(HttpServletRequest request,@RequestParam (required=false) String id){
					
					request.setAttribute("id", id);
							
							
					return "marketDepartment/marketMajorAdd";
					
				}
				
				//加载修改专业信息
				@RequestMapping(value="marketMajorUpdate",method=RequestMethod.GET)
				public String marketMajorUpdate(HttpServletRequest request,@RequestParam (required=false) String id){
					List<OaScbMajorinfo> majorinfoList = oaScbMarketService.getmajorInfo(Integer.parseInt(id));
					request.setAttribute("majorinfoListUpdate", majorinfoList);
					
							
					return "marketDepartment/marketMajorUpdate";	
					
				}
				//修改专业
				@RequestMapping(value="marketMajorXG",method=RequestMethod.POST)
				public String marketMajorXG(OaScbMajorinfo oaScbMajorinfo){
					oaScbMarketService.marketMajorXG(oaScbMajorinfo);
					return "marketDepartment/marketSchoolShow";
				}
				//专业
				@RequestMapping(value="remarketMajorAdd",method=RequestMethod.POST)
				public String marketMajorAdd(OaScbMajorinfo oaScbMajorinfo){
					
					oaScbMarketService.addmajorInfo(oaScbMajorinfo);
							
					return "marketDepartment/marketSchoolShow";
							
				}
				
		@RequestMapping(value="schoolDetail")		
		public String schoolDetail(@RequestParam String id,HttpServletRequest request){
			OaScbSchoolinfo oaSchoolinfo = oaScbMarketService.selectSchoolById(Integer.parseInt(id));
			List<OaScbMajorinfo> majorList = oaScbMarketService.selectMajorBySchoolId(Integer.parseInt(id));
			request.setAttribute("oaSchoolinfo", oaSchoolinfo);
			request.setAttribute("majorList", majorList);
			return "marketDepartment/marketSchoolDetailedShow";
		}		
			
		@RequestMapping(value="/showspeciaInfo",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object showspeciaInfo(@RequestParam String id){
			HashMap<String, Object> map = new HashMap<String, Object>();
			OaScbMajorinfo oaScbMajorinfo = oaScbMarketService.getspeciaInfo(Integer.parseInt(id));
			
			System.out.println(id);
			System.out.println(oaScbMajorinfo.getSpecialtyName());
			map.put("oaScbMajorinfo", oaScbMajorinfo);
			List<OaScbMajorpersoninfo>  personList =  oaScbMarketService.getmajorpersonInfo(Integer.parseInt(id));
			System.out.println(personList.size()+"系主任人数");
			map.put("personList", personList);
			List<OaScbMajorteacherinfo> teacherList = oaScbMarketService.getmajorteacherInfo(Integer.parseInt(id));
			System.out.println(teacherList.size()+"班主任人数");
			map.put("teacherList", teacherList);
			System.out.println(map.size()+"个");
			return JSONArray.toJSONString(map);
		}
		
		@RequestMapping(value="/getall",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object getall(){
			return JSON.toJSONString(oaScbMarketService.getAll());
		}
		/**
		 * 点击取消调转页面
		 * @return
		 */
		@RequestMapping("marketWelcome")
		public String show(){
			return "marketDepartment/marketWelcome";
		}
		//市场渠道部主管删除
		@RequestMapping(value="/ConsulterDelete")
		public String ConsulterDelete(Integer id){
			OaScbMarketService.ConsulterDelete(id);
			return "redirect:/market/amarketQuery";
		};

		//进入修改学院信息
		@RequestMapping(value="/marketSchoollUpdate",method=RequestMethod.GET)
		public String shoollUpdate(Integer id,Model model){
			OaScbSchoolinfo oaSchoolinfo = oaScbMarketService.selectSchoolById(id);
		
			model.addAttribute("oaSchoolinfo", oaSchoolinfo);
			
			return "marketDepartment/marketSchoolUpdate";
		}
		//进入修改学院信息
		@RequestMapping(value="/marketSchoollUpdate",method=RequestMethod.POST)
		public String shoollUpdate1(OaScbSchoolinfo oaSchoolinfo,Model model ){
			int i=oaScbMarketService.updateSchoolinfo(oaSchoolinfo);
			if(i>0){
				return "marketDepartment/marketSchoolShow";
			}else{
				
				model.addAttribute("id",oaSchoolinfo.getId());
				return "marketDepartment/marketSchoolUpdate";
			}
			
		}

		@RequestMapping("majorinfoUpdate")
		public String majorinfoUpdate(OaScbMajorinfo OaScbMajorinfo){
			OaScbMarketService.majorinfoUpdate(OaScbMajorinfo);
			return "redirect:/market/amarketSchoolShow";
		}
		@RequestMapping("majorpersoninfoUpdate")
		public String majorpersoninfoUpdate(OaScbMajorpersoninfo OaScbMajorpersoninfo){
			if(OaScbMajorpersoninfo.getXisex().equals("男")){
				OaScbMajorpersoninfo.setSex(1);
			}else{
				OaScbMajorpersoninfo.setSex(2);
			}
			OaScbMarketService.majorpersoninfoUpdate(OaScbMajorpersoninfo);
			return "redirect:/market/amarketSchoolShow";
		};

		@RequestMapping("MajorteacherinfoUpdate")
		public String MajorteacherinfoUpdate(OaScbMajorteacherinfo OaScbMajorteacherinfo){
			if(OaScbMajorteacherinfo.getBansex().equals("男")){
				OaScbMajorteacherinfo.setSex(1);
			}else{
				OaScbMajorteacherinfo.setSex(2);
			}
			OaScbMarketService.MajorteacherinfoUpdate(OaScbMajorteacherinfo);
			return "redirect:/market/amarketSchoolShow";
		}

}
