package cn.tyyhoa.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbConsultlesson;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.pojo.OaScbConsultway;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbMedianame;
import cn.tyyhoa.pojo.OaScbOperation;
import cn.tyyhoa.pojo.OaScbPaystatus;
import cn.tyyhoa.pojo.OaScbPaytype;
import cn.tyyhoa.pojo.OaScbRanktype;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsultTeacherService;
import cn.tyyhoa.service.OaScbConsulterService;
import cn.tyyhoa.service.OaScbConsultlessonService;
import cn.tyyhoa.service.OaScbConsultstatusService;
import cn.tyyhoa.service.OaScbConsultwayService;
import cn.tyyhoa.service.OaScbEducationService;
import cn.tyyhoa.service.OaScbInfosourceService;
import cn.tyyhoa.service.OaScbMarketService;
import cn.tyyhoa.service.OaScbMedianameService;
import cn.tyyhoa.service.OaScbOperationService;
import cn.tyyhoa.service.OaScbRanktypeService;


@SuppressWarnings("unused")
@RequestMapping("/teacher")
@Controller
public class OaScbconsultTeacherController {
	@Autowired
	OaScbConsulterService oaScbCOnsulterService;
	@Autowired
	OaScbEducationService oaScbEducationService;	
	@Autowired
	OaScbInfosourceService oaScbInfosourceService;
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
	OaScbOperationService OaScbOperationService;
	@Autowired
	OaScbMarketService OaScbMarketService;
	
	//删除咨询量
	@RequestMapping(value="/ConsulterDelete")
	public String ConsulterDelete(Integer id,String employee_id ){
		 OaScbOperation operation=new OaScbOperation();
		   operation.setEmployee_id(Integer.parseInt(employee_id));
		   String Consult_name=OaScbOperationService.operationSelect(id);
			operation.setTime(new Date());
			operation.setContent("进行了删除,删除的咨询量是"+Consult_name);
			OaScbOperationService.Insertoperation(operation);
			OaScbOperationService.operationDelete(id);
		OaScbMarketService.ConsulterDelete(id);
		return "redirect:/teacher/consultTeacherQuery";
	};
	
	//进入查询界面
	@RequestMapping(value="/consultTeacherQuery",method=RequestMethod.GET)
	public String selectConsulter(HttpServletRequest request,HttpSession session){
		
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService.selectMediaNameList();
		List<OaScbPaytype> oaScbPaytypeList=oaScbConsultTeacherService.selectpayType();
		
		List<OaScbPaystatus> oaScbPaystatusList= oaScbConsultTeacherService.selectpaystatus();
		
		List<OaRlzybEmployee> classteacherList=oaScbConsultTeacherService.selectPosition();
		
		
		request.setAttribute("classteacherList", classteacherList);//查询班主任
		request.setAttribute("oaScbPaystatusList", oaScbPaystatusList);//缴费状态
		request.setAttribute("oaScbPaytypeList", oaScbPaytypeList);/*缴费方式*/
		request.setAttribute("EducationList",EducationList );
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);
		return "marketDepartment/consultTeacherQuery";
	}
	/*进入查询已通过审核页面*/
	@RequestMapping(value="/transferclassTeacher",method=RequestMethod.GET)
	public String selectteacher(HttpServletRequest request){
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService.selectMediaNameList();
		List<OaScbPaytype> oaScbPaytypeList=oaScbConsultTeacherService.selectpayType();
		
		List<OaScbPaystatus> oaScbPaystatusList= oaScbConsultTeacherService.selectpaystatus();
		
		List<OaRlzybEmployee> classteacherList=oaScbConsultTeacherService.selectPosition();
		/*for (OaRlzybEmployee oaRlzybEmployee : classteacherList) {
			oaRlzybEmployee.getEmp_name();
		}*/
		
		
		for (OaRlzybEmployee oaRlzybEmployee : classteacherList) {
			System.out.println(oaRlzybEmployee.getEmp_id());
		}
		request.setAttribute("classteacherList", classteacherList);//查询班主任
		request.setAttribute("oaScbPaystatusList", oaScbPaystatusList);//缴费状态
		request.setAttribute("oaScbPaytypeList", oaScbPaytypeList);/*缴费方式*/
		request.setAttribute("EducationList",EducationList );
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);
		return "marketDepartment/transferclassTeacher";
	}
	
	
	/**
	 * 进入修改页面
	 * @return
	 */
	@RequestMapping(value="/consultTeacherAdd")
	public String addConsulterPage(@RequestParam(required=false) String id,HttpServletRequest request,HttpSession session){
		session.setAttribute("id", id);
		
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService.selectMediaNameList();
		
				
		OaScbConsulter oaScbConsulter=oaScbConsultTeacherService.findConsulter(Integer.parseInt(id));
		oaScbConsulter.setId(Integer.parseInt(id));
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&"+Integer.parseInt(id));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(oaScbConsulter.getFirstComeTime()!=null){
			oaScbConsulter.setFirstComeTimes(sdf.format(oaScbConsulter.getFirstComeTime()));//首次上门日期
		}
		if(oaScbConsulter.getFirstConsultTime()!=null){
			oaScbConsulter.setFirstConsultTimes(sdf.format(oaScbConsulter.getFirstConsultTime()));//首次咨询日期
		}
		if(oaScbConsulter.getAllMoneyTime()!=null){
			oaScbConsulter.setAllMoneyTimes(sdf.format(oaScbConsulter.getAllMoneyTime()));//全款日期
		}
		
		request.setAttribute("EducationList",EducationList );
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);
		request.setAttribute("oaScbConsulter", oaScbConsulter);
		
		return "marketDepartment/consultTeacherAdd";
	}
	/**
	 * 进入回访页面
	 * @return
	 */
	@RequestMapping(value="/consultTeacherVisit")
	public String consultTeacherVisit(@RequestParam(required=false) String id,Integer stuId,HttpServletRequest request,HttpSession session){
		session.setAttribute("id", id);
		
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService.selectMediaNameList();
		
				
		OaScbConsulter oaScbConsulter=oaScbConsultTeacherService.findConsulter(Integer.parseInt(id));
		oaScbConsulter.setId(Integer.parseInt(id));
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&"+Integer.parseInt(id));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(oaScbConsulter.getFirstComeTime()!=null){
			oaScbConsulter.setFirstComeTimes(sdf.format(oaScbConsulter.getFirstComeTime()));//首次上门日期
		}
		if(oaScbConsulter.getFirstConsultTime()!=null){
			oaScbConsulter.setFirstConsultTimes(sdf.format(oaScbConsulter.getFirstConsultTime()));//首次咨询日期
		}
		
		if(oaScbConsulter.getAllMoneyTime()!=null){
			oaScbConsulter.setAllMoneyTimes(sdf.format(oaScbConsulter.getAllMoneyTime()));//全款日期
		}
		
		request.setAttribute("EducationList",EducationList );
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);
		request.setAttribute("oaScbConsulter", oaScbConsulter);
		request.setAttribute("stuId", stuId);
		return "marketDepartment/consultTeacherVisit";
	}
	
	/**
	 * 修改
	 * @return
	 */
	@RequestMapping(value="/consultTeacherAdda",method=RequestMethod.POST)
	public String updConsulter(OaScbConsulter oaScbConsulter,HttpSession session,String employee_id,Integer stutas){
		OaRlzybUser loginUser =  (OaRlzybUser) session.getAttribute("loginUser");
		String consultTeacherName = loginUser.getEmp_name();
		System.out.println(consultTeacherName+"%%%%%%%%%%%%%%%%%%%%%%%%%");
		String id=(String)session.getAttribute("id");
		oaScbConsulter.setId(Integer.parseInt(id));
		

		int conID = oaScbConsulter.getId();
		
		String returnvisitRecord = oaScbConsulter.getReturnvisitRecord();
		
	
			OaScbVisit visit  = new OaScbVisit();
			visit.setConsultId(conID);
			visit.setReturnvisitRecord(returnvisitRecord);
			visit.setReturnvisitTimes(oaScbConsulter.getReturnvisitTimes());
			if(oaScbConsulter.getNextvisitTimes()!=null){
				visit.setNextvisitTimes(oaScbConsulter.getNextvisitTimes());
			}
			
			visit.setReturnvisitPeopleName(consultTeacherName);
			visit.setStatus(stutas);
			int flag=oaScbConsultTeacherService.visitrecord(visit);	
		
		
		
		
		int idd =oaScbConsulter.getId();
		OaScbRecord oaScbRecord=new OaScbRecord();		
		oaScbRecord.setConsulterId(idd);
		oaScbRecord.setEnterPeople(consultTeacherName);
		oaScbRecord.setEnterTime(new Date());
		oaScbRecord.setEventName("回访记录");
		oaScbRecord.setEventTime(new Date());
		
		
		oaScbConsultTeacherService.insertRecord(oaScbRecord);
		//咨询部回访了有操作纪录
		if(stutas==0){
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setTime(new Date());
		operation.setConsulter_id(conID);
		operation.setContent("进行了回访");
		OaScbOperationService.Insertoperation(operation);
		if(flag>0){
			
			return "redirect:consultTeacherQuery";
		}
			System.out.println("失败了！");
			return "marketDepartment/consultTeacherQuery";	
		}else{
		
		if(flag>0){
			
			return "marketDepartment/marketQuery";
		}
			System.out.println("失败了！");
			return "marketDepartment/marketQuery";	
		}
	}
	//查询
	@RequestMapping(value="/consultTeacherQuery",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object categorylevellist(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String pageSizes,HttpServletRequest request,HttpSession session){
		OaRlzybUser loginUser =  (OaRlzybUser) session.getAttribute("loginUser");
		int consultTeacher = loginUser.getEmp_id();
		oaScbConsulter.setConsultTeacher(consultTeacher);
		if(index ==null||index.equals("")){
			index="1";
		}
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}
		
		int pageSize=Integer.parseInt(pageSizes);		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("consulter", oaScbConsulter);
		List<OaScbConsulter> totalCountList=oaScbConsultTeacherService.selectConsulterCount(oaScbConsulter);
		int totalCount=totalCountList.size();
		System.out.println("长度为:"+totalCount);
		int pageCount=totalCount % pageSize==0 ? totalCount/pageSize : totalCount/pageSize+1;
		map.put("index", (Integer.parseInt(index)-1)*pageSize);
		map.put("pageSize", pageSize);
		List<OaScbConsulter> consulterList=oaScbConsultTeacherService.selectConsulter(map);
		
		
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
				request.setAttribute("consultLessonList", consultLessonList);/*咨询课程*/
		HashMap<String, Object> hashmap=new HashMap<String, Object>();
		hashmap.put("consulterList", consulterList);
		hashmap.put("index", Integer.parseInt(index));
		hashmap.put("pageCount", pageCount);
		hashmap.put("totalCount", totalCount);
		hashmap.put("pageSize", pageSize);
		
		return JSONArray.toJSONString(hashmap);
	}

	
	/**
	 * 不再显示
	 * @param num
	 * @return
	 */
	@RequestMapping(value="/displayConsulter/{num}",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object displayConsulter(@PathVariable String num){

		oaScbConsultTeacherService.displayConsulter(Integer.parseInt(num));
		return "redirect:consultTeacherQuery";
	}
	/**
	 * 点击报审
	 * @param num
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/enrollStatusConsulter/{id}",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object enrollStatusConsulter(@PathVariable String id){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		OaScbConsulter oaScbConsulter2 = oaScbConsultTeacherService.consultquerybaoshen(Integer.parseInt(id));
		
		if(oaScbConsulter2.getPayTime()!=null){
			oaScbConsulter2.setPayTimes(sdf.format(oaScbConsulter2.getPayTime()));/*缴费时间*/
		}else{
			oaScbConsulter2.setPayTimes("暂无");
		}
				
		if(oaScbConsulter2.getConsultTeacherName()==null){//负责咨询师
			oaScbConsulter2.setConsultTeacherName("暂无");
		}
			
		return JSONArray.toJSONString(oaScbConsulter2);
	}
	/**
	 * 点击保存
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/saveShenhe",produces="application/json;charset=utf-8")	
	public String payStatusConsulter(OaScbConsulter  oaScbConsulter ,@RequestParam String id,HttpServletRequest request){
		String con=request.getParameter("consultLesson");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String payTime=request.getParameter("a_payTime");

		Date date=null;
		try {
			date=sdf.parse(payTime.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		oaScbConsulter.setId(Integer.parseInt(id));
		oaScbConsulter.setPayTime(date);
		boolean flag=oaScbConsultTeacherService.StatusConsulter(oaScbConsulter);
		if(flag){			
			return "redirect:teacher/enrollStatusConsulter/"+id;
		}else{
			return "redirect:/saveShenhe";
		}
	}
	
	/**
	 *点击提交
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/commitShenhe",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object declareConsulter(OaScbConsulter  oaScbConsulter, @RequestParam String id,String employee_id,HttpServletRequest request){
		String con=request.getParameter("consultLesson");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String payTime=request.getParameter("a_payTime");

		Date date=null;
		try {
			date=sdf.parse(payTime.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		oaScbConsulter.setId(Integer.parseInt(id));
		oaScbConsulter.setPayTime(date);
		boolean flag=oaScbConsultTeacherService.enrollStatusConsulter(oaScbConsulter);
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setConsulter_id(Integer.parseInt(id));
		operation.setTime(new Date());
		operation.setContent("提交了报审");
		OaScbOperationService.Insertoperation(operation);
		if(flag){			
			return "redirect:teacher/enrollStatusConsulter/"+id;
		}else{
			return "redirect:/saveShenhe";
		}
	}
	
	/**
	 * 跟踪
	 * @param consultId
	 * @return
	 */
	@RequestMapping(value="/consultTeacher",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object queryvisit(String consultId){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		List<OaScbVisit> OaScbVisit=oaScbConsultTeacherService.queryvisit(Integer.parseInt(consultId));
		OaScbConsulter OaScbConsulter=new OaScbConsulter();
		OaScbConsulter.setId(Integer.parseInt(consultId));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("consulter", OaScbConsulter);
		List<OaScbConsulter> OaScbConsulterInfoList=oaScbConsultTeacherService.consultqueryvisit(map);
		
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
	
	/**
	 * 提交无效量
	 * @param conId
	 * @param conresultInfo
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="/writeResut/{conId}/{conresultInfo}/{employee_id}",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object writeResut(@PathVariable String conId,@PathVariable String conresultInfo,@PathVariable String employee_id) throws UnsupportedEncodingException{
		conresultInfo=new String(conresultInfo.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(conresultInfo);
		oaScbConsultTeacherService.invalidConsulter(conresultInfo,Integer.parseInt(conId));
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setConsulter_id(Integer.parseInt(conId));
		operation.setTime(new Date());
		operation.setContent("申请无效量");
		OaScbOperationService.Insertoperation(operation);
		return null;
	}
	
	/**
	 * 批量移交班主任
	 */
	@RequestMapping(value="/classteacher",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object handOnInfo(@RequestParam String[] s,@RequestParam String consultTeacherid){
				int  Teacherid = Integer.parseInt(consultTeacherid);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("allotClassteacher", Teacherid);
				
				int[] id = new int[s.length];
				map.put("id", id);
				for (int i = 0; i < s.length; i++) {
					System.out.println(s[i]);
					id[i] = Integer.parseInt(s[i]);
				}
	
				oaScbConsultTeacherService.updatePosition(map);

				return "提交成功";
			}

			
	/**
	 *移交班主任
			 * @param oaScbConsulter
			 * @param index
			 * @param pageSizes
			 * @param request
			 * @param session
			 * @return
	*/
	@RequestMapping(value="/transferclassTeacher",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object selectclassteacher(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String pageSizes,HttpServletRequest request,HttpSession session){
				
				
				if(index ==null||index.equals("")){
					index="1";
				}
				if(pageSizes==null||pageSizes.equals("")){
					pageSizes="10";
				}
				int pageSize=Integer.parseInt(pageSizes);		
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("consulter", oaScbConsulter);
				
				List<OaScbConsulter> totalCountList=oaScbConsultTeacherService.selectConsulterCount(oaScbConsulter);
				int totalCount=totalCountList.size();
				int pageCount=totalCount % pageSize==0 ? totalCount/pageSize : totalCount/pageSize+1;
				map.put("index", (Integer.parseInt(index)-1)*pageSize);
				map.put("pageSize", pageSize);
				List<OaScbConsulter> consulterList=oaScbConsultTeacherService.selectTeacherConsulter(map);
				
				
				List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
						request.setAttribute("consultLessonList", consultLessonList);/*咨询课程*/
				HashMap<String, Object> hashmap=new HashMap<String, Object>();
				hashmap.put("consulterList", consulterList);
				hashmap.put("index", Integer.parseInt(index));
				hashmap.put("pageCount", pageCount);
				hashmap.put("totalCount", totalCount);
				hashmap.put("pageSize", pageSize);
				
				return JSONArray.toJSONString(hashmap);
			}
	   /**
	    * 跳转到当天咨询量
	    * @return
	    */
	   @RequestMapping(value="/consultDirectorone")
	   public String one(HttpSession session){
		   List<OaScbPaystatus> oaScbPaystatusList= oaScbConsultTeacherService.selectpaystatus();
			List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
			List<OaScbPaytype> oaScbPaytypeList=oaScbConsultTeacherService.selectpayType();
			
		   session.setAttribute("oaScbPaystatusList", oaScbPaystatusList);//缴费状态
			session.setAttribute("oaScbPaytypeList", oaScbPaytypeList);/*缴费方式*/
			session.setAttribute("consultLessonList", consultLessonList);
		   return "marketDepartment/consultDirectorone";
	   }
	   /**
	    * 跳转到3天咨询量
	    * @return
	    */
	   @RequestMapping(value="/consultDirectorthree")
	   public String three(){
		   return "marketDepartment/consultDirectorthree";
	   }
	   /**
	    * 跳转到7天咨询量
	    * @return
	    */
	   @RequestMapping(value="/consultDirectorsave")
	   public String save(){
		   return "marketDepartment/consultDirectorsave";
	   }
	   /**
	    * 跳转到7天以上咨询量
	    * @return
	    */
	   @RequestMapping(value="/consultDirectorsaveup")
	   public String saveupa(){
		   return "marketDepartment/consultDirectorsaveup";
	   }
	   /**
	    * 全部
	    * @return
	    */
	   @RequestMapping(value="/consultDirectorall")
	   public String all(){
		   return "marketDepartment/consultTeacherQuery";
	   }

	
	
	/*@RequestMapping(value="/enrollConsult",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object enrollConsult(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String pageSizes){
		
		if(index ==null||index.equals("")){
			index="1";
		}
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}
		int pageSize=Integer.parseInt(pageSizes);
	}*/
		//查询当天
		@RequestMapping(value="/consultTeacherone",produces="application/json;charset=utf-8")
		@ResponseBody
		public Object categoryleveone(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String pageSizes,HttpServletRequest request,HttpSession session){
			OaRlzybUser loginUser =  (OaRlzybUser) session.getAttribute("loginUser");
			List<OaScbPaystatus> oaScbPaystatusList= oaScbConsultTeacherService.selectpaystatus();
			List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
			List<OaScbPaytype> oaScbPaytypeList=oaScbConsultTeacherService.selectpayType();
			int consultTeacher = loginUser.getEmp_id();
			oaScbConsulter.setConsultTeacher(consultTeacher);
			if(index ==null||index.equals("")){
				index="1";
			}
			if(pageSizes==null||pageSizes.equals("")){
				pageSizes="10";
			}
			
			int pageSize=Integer.parseInt(pageSizes);		
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("consulter", oaScbConsulter);
			List<OaScbConsulter> totalCountList=oaScbConsultTeacherService.selectConsulterCount(oaScbConsulter);
			map.put("index", (Integer.parseInt(index)-1)*pageSize);
			map.put("pageSize", pageSize);
			List<OaScbConsulter> consulterList=oaScbConsultTeacherService.selectConsulterone(map);
			int totalCount=consulterList.size();
			System.out.println("长度为:"+totalCount);
			int pageCount=totalCount % pageSize==0 ? totalCount/pageSize : totalCount/pageSize+1;

			HashMap<String, Object> hashmap=new HashMap<String, Object>();
			hashmap.put("consulterList", consulterList);
			hashmap.put("index", Integer.parseInt(index));
			hashmap.put("pageCount", pageCount);
			hashmap.put("totalCount", totalCount);
			hashmap.put("pageSize", pageSize);
			session.setAttribute("oaScbPaystatusList", oaScbPaystatusList);//缴费状态
			session.setAttribute("oaScbPaytypeList", oaScbPaytypeList);/*缴费方式*/
			session.setAttribute("consultLessonList", consultLessonList);
			return JSONArray.toJSONString(hashmap);
		}
		//查询三天内
				@RequestMapping(value="/consultTeacherthree",produces="application/json;charset=utf-8")
				@ResponseBody
				public Object categorylevethree(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String pageSizes,HttpServletRequest request,HttpSession session){
					OaRlzybUser loginUser =  (OaRlzybUser) session.getAttribute("loginUser");
					List<OaScbPaystatus> oaScbPaystatusList= oaScbConsultTeacherService.selectpaystatus();
					List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
					List<OaScbPaytype> oaScbPaytypeList=oaScbConsultTeacherService.selectpayType();
				
					int consultTeacher = loginUser.getEmp_id();
					oaScbConsulter.setConsultTeacher(consultTeacher);
					if(index ==null||index.equals("")){
						index="1";
					}
					if(pageSizes==null||pageSizes.equals("")){
						pageSizes="10";
					}
					
					int pageSize=Integer.parseInt(pageSizes);		
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("consulter", oaScbConsulter);
					List<OaScbConsulter> totalCountList=oaScbConsultTeacherService.selectConsulterCount(oaScbConsulter);
					map.put("index", (Integer.parseInt(index)-1)*pageSize);
					map.put("pageSize", pageSize);
					List<OaScbConsulter> consulterList=oaScbConsultTeacherService.selectConsulterthree(map);
					int totalCount=consulterList.size();
					System.out.println("长度为:"+totalCount);
					int pageCount=totalCount % pageSize==0 ? totalCount/pageSize : totalCount/pageSize+1;
						HashMap<String, Object> hashmap=new HashMap<String, Object>();
					hashmap.put("consulterList", consulterList);
					hashmap.put("index", Integer.parseInt(index));
					hashmap.put("pageCount", pageCount);
					hashmap.put("totalCount", totalCount);
					hashmap.put("pageSize", pageSize);
					session.setAttribute("oaScbPaystatusList", oaScbPaystatusList);//缴费状态
					session.setAttribute("oaScbPaytypeList", oaScbPaytypeList);/*缴费方式*/
					session.setAttribute("consultLessonList", consultLessonList);
					
					return JSONArray.toJSONString(hashmap);
				}
				//查询七天内
				@RequestMapping(value="/consultTeachersave",produces="application/json;charset=utf-8")
				@ResponseBody
				public Object categorylevesave(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String pageSizes,HttpServletRequest request,HttpSession session){
					OaRlzybUser loginUser =  (OaRlzybUser) session.getAttribute("loginUser");
					List<OaScbPaystatus> oaScbPaystatusList= oaScbConsultTeacherService.selectpaystatus();
					List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
					List<OaScbPaytype> oaScbPaytypeList=oaScbConsultTeacherService.selectpayType();
				
					int consultTeacher = loginUser.getEmp_id();
					oaScbConsulter.setConsultTeacher(consultTeacher);
					if(index ==null||index.equals("")){
						index="1";
					}
					if(pageSizes==null||pageSizes.equals("")){
						pageSizes="10";
					}
					
					int pageSize=Integer.parseInt(pageSizes);		
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("consulter", oaScbConsulter);
					List<OaScbConsulter> totalCountList=oaScbConsultTeacherService.selectConsulterCount(oaScbConsulter);
					map.put("index", (Integer.parseInt(index)-1)*pageSize);
					map.put("pageSize", pageSize);
					List<OaScbConsulter> consulterList=oaScbConsultTeacherService.selectConsultersave(map);
					int totalCount=consulterList.size();
					System.out.println("长度为:"+totalCount);
					int pageCount=totalCount % pageSize==0 ? totalCount/pageSize : totalCount/pageSize+1;
					HashMap<String, Object> hashmap=new HashMap<String, Object>();
					hashmap.put("consulterList", consulterList);
					hashmap.put("index", Integer.parseInt(index));
					hashmap.put("pageCount", pageCount);
					hashmap.put("totalCount", totalCount);
					hashmap.put("pageSize", pageSize);
					session.setAttribute("oaScbPaystatusList", oaScbPaystatusList);//缴费状态
					session.setAttribute("oaScbPaytypeList", oaScbPaytypeList);/*缴费方式*/
					session.setAttribute("consultLessonList", consultLessonList);
					
					return JSONArray.toJSONString(hashmap);
				}
				//查询七天后
				@RequestMapping(value="/consultTeachersaveup",produces="application/json;charset=utf-8")
				@ResponseBody
				public Object categorylevesaveup(OaScbConsulter oaScbConsulter,@RequestParam(required=false) String index,String pageSizes,HttpServletRequest request,HttpSession session){
					OaRlzybUser loginUser =  (OaRlzybUser) session.getAttribute("loginUser");
					List<OaScbPaystatus> oaScbPaystatusList= oaScbConsultTeacherService.selectpaystatus();
					List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService.selectConsultLessonList();
					List<OaScbPaytype> oaScbPaytypeList=oaScbConsultTeacherService.selectpayType();
				
					int consultTeacher = loginUser.getEmp_id();
					oaScbConsulter.setConsultTeacher(consultTeacher);
					if(index ==null||index.equals("")){
						index="1";
					}
					if(pageSizes==null||pageSizes.equals("")){
						pageSizes="10";
					}
					
					int pageSize=Integer.parseInt(pageSizes);		
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("consulter", oaScbConsulter);
					List<OaScbConsulter> totalCountList=oaScbConsultTeacherService.selectConsulterCount(oaScbConsulter);
					map.put("index", (Integer.parseInt(index)-1)*pageSize);
					map.put("pageSize", pageSize);
					List<OaScbConsulter> consulterList=oaScbConsultTeacherService.selectConsultersaveup(map);
					int totalCount=consulterList.size();
					System.out.println("长度为:"+totalCount);
					int pageCount=totalCount % pageSize==0 ? totalCount/pageSize : totalCount/pageSize+1;
					HashMap<String, Object> hashmap=new HashMap<String, Object>();
					hashmap.put("consulterList", consulterList);
					hashmap.put("index", Integer.parseInt(index));
					hashmap.put("pageCount", pageCount);
					hashmap.put("totalCount", totalCount);
					hashmap.put("pageSize", pageSize);
					session.setAttribute("oaScbPaystatusList", oaScbPaystatusList);//缴费状态
					session.setAttribute("oaScbPaytypeList", oaScbPaytypeList);/*缴费方式*/
					session.setAttribute("consultLessonList", consultLessonList);
					
					return JSONArray.toJSONString(hashmap);
				}
				
				@RequestMapping(value="/Updatesfjs")
				public String Update(String id){
				Integer c_id=0;
				if(id!=null || id.equals("")){
					c_id=Integer.parseInt(id);
				}
				oaScbConsultTeacherService.Update(c_id);
					  return"teacher/consultTeacherQuery";
				}
}


