package cn.tyyhoa.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;


import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaScbConsulter;

import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsultlesson;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.pojo.OaScbConsultway;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbMedianame;
import cn.tyyhoa.pojo.OaScbOperation;
import cn.tyyhoa.pojo.OaScbRanktype;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsultwayService;
import cn.tyyhoa.service.OaScbRanktypeService;
import cn.tyyhoa.service.OaScbConsultTeacherService;
import cn.tyyhoa.service.OaScbEducationService;
import cn.tyyhoa.service.OaScbConsultstatusService;
import cn.tyyhoa.service.OaScbInfosourceService;
import cn.tyyhoa.service.OaScbMarketService;
import cn.tyyhoa.service.OaScbRetrieveConsulterService;
import cn.tyyhoa.service.OaScbSpecialtyService;
import cn.tyyhoa.service.OaScbConsultAssistantAddService;
import cn.tyyhoa.service.OaScbConsultAssistantQueryService;
import cn.tyyhoa.service.OaScbConsultTeacherService;
import cn.tyyhoa.service.OaScbMedianameService;
import cn.tyyhoa.service.OaScbOperationService;
import cn.tyyhoa.service.OaScbConsultAssistantSheetService;
import cn.tyyhoa.util.ExcelUtil;
import cn.tyyhoa.util.QRCodeGeneratorUtils;
import cn.tyyhoa.util.SendFileUtil;



@RequestMapping("/Consultway")
@Controller
public class OaScbConsultAssistantController {

	@Autowired
	OaScbConsultwayService oaScbConsultwayService;
	@Autowired
	OaScbRanktypeService oaScbRanktypeService;
	@Autowired
	OaScbConsultTeacherService oaScbConsultTeacherService;
	@Autowired
	OaScbEducationService oaScbEducationService;
	@Autowired
	OaScbConsultstatusService oaScbConsultstatusService;
	@Autowired
	OaScbInfosourceService oaScbInfosourceService;
	@Autowired
	OaScbSpecialtyService OaScbSpecialtyService;
	@Autowired
	OaScbConsultAssistantAddService OaScbConsultAssistantAddService;
	@Autowired
	OaScbConsultAssistantQueryService OaScbConsultAssistantQueryService;
	@Autowired
	OaScbRetrieveConsulterService oaScbRetrieveConsulterService;
	@Autowired
	OaScbMedianameService OaScbMedianameService;
	@Autowired
	OaScbConsultAssistantSheetService OaScbConsultAssistantSheetService;
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
			return "redirect:/Consultway/consultAssistantQuery";
		};
		
	/**
	 * 跳转查看跟踪详情页面
	 */
	@RequestMapping(value="/findFollow")
	public String findFollow(Integer id,Integer stuId,Model model){
		model.addAttribute("id", id);
		model.addAttribute("stuId", stuId);
		return "marketDepartment/FindFollow";
	}
	/**
	 * 新增页面-跳转
	 * @return
	 */
	@RequestMapping(value="/ToconsultAssistantAdd")
	public String ToContAssantAdd(HttpServletRequest request){
		
		
		/*信息来源*/
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
		
		/*咨询方式*/
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		
		/*咨询量等级*/
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		
		/*课程信息*/
		List<OaScbConsultlesson> ConsultlessonFindList=OaScbSpecialtyService.ConsultlessonFind();
		
		/*媒体名称*/
		List<OaScbMedianame> MedianameList= OaScbMedianameService.selectMediaNameList();
		
		/*查询学历信息*/
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();

		/*查询所有咨询量状态*/
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();

		/*查询所有咨询师*/
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService.ConsultTeacherFind();

		
		request.setAttribute("consultwayLsit", consultWayList);
		request.setAttribute("RanktypeList", rankList);
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("EducationList", EducationList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("SpecialtyList", ConsultlessonFindList);/*咨询课程信息*/
		request.setAttribute("ConsultTeacherList", empList);	/*返回所有咨询师*/
		request.setAttribute("mediaNameList", MedianameList);	/*媒体名称*/
		
		return "marketDepartment/consultAssistantAdd";
	}

	/**
	 * 新增页面-新增
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/consultAssistantAdd",method=RequestMethod.POST)
	
	public String ContAssantAdd(OaScbConsulter oaScbConsulter,String employee_id,HttpSession session) throws ParseException{
		System.out.println(oaScbConsulter.getPhoneticize());
		
		if(oaScbConsulter.getProvince().equals("省份")){/*设置省份*/
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
		if(oaScbConsulter.getConsultTeacher() ==0){
			
			oaScbConsulter.setAllotstatus(2);
		}else{
			oaScbConsulter.setAllotstatus(1);
			oaScbConsulter.setAllotTime(new Date());
		}
		oaScbConsulter.setInfoStatus(2);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		oaScbConsulter.setFirstConsultTime(sdf.parse(oaScbConsulter.getFirstConsultTimes()));
		boolean flag=OaScbConsultAssistantAddService.ConsultAssistantAdd(oaScbConsulter);
		
		int id=OaScbConsultAssistantAddService.maxId();
		OaScbRecord oaScbRecord=new OaScbRecord();		
		oaScbRecord.setConsulterId(id);
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		
		oaScbRecord.setEnterPeople(user.getEmp_name());
		oaScbRecord.setEnterTime(new Date());
		oaScbRecord.setEventName("首次咨询");
		oaScbRecord.setEventTime(new Date());
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		String consulter_id=OaScbOperationService.consulter_id(oaScbConsulter);
		operation.setConsulter_id(Integer.parseInt(consulter_id));
		operation.setTime(new Date());
		operation.setContent("新增了咨询量");
		OaScbOperationService.Insertoperation(operation);
		
		OaScbConsultAssistantAddService.insertRecord(oaScbRecord);
		if(flag){
			
				return "marketDepartment/consultAssistantQuery";
		}else{
			return "marketDepartment/consultAssistantAdd";
		}
	}
	
	/**
	 * 跳转查询页面
	 */
	@RequestMapping(value="/consultAssistantQuery")
	public String ToconsultAssistantQuery(HttpServletRequest request){
		
		
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();
		
		/*咨询方式*/
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		for (OaScbConsultway oaScbConsultway : consultWayList) {
			System.out.println(oaScbConsultway.getConsultWay());
		}
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		
		/*课程信息*/
		List<OaScbConsultlesson> ConsultlessonFindList=OaScbSpecialtyService.ConsultlessonFind();
	
		
		/*查询学历信息*/
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();

		/*查询所有咨询量状态*/
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();

		/*查询所有咨询师*/
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService.ConsultTeacherFind();
		
		
		request.setAttribute("ConsultwayLsit",consultWayList);
		request.setAttribute("RanktypeList", rankList);
		request.setAttribute("InfosourceList",InfosourceList);
		request.setAttribute("EducationList", EducationList);
		request.setAttribute("ConsultstatusList", consultStatusList);
		request.setAttribute("SpecialtyList", ConsultlessonFindList);/*咨询课程*/
		request.setAttribute("ConsultTeacherList", empList);	/*返回所有咨询师*/
		return "marketDepartment/consultAssistantQuery";
	}
	
	
	/**
	 * 查询页面-查询
	 * @throws ParseException 
	 */
	@RequestMapping(value="/ToconsultAssistantQuery")
	@ResponseBody
	public Object consultAssistantQuery(OaScbConsulter OaScbConsulter,
			HttpServletRequest request,
			/*OaScbVisit OaScbVisit,*/
			String firstConsultTimes,	/*首次咨询日期*/
			String enrollTimes,		/*报名日期*/
			/*String nextvisitTimes,	*//*下次回访时间*/
			Model model,
			String content,
			String productName,
			String id,
			String index,
			String pageSizes  /*每页显示的条数*/
			,Integer orderId /*表头排序id*/
			)throws ParseException{
		System.out.println("index的值:"+index);
		System.out.println("学历："+OaScbConsulter.getEducation());
		if(index==null||index.equals("")){
			index="1";
		}
		System.out.println("id的值:"+id);
		System.out.println("每页显示的条数"+pageSizes);
		
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}
		int pageSize=Integer.parseInt(pageSizes);
		//类型转换
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date firstConsultTimesDate=null;
		
		/*首次咨询日期--String转Date类型*/
		if(firstConsultTimes!=null && !firstConsultTimes.equals("") ){
			firstConsultTimesDate=sdf.parse(firstConsultTimes);		
		}
		
		/*报名日期--String转Date类型*/
		Date enrollTimesDate=null;
		if(enrollTimes!=null && !enrollTimes.equals("")){
			enrollTimesDate=sdf.parse(enrollTimes);		
		}
		
		/*Date nextvisitTimesDate=null;
		if(nextvisitTimes!=null && !nextvisitTimes.equals("")){
			nextvisitTimesDate=sdf.parse(nextvisitTimes);		下次回访时间--String转Date类型
			
		}  */
        
		/*赋值id*/
		if(id!=null &&!id.equals("")){
		OaScbConsulter.setId(Integer.parseInt(id));
		}
		OaScbConsulter.setFirstConsultTime(firstConsultTimesDate);//赋值报名日期
        OaScbConsulter.setEnrollTime(enrollTimesDate);//赋值报名日期
       /* OaScbVisit.setNextvisitTime(nextvisitTimesDate);//赋值下次回访时间*/
        
            
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("consulter", OaScbConsulter);
		/*map.put("visit",OaScbVisit);*/
		int totalCount=OaScbConsultAssistantQueryService.ConsultAssistantQuerPageCount(map);/*总记录数*/
		
		int pageCount=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;/*总页数*/
		
		
		map.put("index",(Integer.parseInt(index)-1)*pageSize);/*从第一条数据开始*/
		map.put("pageSize", pageSize);/*显示的条数*/
		map.put("orderId", orderId);
		List<OaScbConsulter> consulterList=OaScbConsultAssistantQueryService.ConsultAssistantQueryFind(map);
		String name="";
		for (OaScbConsulter oaScbConsulter2 : consulterList) {
			System.out.println(oaScbConsulter2.getName());
			if(oaScbConsulter2.getConsultTeacherName()==null){
				oaScbConsulter2.setConsultTeacherName("暂无");
			}
			name =oaScbConsulter2.getName();
			if(oaScbConsulter2.getFirstConsultTime()!=null){
				oaScbConsulter2.setFirstConsultTimes(sdf.format(oaScbConsulter2.getFirstConsultTime()));
			}else{
				oaScbConsulter2.setFirstConsultTimes("暂无");
			}
			if(oaScbConsulter2.getFirstConsultTime()==null){
				oaScbConsulter2.setFirstConsultTimes("暂无");
			}
			if(oaScbConsulter2.getTelphone1()==null){
				oaScbConsulter2.setTelphone1("暂无");
			}
			if(oaScbConsulter2.getConsultLessonName()==null){
				oaScbConsulter2.setConsultLessonName("暂无");
			}
			if(oaScbConsulter2.getConsultwayName()==null){
				oaScbConsulter2.setConsultwayName("暂无");
			}
			if(oaScbConsulter2.getCity()==null||oaScbConsulter2.getCity().equals("地级市")){
				oaScbConsulter2.setCity("暂无");
			}
			if(oaScbConsulter2.getStatusName()==null){
				oaScbConsulter2.setStatusName("暂无");
			}
			if(oaScbConsulter2.getEducationName()==null){
				oaScbConsulter2.setEducationName("暂无");
			}
			if(oaScbConsulter2.getWechat()==null){/*微信/qq*/
				oaScbConsulter2.setWechat("暂无");
			}
			if(oaScbConsulter2.getProvince()==null||oaScbConsulter2.getProvince().equals("省份")){/*省份*/
				oaScbConsulter2.setProvince("暂无");
				oaScbConsulter2.setCity("暂无");
				oaScbConsulter2.setDistrict("暂无");
			}
			if(oaScbConsulter2.getUrgentTelpeople()==null ||oaScbConsulter2.getUrgentTelpeople().equals("")){/*紧急联系人*/
				oaScbConsulter2.setUrgentTelpeople("暂无");
			}
			if(oaScbConsulter2.getUngenTelphone()==null||oaScbConsulter2.getUngenTelphone().equals("")){/*紧急联系人电话*/
				oaScbConsulter2.setUngenTelphone("暂无");
			}
			if(oaScbConsulter2.getStatusName()==null||oaScbConsulter2.getStatusName().equals("")){/*社会状态*/
				oaScbConsulter2.setStatusName("暂无");
			}
			
			if(oaScbConsulter2.getSchoolName()==null||oaScbConsulter2.getSchoolName().equals("")){/*毕业院校*/
				oaScbConsulter2.setSchoolName("暂无");
			}
			
			if(oaScbConsulter2.getEducationName()==null||oaScbConsulter2.getEducationName().equals("")){/*学历*/
				oaScbConsulter2.setEducationName("暂无");
			}
			if(oaScbConsulter2.getSpecialty()==null||oaScbConsulter2.getSpecialty().equals("")){/*专业*/
				oaScbConsulter2.setSpecialty("暂无");
			}
			if (oaScbConsulter2.getConsultTeacherName()==null||oaScbConsulter2.getConsultTeacherName().equals("")) {/*咨询师*/
				oaScbConsulter2.setConsultTeacherName("暂无");
			}
			if(oaScbConsulter2.getConsultLessonName()==null||oaScbConsulter2.getConsultLessonName().equals("")){/*咨询课程*/
				oaScbConsulter2.setConsultLessonName("暂无");
			}
			if(oaScbConsulter2.getCome()==null){/*上门状态*/
				oaScbConsulter2.setCome(2);
			}
			
			if(oaScbConsulter2.getEnrollStatus()==null){/*报名状态*/
				oaScbConsulter2.setEnrollStatus(2);
			}
			if(oaScbConsulter2.getRankName()==null||oaScbConsulter2.getRankName().equals("")){/*咨询量等级*/
				oaScbConsulter2.setRankName("暂无");
			}
			if(oaScbConsulter2.getComments()==null||oaScbConsulter2.getComments().equals("")){/*备注/说明*/
				oaScbConsulter2.setComments("暂无");
			}
		}
		
		
		Map<String,Object> resultMap=new HashMap<String,Object>();
		resultMap.put("index", index);
		resultMap.put("pageCount", pageCount);
		resultMap.put("consulterList", consulterList);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pageSize", pageSize);
		
		if(id!=null){
		
		String contextPath = request.getContextPath();  /* 获得项目名 */
		String realPath = request.getSession().
		                getServletContext().getRealPath("/");/*获得绝对路径*/
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+
		                request.getServerPort()+contextPath+"/";/*获得服务器路径*/
		
		
		
		
		
		basePath+="Consultway/ToAssistantConsultInfo/"+id;
		System.out.println(basePath);
		String url="http://192.168.43.12:8080/tyyhoaTeam2/";
		
		
		content =basePath;
    	 productName="";/*name+" 资料详情"*/
	    String str= QRCodeGeneratorUtils.getLogoQRCode(content, request,productName,"");  
	   
	    model.addAttribute("imageBase64QRCode", str);
		
	    resultMap.put("imageBase64QRCode", str);
		}
		return JSONArray.toJSONString(resultMap);
	}
	
	
	
	/**
	 * 咨询量详情页面
	 * @return
	 */
	@RequestMapping("/ToAssistantConsultInfo/{id}")
	public  String consultAssistantConsultInfo(@PathVariable String id,HttpServletRequest request){
		System.out.println("id:"+id);
		OaScbConsulter OaScbConsulter=new OaScbConsulter();
		/*赋值id*/
		if(id!=null &&!id.equals("")){
		OaScbConsulter.setId(Integer.parseInt(id));
		}
		 System.out.println("赋值后:"+OaScbConsulter.getId());
            
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("consulter", OaScbConsulter);
		
			
		
		map.put("index",0);/*从第一条数据开始*/
		map.put("pageSize", 1);/*显示的条数*/
		List<OaScbConsulter> consulterList=OaScbConsultAssistantQueryService.ConsultAssistantQueryFind(map);
		
		
		for (OaScbConsulter oaScbConsulter2 : consulterList) {
			System.out.println(oaScbConsulter2.getName());
			if(oaScbConsulter2.getConsultTeacherName()==null){
				oaScbConsulter2.setConsultTeacherName("暂无");
			}
			if(oaScbConsulter2.getFirstConsultTime()==null){
				oaScbConsulter2.setFirstConsultTimes("暂无");
			}
			if(oaScbConsulter2.getTelphone1()==null){
				oaScbConsulter2.setTelphone1("暂无");
			}
			if(oaScbConsulter2.getConsultLessonName()==null){
				oaScbConsulter2.setConsultLessonName("暂无");
			}
			if(oaScbConsulter2.getConsultwayName()==null){
				oaScbConsulter2.setConsultwayName("暂无");
			}
			if(oaScbConsulter2.getCity()==null||oaScbConsulter2.getCity().equals("地级市")){
				oaScbConsulter2.setCity("暂无");
			}
			if(oaScbConsulter2.getStatusName()==null){
				oaScbConsulter2.setStatusName("暂无");
			}
			if(oaScbConsulter2.getEducationName()==null){
				oaScbConsulter2.setEducationName("暂无");
			}
			if(oaScbConsulter2.getWechat()==null){/*微信/qq*/
				oaScbConsulter2.setWechat("暂无");
			}
			if(oaScbConsulter2.getProvince()==null||oaScbConsulter2.getProvince().equals("省份")){/*省份*/
				oaScbConsulter2.setProvince("暂无");
				oaScbConsulter2.setCity("暂无");
				oaScbConsulter2.setDistrict("暂无");
			}
			if(oaScbConsulter2.getUrgentTelpeople()==null ||oaScbConsulter2.getUrgentTelpeople().equals("")){/*紧急联系人*/
				oaScbConsulter2.setUrgentTelpeople("暂无");
			}
			if(oaScbConsulter2.getUngenTelphone()==null||oaScbConsulter2.getUngenTelphone().equals("")){/*紧急联系人电话*/
				oaScbConsulter2.setUngenTelphone("暂无");
			}
			if(oaScbConsulter2.getStatusName()==null||oaScbConsulter2.getStatusName().equals("")){/*社会状态*/
				oaScbConsulter2.setStatusName("暂无");
			}
			
			if(oaScbConsulter2.getSchoolName()==null||oaScbConsulter2.getSchoolName().equals("")){/*毕业院校*/
				oaScbConsulter2.setSchoolName("暂无");
			}
			
			if(oaScbConsulter2.getEducationName()==null||oaScbConsulter2.getEducationName().equals("")){/*学历*/
				oaScbConsulter2.setEducationName("暂无");
			}
			if(oaScbConsulter2.getSpecialty()==null||oaScbConsulter2.getSpecialty().equals("")){/*专业*/
				oaScbConsulter2.setSpecialty("暂无");
			}
			if (oaScbConsulter2.getConsultTeacherName()==null||oaScbConsulter2.getConsultTeacherName().equals("")) {/*咨询师*/
				oaScbConsulter2.setConsultTeacherName("暂无");
			}
			if(oaScbConsulter2.getConsultLessonName()==null||oaScbConsulter2.getConsultLessonName().equals("")){/*咨询课程*/
				oaScbConsulter2.setConsultLessonName("暂无");
			}
			if(oaScbConsulter2.getCome()==null){/*上门状态*/
				oaScbConsulter2.setCome(2);
			}
			if(oaScbConsulter2.getEnrollStatus()==null){/*报名状态*/
				oaScbConsulter2.setEnrollStatus(2);
			}
			if(oaScbConsulter2.getRankName()==null||oaScbConsulter2.getRankName().equals("")){/*咨询量等级*/
				oaScbConsulter2.setRankName("暂无");
			}
			if(oaScbConsulter2.getComments()==null||oaScbConsulter2.getComments().equals("")){/*备注/说明*/
				oaScbConsulter2.setComments("暂无");
			}
			request.setAttribute("name", oaScbConsulter2.getName());
			request.setAttribute("sex", oaScbConsulter2.getSex());
			request.setAttribute("age", oaScbConsulter2.getAge());
			request.setAttribute("telphone1", oaScbConsulter2.getTelphone1());
			request.setAttribute("wechat", oaScbConsulter2.getWechat());
			request.setAttribute("city", oaScbConsulter2.getCity());
			request.setAttribute("urgentTelpeople", oaScbConsulter2.getUrgentTelpeople());
			request.setAttribute("ungenTelphone", oaScbConsulter2.getUngenTelphone());
			request.setAttribute("statusName", oaScbConsulter2.getStatusName());
			request.setAttribute("schoolName", oaScbConsulter2.getSchoolName());
			request.setAttribute("educationName", oaScbConsulter2.getEducationName());
			request.setAttribute("specialty", oaScbConsulter2.getSpecialty());
			request.setAttribute("consultTeacherName", oaScbConsulter2.getConsultTeacherName());
			request.setAttribute("consultLessonName", oaScbConsulter2.getConsultLessonName());
			request.setAttribute("come", oaScbConsulter2.getCome());
			request.setAttribute("enrollStatus", oaScbConsulter2.getEnrollStatus());
			request.setAttribute("rankName", oaScbConsulter2.getRankName());
			request.setAttribute("invalid", oaScbConsulter2.getInvalid());
			request.setAttribute("comments", oaScbConsulter2.getComments());
		}
		
		
		return "marketDepartment/consultAssistantConsultInfo";
	}
	
	
	
	/**
	 * 回收
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/retrieveConsulter/{num}")
	@ResponseBody
	public Object retrieveConsulter(@PathVariable String num,String employee_id,String consultTeacherName) throws UnsupportedEncodingException{
		Integer sum=Integer.parseInt(num);
		//String emp_name=new String(consultTeacherName.getBytes("ISO-8859-1"),"UTF-8");
		String emp_name=consultTeacherName;
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setConsulter_id(sum);
		if(emp_name!=null){
			OaRlzybEmployee employee=new OaRlzybEmployee();
			employee.setEmp_name(emp_name);
			String name=OaScbOperationService.Emp_id(employee);
			Integer emp_id=Integer.parseInt(name);
			operation.setEmp_id(emp_id);
		}
		operation.setTime(new Date());
		operation.setContent("回收了");
		OaScbOperationService.Insertoperation(operation);
		boolean flag=oaScbRetrieveConsulterService.RetrieveConsulter(sum);
		
		return null;
	}
	
	/**
	 * 跳转报名审核
	 */
	@RequestMapping(value="/ToconsultAssistantEnrollCheck")
	public String ToconsultAssistantPraiseCheck(HttpServletRequest request){
		
		/*查询所有咨询师*/
		List<OaRlzybEmployee> ConsultTeacherList=oaScbConsultTeacherService.ConsultTeacherFind();
		
		/*课程信息*/
		List<OaScbConsultlesson> ConsultlessonFindList=OaScbSpecialtyService.ConsultlessonFind();
		
		
		request.setAttribute("ConsultTeacherList", ConsultTeacherList);/*查询所有咨询师*/
		request.setAttribute("SpecialtyList", ConsultlessonFindList);/*课程信息*/
		
		return "marketDepartment/consultAssistantEnrollCheck";
	}
	

	/**
	 * 报名审核-查询
	 * @throws ParseException 
	 */
	@RequestMapping(value="/consultAssistantEnrollCheckQuery")
	@ResponseBody
	public Object consultAssistantPraiseCheck(
			OaScbConsulter OaScbConsulter,
			String declareTimes,
			String index,
			String pageSizes) throws ParseException{
		if(index==null||index.equals("")){
			index="1";
		}
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}
		int pageSize=Integer.parseInt(pageSizes);/*每页显示数目*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date declareTimesDate=null;
		if(declareTimes!=null && !declareTimes.equals("")){
			declareTimesDate=sdf.parse(declareTimes);
		}
		OaScbConsulter.setDeclareTime(declareTimesDate);
		System.out.println("姓名:"+OaScbConsulter.getName());
		System.out.println("咨询师:"+OaScbConsulter.getConsultTeacher());
		System.out.println("报选课程:"+OaScbConsulter.getEnlistLesson());
		System.out.println("申报时间:"+OaScbConsulter.getDeclareTimes());
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("consulter", OaScbConsulter);
		
		int totalCount=OaScbConsultAssistantQueryService.consultAssistantEnrollCheckFindtotalCount(map);/*总记录数*/
		
		int pageCount=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;/*总页数*/
		
		
		map.put("index",(Integer.parseInt(index)-1)*pageSize);/*从第一条数据开始*/
		map.put("pageSize", pageSize);/*显示的条数*/

		List<OaScbConsulter> OaScbConsulterList=OaScbConsultAssistantQueryService.consultAssistantEnrollCheckFind(map);
		
		for (OaScbConsulter oaScbConsulter2 : OaScbConsulterList) {
			System.out.println(oaScbConsulter2.getPayMoney());
			
			if(oaScbConsulter2.getConsultTeacherName()==null){
				oaScbConsulter2.setConsultTeacherName("暂无");
			}
			if(oaScbConsulter2.getEnlistLessonName()==null){/*报选课程*/
				oaScbConsulter2.setEnlistLessonName("暂无");
			}
			if(oaScbConsulter2.getAllotClassName()==null){/*报选班级*/
				oaScbConsulter2.setAllotClassName("暂无");
			}
			
			if (oaScbConsulter2.getPayMoney()==null) {/*缴费金额*/
				oaScbConsulter2.setPayMoney("暂无");
			}
			if(oaScbConsulter2.getDeclareTime()!=null){/*申报时间*/
				oaScbConsulter2.setDeclareTimes(sdf.format(oaScbConsulter2.getDeclareTime()));	
			}else{
				oaScbConsulter2.setDeclareTimes("暂无");
			}
			if (oaScbConsulter2.getTelphone1()==null) {/*联系方式*/
				oaScbConsulter2.setTelphone1("暂无");
			}
			if(oaScbConsulter2.getUngenTelphone()==null||oaScbConsulter2.getUngenTelphone().equals("")){/*紧急联系人方式*/
				oaScbConsulter2.setUngenTelphone("暂无");
			}
			if(oaScbConsulter2.getEnrollTime()==null){/*报名时间*/
				oaScbConsulter2.setEnrollTimes("暂无");	
			}else{
				oaScbConsulter2.setEnrollTimes(sdf.format(oaScbConsulter2.getEnrollTime()));
			}
			if(oaScbConsulter2.getPayType()==null){/*缴费方式*/
				oaScbConsulter2.setPayType(0);
			}
			if(oaScbConsulter2.getPayTypeName()==null){/*缴费方式*/
				oaScbConsulter2.setPayTypeName("暂无");
			}
			
			
		}
		Map<String,Object> resultMap=new HashMap<String,Object>();
		resultMap.put("index", index);
		resultMap.put("pageCount", pageCount);
		resultMap.put("consulterList", OaScbConsulterList);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pageSize", pageSize);
		
		return JSONArray.toJSONString(resultMap);
	}


	/**
	 * 报名审核-审核
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/PraiseCheckAuditingPass")
	@ResponseBody
	public Object consultAssistantPraiseCheckAuditingPass(
			@RequestParam(required=false) String id,
			
			@RequestParam(required=false) String[] s,
			String employee_id
			){
		if(s!=null&&s.length!=0){
			for (int i = 0; i < s.length; i++) {
				boolean flag=oaScbRetrieveConsulterService.PraiseCheckAuditing(Integer.parseInt(s[i].substring(0, s[i].indexOf("|"))));
				OaScbOperation operation=new OaScbOperation();
				operation.setEmployee_id(Integer.parseInt(employee_id));
				operation.setTime(new Date());
				operation.setConsulter_id(Integer.parseInt(s[i].substring(0, s[i].indexOf("|"))));
				operation.setContent("审核通过");
				OaScbOperationService.Insertoperation(operation);
				if(!flag){
					return "allfalse";
				}
			}
			return "true";
		}else if(s==null&&id!=null){
			boolean flag=oaScbRetrieveConsulterService.PraiseCheckAuditing(Integer.parseInt(id));
			OaScbOperation operation=new OaScbOperation();
			operation.setEmployee_id(Integer.parseInt(employee_id));
			operation.setTime(new Date());
			operation.setConsulter_id(Integer.parseInt(id));
			operation.setContent("审核通过");
			OaScbOperationService.Insertoperation(operation);
			if(flag){
				return "true";
			}else{
				return null;
			}	
		}
			return "false";
		
		
	}
	/**
	 * 报名审核-暂缓
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/PraiseCheckAuditingNoPass")
	@ResponseBody
	public Object consultAssistantPraiseCheckAuditingNopass(
			@RequestParam(required=false) String id,
			@RequestParam(required=false) String[] s,
			String employee_id
			){
		if(s!=null&&s.length!=0){
			for (int i = 0; i < s.length; i++) {
				boolean flag=oaScbRetrieveConsulterService.PraiseCheckAuditingNopass(Integer.parseInt(s[i].substring(0, s[i].indexOf("|"))));
				OaScbOperation operation=new OaScbOperation();
				operation.setEmployee_id(Integer.parseInt(employee_id));
				operation.setTime(new Date());
				operation.setConsulter_id(Integer.parseInt(s[i].substring(0, s[i].indexOf("|"))));
				operation.setContent("审核暂缓");
				OaScbOperationService.Insertoperation(operation);
				if(!flag){
					return "allfalse";
				}
			}
			return "true";
		}else if(s==null&& id!=null){
				boolean flag=oaScbRetrieveConsulterService.PraiseCheckAuditingNopass(Integer.parseInt(id));
				OaScbOperation operation=new OaScbOperation();
				operation.setEmployee_id(Integer.parseInt(employee_id));
				operation.setTime(new Date());
				operation.setConsulter_id(Integer.parseInt(id));
				operation.setContent("审核暂缓");
				OaScbOperationService.Insertoperation(operation);
					if(flag){
						return "true";
					}else{
						return "false";
					}
		}
		return "false";
		
	}
	
	
	/**
	 * 跳转分发咨询量
	 */
	@RequestMapping(value="/ToHandout")
	public String ToHandout(HttpServletRequest request){
		
		/*课程信息*/
		List<OaScbConsultlesson> ConsultlessonFindList=OaScbSpecialtyService.ConsultlessonFind();

		/*查询所有咨询量状态*/
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();

		/*咨询方式*/
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();
		/*查询所有咨询师*/
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService.ConsultTeacherFind();
		
		
		request.setAttribute("SpecialtyList", ConsultlessonFindList);
		request.setAttribute("ConsultstatusList", consultStatusList);
		request.setAttribute("ConsultwayLsit",consultWayList);
		request.setAttribute("ConsultTeacherList", empList);	/*返回所有咨询师*/

		return "marketDepartment/consultAssistantHandout";
	}


	/**
	 * 分发咨询量查询
	 */
	@RequestMapping(value="/HandoutFind")
	@ResponseBody
	public Object HandoutFind(OaScbConsulter OaScbConsulter,String index,String pageSizes  /*每页显示的条数*/ ){
		System.out.println("咨询量分类"+OaScbConsulter.getType());
		if(index==null||index.equals("")){
			index="1";
		}
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}
		int pageSize=Integer.parseInt(pageSizes);/*每页显示数目*/
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("consulter", OaScbConsulter);
		
		int totalCount=OaScbConsultAssistantQueryService.HandoutInfoFindtotalCount(map);/*总记录数*/
		
		int pageCount=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;/*总页数*/
		
		
		map.put("index",(Integer.parseInt(index)-1)*pageSize);/*从第一条数据开始*/
		map.put("pageSize", pageSize);/*显示的条数*/
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<OaScbConsulter> HandoutInfoFindList=OaScbConsultAssistantQueryService.HandoutInfoFind(map);
		
		for (OaScbConsulter oaScbConsulter2 : HandoutInfoFindList) {
			/*System.out.println(oaScbConsulter2.getName());*/
			if(oaScbConsulter2.getAllotTime()!=null){
				oaScbConsulter2.setAllotTimes(sdf.format(oaScbConsulter2.getAllotTime())); /*Date转String*/
			}else{
				oaScbConsulter2.setAllotTimes("暂无");
			}
			if(oaScbConsulter2.getTelphone1()==null){
				oaScbConsulter2.setTelphone1("暂无");
			}
			if(oaScbConsulter2.getName()==null){
				oaScbConsulter2.setName("暂无");
			}
			if(oaScbConsulter2.getSex()==null){
				oaScbConsulter2.setSex(0);
			}
			if(oaScbConsulter2.getCity()==null){
				oaScbConsulter2.setCity("暂无");
			}
			if(oaScbConsulter2.getEducationName()==null){
				oaScbConsulter2.setEducationName("暂无");
			}
			if(oaScbConsulter2.getConsultwayName()==null){
				oaScbConsulter2.setConsultwayName("暂无");
			}
			if(oaScbConsulter2.getStatusName()==null){
				oaScbConsulter2.setStatusName("暂无");
			}	
		}
		Map<String,Object> resultMap=new HashMap<String,Object>();
		resultMap.put("index", index);
		resultMap.put("pageCount", pageCount);
		resultMap.put("consulterList", HandoutInfoFindList);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pageSize", pageSize);
		return JSONArray.toJSONString(resultMap);
	}

	
	/**
	 * 分发咨询量-分发
	 */
	@RequestMapping(value="/Todistribute")
	@ResponseBody
	public Object Todistribute(
			@RequestParam(required=false) String consultTeacherid,
			@RequestParam(required=false) String id,
			@RequestParam(required=false) String[] s,
			String employee_id,
			HttpServletRequest request
			){
		
		
		if(consultTeacherid!=null&&consultTeacherid.equals("0")){
			return "0";
		}else if(s!=null && consultTeacherid!=null){/*批量分发*/
			for (int i = 0; i < s.length; i++) {
				
				
				boolean flag=oaScbRetrieveConsulterService.Todistribute(Integer.parseInt(consultTeacherid),Integer.parseInt(s[i]),new Date());
				OaScbOperation operation=new OaScbOperation();
				operation.setEmployee_id(Integer.parseInt(employee_id));
				operation.setTime(new Date());
				operation.setConsulter_id(Integer.parseInt(s[i]));
				operation.setEmp_id(Integer.parseInt(consultTeacherid));
				operation.setContent("分发给了");
				OaScbOperationService.Insertoperation(operation);
				if(!flag){
					return "false";
				}
				String consultWayName=oaScbRetrieveConsulterService.FindconsultWayName(Integer.parseInt(s[i]));
				if(consultWayName!=null){
				if(consultWayName.equals("口碑")){
					boolean flagTopraise=oaScbRetrieveConsulterService.UpdatePraiseInto(Integer.parseInt(consultTeacherid), Integer.parseInt(s[i]));
					if(!flagTopraise){
						return "口碑更新错误！";
					}
				}
				}
			}
			return "true";
			
		}else if(consultTeacherid!=null&& id!=null){/*单个分发*/
			boolean flag=oaScbRetrieveConsulterService.Todistribute(Integer.parseInt(consultTeacherid),Integer.parseInt(id),new Date());
			OaScbOperation operation=new OaScbOperation();
			operation.setEmployee_id(Integer.parseInt(employee_id));
			operation.setTime(new Date());
			operation.setConsulter_id(Integer.parseInt(id));
			operation.setEmp_id(Integer.parseInt(consultTeacherid));
			operation.setContent("分发给了");
			OaScbOperationService.Insertoperation(operation);
			if(!flag){
				return "false";
			}	
			String consultWayName=oaScbRetrieveConsulterService.FindconsultWayName(Integer.parseInt(id));
			
			if(consultWayName.equals("口碑")){
				boolean flagTopraise=oaScbRetrieveConsulterService.UpdatePraiseInto(Integer.parseInt(consultTeacherid), Integer.parseInt(id));
				if(!flagTopraise){
					return "口碑更新错误！";
				}
			}
		}
		
			return "false";		
	}

	
	/**
	 * 跳转编辑页面
	 */
	@RequestMapping(value="/Torevise")
	public String Torevise(HttpServletRequest request,String id){
		
		/*信息来源*/
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();

		/*咨询方式*/
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();

		/*咨询量等级*/
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();

		/*查询学历信息*/
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();

		/*查询所有咨询量状态*/
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();

		/*课程信息*/
		List<OaScbConsultlesson> ConsultlessonFindList=OaScbSpecialtyService.ConsultlessonFind();

		/*媒体名称*/
		List<OaScbMedianame> MedianameList= OaScbMedianameService.selectMediaNameList();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		OaScbConsulter OaScbConsulterinfo= OaScbConsultAssistantQueryService.AssistantReviseFind(Integer.parseInt(id));
		OaScbConsulterinfo.setId(Integer.parseInt(id));
		if(OaScbConsulterinfo.getFirstComeTime()!=null){
		OaScbConsulterinfo.setFirstComeTimes(sdf.format(OaScbConsulterinfo.getFirstComeTime()));/*首次上门日期*/
		}
		if(OaScbConsulterinfo.getFirstConsultTime()!=null){
		OaScbConsulterinfo.setFirstConsultTimes(sdf.format(OaScbConsulterinfo.getFirstConsultTime()));/*首次资讯日期*/
		}
		if(OaScbConsulterinfo.getConsultTeacherName()==null||OaScbConsulterinfo.getConsultTeacherName().equals("")){
			OaScbConsulterinfo.setConsultTeacherName("暂未分配咨询师");
		}
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultwayLsit", consultWayList);
		request.setAttribute("RanktypeList", rankList);
		request.setAttribute("EducationList", EducationList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("SpecialtyList", ConsultlessonFindList);/*咨询课程*/
		request.setAttribute("mediaNameList", MedianameList);	/*媒体名称*/
		request.setAttribute("consulter", OaScbConsulterinfo);
		request.setAttribute("consultWay", OaScbConsulterinfo.getConsultWay());/*咨询方式*/
		
		request.setAttribute("type", OaScbConsulterinfo.getType());/*咨询量分类*/
		request.setAttribute("rank", OaScbConsulterinfo.getRank());/*咨询量等级*/
		request.setAttribute("name", OaScbConsulterinfo.getName());/*姓名*/
		request.setAttribute("sex", OaScbConsulterinfo.getSex());/*性别*/
		request.setAttribute("education", OaScbConsulterinfo.getEducation());/*学历*/
		request.setAttribute("status", OaScbConsulterinfo.getStatus());/*状态*/
		request.setAttribute("consultLesson", OaScbConsulterinfo.getConsultLesson());/*咨询课程*/
		request.setAttribute("mediaName", OaScbConsulterinfo.getMediaName());/*媒体名称*/
		
		return "marketDepartment/consultAssistantRevise";
	}
	/**
	 * 咨询部主管跳转编辑页面
	 */
	@RequestMapping(value="/ToreviseZG")
	public String ToreviseZG(HttpServletRequest request,String id){
		
		/*信息来源*/
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();

		/*咨询方式*/
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();

		/*咨询量等级*/
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();

		/*查询学历信息*/
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();

		/*查询所有咨询量状态*/
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();

		/*课程信息*/
		List<OaScbConsultlesson> ConsultlessonFindList=OaScbSpecialtyService.ConsultlessonFind();

		/*媒体名称*/
		List<OaScbMedianame> MedianameList= OaScbMedianameService.selectMediaNameList();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		OaScbConsulter OaScbConsulterinfo= OaScbConsultAssistantQueryService.AssistantReviseFind(Integer.parseInt(id));
		OaScbConsulterinfo.setId(Integer.parseInt(id));
		if(OaScbConsulterinfo.getFirstComeTime()!=null){
		OaScbConsulterinfo.setFirstComeTimes(sdf.format(OaScbConsulterinfo.getFirstComeTime()));/*首次上门日期*/
		}
		if(OaScbConsulterinfo.getFirstConsultTime()!=null){
		OaScbConsulterinfo.setFirstConsultTimes(sdf.format(OaScbConsulterinfo.getFirstConsultTime()));/*首次资讯日期*/
		}
		if(OaScbConsulterinfo.getConsultTeacherName()==null||OaScbConsulterinfo.getConsultTeacherName().equals("")){
			OaScbConsulterinfo.setConsultTeacherName("暂未分配咨询师");
		}
		List<OaRlzybEmployee> employees=OaScbMarketService.getEmployee();
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultwayLsit", consultWayList);
		request.setAttribute("RanktypeList", rankList);
		request.setAttribute("EducationList", EducationList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("SpecialtyList", ConsultlessonFindList);/*咨询课程*/
		request.setAttribute("mediaNameList", MedianameList);	/*媒体名称*/
		request.setAttribute("consulter", OaScbConsulterinfo);
		request.setAttribute("consultWay", OaScbConsulterinfo.getConsultWay());/*咨询方式*/
		
		request.setAttribute("type", OaScbConsulterinfo.getType());/*咨询量分类*/
		request.setAttribute("rank", OaScbConsulterinfo.getRank());/*咨询量等级*/
		request.setAttribute("name", OaScbConsulterinfo.getName());/*姓名*/
		request.setAttribute("sex", OaScbConsulterinfo.getSex());/*性别*/
		request.setAttribute("education", OaScbConsulterinfo.getEducation());/*学历*/
		request.setAttribute("status", OaScbConsulterinfo.getStatus());/*状态*/
		request.setAttribute("consultLesson", OaScbConsulterinfo.getConsultLesson());/*咨询课程*/
		request.setAttribute("mediaName", OaScbConsulterinfo.getMediaName());/*媒体名称*/
		request.setAttribute("employeesList", employees);
		
		return "marketDepartment/consultAssistantReviseZG";
	}

	/**
	 * 渠道部跳转编辑页面
	 */
	@RequestMapping(value="/ToreviseQD")
	public String ToreviseQD(HttpServletRequest request,String id){
		
		/*信息来源*/
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();

		/*咨询方式*/
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();

		/*咨询量等级*/
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();

		/*查询学历信息*/
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();

		/*查询所有咨询量状态*/
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();

		/*课程信息*/
		List<OaScbConsultlesson> ConsultlessonFindList=OaScbSpecialtyService.ConsultlessonFind();

		/*媒体名称*/
		List<OaScbMedianame> MedianameList= OaScbMedianameService.selectMediaNameList();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		OaScbConsulter OaScbConsulterinfo= OaScbConsultAssistantQueryService.AssistantReviseFind(Integer.parseInt(id));
		OaScbConsulterinfo.setId(Integer.parseInt(id));
		if(OaScbConsulterinfo.getFirstComeTime()!=null){
		OaScbConsulterinfo.setFirstComeTimes(sdf.format(OaScbConsulterinfo.getFirstComeTime()));/*首次上门日期*/
		}
		if(OaScbConsulterinfo.getFirstConsultTime()!=null){
		OaScbConsulterinfo.setFirstConsultTimes(sdf.format(OaScbConsulterinfo.getFirstConsultTime()));/*首次资讯日期*/
		}
		if(OaScbConsulterinfo.getConsultTeacherName()==null||OaScbConsulterinfo.getConsultTeacherName().equals("")){
			OaScbConsulterinfo.setConsultTeacherName("暂未分配咨询师");
		}
		List<OaRlzybEmployee> employees=OaScbMarketService.getEmployee();
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultwayLsit", consultWayList);
		request.setAttribute("RanktypeList", rankList);
		request.setAttribute("EducationList", EducationList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("SpecialtyList", ConsultlessonFindList);/*咨询课程*/
		request.setAttribute("mediaNameList", MedianameList);	/*媒体名称*/
		request.setAttribute("consulter", OaScbConsulterinfo);
		request.setAttribute("consultWay", OaScbConsulterinfo.getConsultWay());/*咨询方式*/
		
		request.setAttribute("type", OaScbConsulterinfo.getType());/*咨询量分类*/
		request.setAttribute("rank", OaScbConsulterinfo.getRank());/*咨询量等级*/
		request.setAttribute("name", OaScbConsulterinfo.getName());/*姓名*/
		request.setAttribute("sex", OaScbConsulterinfo.getSex());/*性别*/
		request.setAttribute("education", OaScbConsulterinfo.getEducation());/*学历*/
		request.setAttribute("status", OaScbConsulterinfo.getStatus());/*状态*/
		request.setAttribute("consultLesson", OaScbConsulterinfo.getConsultLesson());/*咨询课程*/
		request.setAttribute("mediaName", OaScbConsulterinfo.getMediaName());/*媒体名称*/
		request.setAttribute("employeesList", employees);
		return "marketDepartment/consultAssistantReviseQD";
	}


	/**
	 * 编辑页面-保存
	 * @throws ParseException 
	 */
	@RequestMapping(value="/Revise",method=RequestMethod.POST)
	public String Revise(HttpServletRequest request,OaScbConsulter OaScbConsulter,String employee_id) throws ParseException{

		System.out.println(OaScbConsulter.getAge());
		System.out.println("修改的姓名："+OaScbConsulter.getName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/*咨询量表对象*/
		OaScbVisit OaScbVisit=new OaScbVisit();
		OaScbVisit.setConsultId(OaScbConsulter.getId());
		OaScbVisit.setReturnvisitRecord(OaScbConsulter.getComments());/*回访记录*/
		
		
		/*回访表对象时间 --赋值*/
		if(OaScbConsulter.getNextvisitTimes()!=null&&!OaScbConsulter.getNextvisitTimes().equals("")){
		OaScbVisit.setNextvisitTime(sdf.parse(OaScbConsulter.getNextvisitTimes()));/*下次回访时间*/
		}
		if(OaScbConsulter.getReturnvisitTimes()!=null&&!OaScbConsulter.getReturnvisitTimes().equals("")){
		OaScbVisit.setReturnvisitTime(sdf.parse(OaScbConsulter.getReturnvisitTimes()));/*本次回访时间*/
		}
		
		/*咨询量表时间赋值*/
		if(OaScbConsulter.getFirstComeTimes()!=null&& !OaScbConsulter.getFirstComeTimes().equals("")){
		OaScbConsulter.setFirstComeTime(sdf.parse(OaScbConsulter.getFirstComeTimes()));
		}
		if(OaScbConsulter.getFirstConsultTimes()!=null&& !OaScbConsulter.getFirstConsultTimes().equals("")){
			OaScbConsulter.setFirstConsultTime(sdf.parse(OaScbConsulter.getFirstConsultTimes()));
		}
		
		String id=OaScbConsulter.getId().toString();
		boolean flag=OaScbConsultAssistantAddService.AssistantReviseEditor(OaScbConsulter);
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setTime(new Date());
		operation.setConsulter_id(Integer.parseInt(id));
		operation.setContent("修改了");
		OaScbOperationService.Insertoperation(operation);
		OaScbConsultAssistantAddService.OaScbVisitAdd(OaScbVisit);
			return "marketDepartment/consultAssistantQuery";
		
			
		
	}
	/**
	 * 主管编辑页面-保存
	 * @throws ParseException 
	 */
	@RequestMapping(value="/ReviseZG",method=RequestMethod.POST)
	public String ReviseZG(HttpServletRequest request,OaScbConsulter OaScbConsulter,String employee_id) throws ParseException{

		System.out.println(OaScbConsulter.getAge());
		System.out.println("修改的姓名："+OaScbConsulter.getName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/*咨询量表对象*/
		OaScbVisit OaScbVisit=new OaScbVisit();
		OaScbVisit.setConsultId(OaScbConsulter.getId());
		OaScbVisit.setReturnvisitRecord(OaScbConsulter.getComments());/*回访记录*/
		
		
		/*回访表对象时间 --赋值*/
		if(OaScbConsulter.getNextvisitTimes()!=null&&!OaScbConsulter.getNextvisitTimes().equals("")){
		OaScbVisit.setNextvisitTime(sdf.parse(OaScbConsulter.getNextvisitTimes()));/*下次回访时间*/
		}
		if(OaScbConsulter.getReturnvisitTimes()!=null&&!OaScbConsulter.getReturnvisitTimes().equals("")){
		OaScbVisit.setReturnvisitTime(sdf.parse(OaScbConsulter.getReturnvisitTimes()));/*本次回访时间*/
		}
		
		/*咨询量表时间赋值*/
		if(OaScbConsulter.getFirstComeTimes()!=null&& !OaScbConsulter.getFirstComeTimes().equals("")){
		OaScbConsulter.setFirstComeTime(sdf.parse(OaScbConsulter.getFirstComeTimes()));
		}
		if(OaScbConsulter.getFirstConsultTimes()!=null&& !OaScbConsulter.getFirstConsultTimes().equals("")){
			OaScbConsulter.setFirstConsultTime(sdf.parse(OaScbConsulter.getFirstConsultTimes()));
		}
		
		String id=OaScbConsulter.getId().toString();
		boolean flag=OaScbConsultAssistantAddService.AssistantReviseEditor(OaScbConsulter);
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setTime(new Date());
		operation.setConsulter_id(Integer.parseInt(id));
		operation.setContent("修改了");
		OaScbOperationService.Insertoperation(operation);
		OaScbConsultAssistantAddService.OaScbVisitAdd(OaScbVisit);
			return "redirect:/director/consultDirectorQuery";
		
			
		
	}
	/**
	 * 咨询师编辑页面-保存
	 * @throws ParseException 
	 */
	@RequestMapping(value="/ReviseZXS",method=RequestMethod.POST)
	public String ReviseZXS(HttpServletRequest request,OaScbConsulter OaScbConsulter,String employee_id) throws ParseException{

		System.out.println(OaScbConsulter.getAge());
		System.out.println("修改的姓名："+OaScbConsulter.getName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/*咨询量表对象*/
		OaScbVisit OaScbVisit=new OaScbVisit();
		OaScbVisit.setConsultId(OaScbConsulter.getId());
		OaScbVisit.setReturnvisitRecord(OaScbConsulter.getComments());/*回访记录*/
		
		
		/*回访表对象时间 --赋值*/
		if(OaScbConsulter.getNextvisitTimes()!=null&&!OaScbConsulter.getNextvisitTimes().equals("")){
		OaScbVisit.setNextvisitTime(sdf.parse(OaScbConsulter.getNextvisitTimes()));/*下次回访时间*/
		}
		if(OaScbConsulter.getReturnvisitTimes()!=null&&!OaScbConsulter.getReturnvisitTimes().equals("")){
		OaScbVisit.setReturnvisitTime(sdf.parse(OaScbConsulter.getReturnvisitTimes()));/*本次回访时间*/
		}
		
		/*咨询量表时间赋值*/
		if(OaScbConsulter.getFirstComeTimes()!=null&& !OaScbConsulter.getFirstComeTimes().equals("")){
		OaScbConsulter.setFirstComeTime(sdf.parse(OaScbConsulter.getFirstComeTimes()));
		}
		if(OaScbConsulter.getFirstConsultTimes()!=null&& !OaScbConsulter.getFirstConsultTimes().equals("")){
			OaScbConsulter.setFirstConsultTime(sdf.parse(OaScbConsulter.getFirstConsultTimes()));
		}
		
		String id=OaScbConsulter.getId().toString();
		boolean flag=OaScbConsultAssistantAddService.AssistantReviseEditor(OaScbConsulter);
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setTime(new Date());
		operation.setConsulter_id(Integer.parseInt(id));
		operation.setContent("修改了");
		OaScbOperationService.Insertoperation(operation);
		OaScbConsultAssistantAddService.OaScbVisitAdd(OaScbVisit);
			return "redirect:/teacher/consultTeacherQuery";
		
			
		
	}
	/**
	 *咨询师跳转编辑页面
	 */
	@RequestMapping(value="/ToreviseZXS")
	public String ToreviseZXS(HttpServletRequest request,String id){
		
		/*信息来源*/
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService.selectInfoSource();

		/*咨询方式*/
		List<OaScbConsultway> consultWayList = oaScbConsultwayService.selectConsultWay();

		/*咨询量等级*/
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();

		/*查询学历信息*/
		List<OaScbEducation> EducationList = oaScbEducationService.selectEducationList();

		/*查询所有咨询量状态*/
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService.selectConsultstatusList();

		/*课程信息*/
		List<OaScbConsultlesson> ConsultlessonFindList=OaScbSpecialtyService.ConsultlessonFind();

		/*媒体名称*/
		List<OaScbMedianame> MedianameList= OaScbMedianameService.selectMediaNameList();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		OaScbConsulter OaScbConsulterinfo= OaScbConsultAssistantQueryService.AssistantReviseFind(Integer.parseInt(id));
		OaScbConsulterinfo.setId(Integer.parseInt(id));
		if(OaScbConsulterinfo.getFirstComeTime()!=null){
		OaScbConsulterinfo.setFirstComeTimes(sdf.format(OaScbConsulterinfo.getFirstComeTime()));/*首次上门日期*/
		}
		if(OaScbConsulterinfo.getFirstConsultTime()!=null){
		OaScbConsulterinfo.setFirstConsultTimes(sdf.format(OaScbConsulterinfo.getFirstConsultTime()));/*首次资讯日期*/
		}
		if(OaScbConsulterinfo.getConsultTeacherName()==null||OaScbConsulterinfo.getConsultTeacherName().equals("")){
			OaScbConsulterinfo.setConsultTeacherName("暂未分配咨询师");
		}
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultwayLsit", consultWayList);
		request.setAttribute("RanktypeList", rankList);
		request.setAttribute("EducationList", EducationList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("SpecialtyList", ConsultlessonFindList);/*咨询课程*/
		request.setAttribute("mediaNameList", MedianameList);	/*媒体名称*/
		request.setAttribute("consulter", OaScbConsulterinfo);
		request.setAttribute("consultWay", OaScbConsulterinfo.getConsultWay());/*咨询方式*/
		
		request.setAttribute("type", OaScbConsulterinfo.getType());/*咨询量分类*/
		request.setAttribute("rank", OaScbConsulterinfo.getRank());/*咨询量等级*/
		request.setAttribute("name", OaScbConsulterinfo.getName());/*姓名*/
		request.setAttribute("sex", OaScbConsulterinfo.getSex());/*性别*/
		request.setAttribute("education", OaScbConsulterinfo.getEducation());/*学历*/
		request.setAttribute("status", OaScbConsulterinfo.getStatus());/*状态*/
		request.setAttribute("consultLesson", OaScbConsulterinfo.getConsultLesson());/*咨询课程*/
		request.setAttribute("mediaName", OaScbConsulterinfo.getMediaName());/*媒体名称*/
		
		return "marketDepartment/consultAssistantReviseZXS";
	}

	/**
	 * 渠道编辑页面-保存
	 * @throws ParseException 
	 */
	@RequestMapping(value="/ReviseQD",method=RequestMethod.POST)
	public String ReviseQD(HttpServletRequest request,OaScbConsulter OaScbConsulter,String employee_id) throws ParseException{

		System.out.println(OaScbConsulter.getAge());
		System.out.println("修改的姓名："+OaScbConsulter.getName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/*咨询量表对象*/
		OaScbVisit OaScbVisit=new OaScbVisit();
		OaScbVisit.setConsultId(OaScbConsulter.getId());
		OaScbVisit.setReturnvisitRecord(OaScbConsulter.getComments());/*回访记录*/
		
		
		/*回访表对象时间 --赋值*/
		if(OaScbConsulter.getNextvisitTimes()!=null&&!OaScbConsulter.getNextvisitTimes().equals("")){
		OaScbVisit.setNextvisitTime(sdf.parse(OaScbConsulter.getNextvisitTimes()));/*下次回访时间*/
		}
		if(OaScbConsulter.getReturnvisitTimes()!=null&&!OaScbConsulter.getReturnvisitTimes().equals("")){
		OaScbVisit.setReturnvisitTime(sdf.parse(OaScbConsulter.getReturnvisitTimes()));/*本次回访时间*/
		}
		
		/*咨询量表时间赋值*/
		if(OaScbConsulter.getFirstComeTimes()!=null&& !OaScbConsulter.getFirstComeTimes().equals("")){
		OaScbConsulter.setFirstComeTime(sdf.parse(OaScbConsulter.getFirstComeTimes()));
		}
		if(OaScbConsulter.getFirstConsultTimes()!=null&& !OaScbConsulter.getFirstConsultTimes().equals("")){
			OaScbConsulter.setFirstConsultTime(sdf.parse(OaScbConsulter.getFirstConsultTimes()));
		}
		
		String id=OaScbConsulter.getId().toString();
		boolean flag=OaScbConsultAssistantAddService.AssistantReviseEditor(OaScbConsulter);
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setTime(new Date());
		operation.setConsulter_id(Integer.parseInt(id));
		operation.setContent("修改了");
		OaScbOperationService.Insertoperation(operation);
		OaScbConsultAssistantAddService.OaScbVisitAdd(OaScbVisit);
			return "redirect:/market/amarketQuery";
		
			
		
	}
	

	/**
	 * 跟踪-回访表查询
	 */
	@RequestMapping(value="/AssistantOaScbVisitFind")
	@ResponseBody
	public Object AssistantOaScbVisitFind(String id,Integer stuId){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		List<OaScbVisit> OaScbVisit=OaScbConsultAssistantQueryService.AssistantOaScbVisitFind(Integer.parseInt(id),stuId);
		
		
		OaScbConsulter OaScbConsulter=new OaScbConsulter();
		OaScbConsulter.setId(Integer.parseInt(id));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("consulter", OaScbConsulter);
		map.put("index", 0);
		map.put("pageSize", 1);
		List<OaScbConsulter> OaScbConsulterInfoList=OaScbConsultAssistantQueryService.ConsultAssistantQueryFind(map);
		
		String consultTeacherName="";
		if(OaScbConsulterInfoList.size()==1){
			for (OaScbConsulter oaScbConsulter2 : OaScbConsulterInfoList) {
				if(oaScbConsulter2.getConsultTeacherName()==null){
					consultTeacherName="暂未分配咨询师";
				}else{
					consultTeacherName=oaScbConsulter2.getConsultTeacherName();
				}
			}
		}else{
			consultTeacherName="暂未分配咨询师";
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
	 * 删除
	 */
	@RequestMapping(value="/DisplayNone")
	@ResponseBody
	public Object DisplayNone(String id){
		boolean flag=OaScbConsultAssistantAddService.displayNone(Integer.parseInt(id));
		if(flag){
			return "删除成功";
		}else{
			return "删除失败！";
		}
		
	}

	
	/**
	 * 跳转日报表
	 * @throws ParseException 
	 */
	@RequestMapping("/ToAssistantDaySheet")
	public String ToAssistantDaySheet(HttpServletRequest request) {
	
		/*查询所有咨询师*/
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService.ConsultTeacherFind();
		
		request.setAttribute("ConsultTeacherList", empList);/*返回所有咨询师*/
		
		return "marketDepartment/consultAssistantDaySheet";
	}
	
	
	/**
	 * 日报表查询
	 * @throws ParseException 
	 */
	@RequestMapping(value="/AssistantDaySheetFind")
	@ResponseBody
	public Object AssistantDaySheetFind(
			HttpServletRequest request,
			OaScbConsulter OaScbConsulter,
			String show
			) throws ParseException{
		List<Map<String, Object>> DaySheetList=new ArrayList<>();
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd");
		
		int consultTeacher= OaScbConsulter.getConsultTeacher();
		String firstConsultTimes=OaScbConsulter.getFirstConsultTimes();
		
		String yearTime="";/*年*/
		String monthTime="";/*月*/
		String dayTime="";/*日*/
		int number=1;/*定义for循环的次数默认为1*/
		Date firstConsultTime=null;
		if(firstConsultTimes.equals("")){
			Date date=new Date();
			SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
			/*获得年*/
			 yearTime +=yyyy.format(date);
			System.out.println("年（year）："+yearTime);
			
			SimpleDateFormat MM = new SimpleDateFormat("MM");
			/*获得月*/
			 monthTime +=MM.format(date);
			System.out.println("月（month）："+monthTime);
			
			SimpleDateFormat dd = new SimpleDateFormat("dd");
			/*获得日*/
			 dayTime +=dd.format(date);
			System.out.println("日（day）："+dayTime);
			
			/*转换日*/
			number=Integer.parseInt(dayTime);
			
		}else{
			firstConsultTime=dateTime.parse(firstConsultTimes);
		}
		
		
		for (int i = 1; i <= number; i++) {
			Map<String,Object> DaySheetmap=new HashMap<String,Object>();
			if(firstConsultTimes.equals("")){
				
				firstConsultTimes +=yearTime+"-";/*拼接年*/
				firstConsultTimes +=monthTime+"-";/*拼接月*/
				
				String dayOneStr=i+"";/*定义每一天的String类型*/
				firstConsultTimes +=dayOneStr; /*拼接日*/
				
				firstConsultTime=dateTime.parse(firstConsultTimes);/*将拼接后的String时间转换为Date*/
			}
			
			/*电话咨询量*/
			int phoneControllers= OaScbConsultAssistantSheetService.phoneControllers(firstConsultTime,consultTeacher);
			float phoneControllersfloat=phoneControllers;
			/*System.out.println("咨询日期:"+dates+"  电话咨询量:"+phoneControllersfloat);*/
			
			/*电话上门量*/
			int phoneControllersCome=OaScbConsultAssistantSheetService.phoneControllersCome(firstConsultTime,consultTeacher);
			float phoneControllersComefloat=phoneControllersCome;
			/*System.out.println("电话上门量："+phoneControllersCome);*/
		
			/*日报——直接上门量*/
			int ControllersDirectCome=OaScbConsultAssistantSheetService.ControllersDirectCome(firstConsultTime,consultTeacher);
			float ControllersDirectComefloat=ControllersDirectCome;
			/*System.out.println("直接上门量"+ControllersDirectCome);*/
			
			/*日报——总报名量*/
			int Allenrolls=OaScbConsultAssistantSheetService.Allenrolls(firstConsultTime,consultTeacher);
			float Allenrollsfloat=Allenrolls;
			/*System.out.println("总报名量"+Allenrolls);*/
			
			/*日报——总咨询量*/
			int AllControllers=OaScbConsultAssistantSheetService.AllControllers(firstConsultTime,consultTeacher);
			float AllControllersfloat=AllControllers;
			/*System.out.println("总咨询量:"+AllControllers);*/
			
			/*日报——总上门量*/
			int AllComes=OaScbConsultAssistantSheetService.AllComes(firstConsultTime,consultTeacher);
			float AllComesfloat=AllComes;
			/*System.out.println("总上门量:"+AllComes);*/
			
			/*日报——总定金量*/
			int AllpayStatus=OaScbConsultAssistantSheetService.AllpayStatus(firstConsultTime,consultTeacher);
			
			/*DecimalFormat decimalFormat=new DecimalFormat(".00");*///构造方法的字符格式这里如果小数不足2位,会以0补足
			NumberFormat num = NumberFormat.getPercentInstance();/*转换百分比*/
			num.setMaximumIntegerDigits(3); 
			num.setMaximumFractionDigits(2);
			
			
			/*电转率*/
			String phoneToComePercentums="";
			if(phoneControllers==0){
				 phoneToComePercentums="暂无";
			}else{
				float  phoneToComePercentum=phoneControllersComefloat/phoneControllersfloat;
				 phoneToComePercentums=num.format(phoneToComePercentum);
				/*System.out.println("电转率:"+phoneToComePercentums);*/
			}
			
			/*面转率*/
			String ComeToenrollPercentums="";
			if(phoneControllersCome==0 && ControllersDirectCome==0){
				 ComeToenrollPercentums="暂无";
			}else{
				float ComeToenrollPercentum=Allenrollsfloat/(ControllersDirectComefloat+phoneControllersComefloat);
				 ComeToenrollPercentums=num.format(ComeToenrollPercentum);
				/*System.out.println("面转率:"+ComeToenrollPercentums);*/
			}
			
			/*总转率*/
			String ControllerToenrollPercentums="";
			if(phoneControllers==0 && ControllersDirectCome==0){
				 ControllerToenrollPercentums="暂无";
			}else{
				float ControllerToenrollPercentum=Allenrollsfloat/(phoneControllersfloat+ControllersDirectComefloat);
				 ControllerToenrollPercentums=num.format(ControllerToenrollPercentum);
				/*System.out.println("总转率:"+ControllerToenrollPercentums);*/
			}
			DaySheetmap.put("DayTime", firstConsultTimes);/*当日时间*/
			DaySheetmap.put("phoneControllers", phoneControllers);/*电话咨询量*/
			DaySheetmap.put("ControllersDirectCome", ControllersDirectCome);/*直上咨询量*/
			DaySheetmap.put("AllControllers", AllControllers);/*总咨询量*/
			DaySheetmap.put("phoneControllersCome", phoneControllersCome);/*电话上门量*/
			DaySheetmap.put("AllComes", AllComes);/*总上门量*/
			DaySheetmap.put("Allenrolls", Allenrolls);/*总报名量*/
			DaySheetmap.put("AllpayStatus", AllpayStatus);/*总定金量*/
			DaySheetmap.put("phoneToComePercentums",phoneToComePercentums);/*电转率*/
			DaySheetmap.put("ComeToenrollPercentums", ComeToenrollPercentums);/*面转率*/
			DaySheetmap.put("ControllerToenrollPercentums", ControllerToenrollPercentums);/*总转率*/
			DaySheetmap.put("show", show);/*是否显示无效数据*/
				if(show.equals("2")){
					if(phoneToComePercentums.equals("暂无")&&ComeToenrollPercentums.equals("暂无")&&ControllerToenrollPercentums.equals("暂无")){
						
					}else{
						
						DaySheetList.add(DaySheetmap);
					}
				}else{
					DaySheetList.add(DaySheetmap);
				}
				firstConsultTimes="";
			
			}
		
		
		
		return JSONArray.toJSONString(DaySheetList);
			
		
	}

	/**
	 * 日报表导出
	 * @throws ParseException 
	 */
	@RequestMapping("/ToDaySheetexport")
	public void ToDaySheetexport(HttpServletRequest request,
			HttpServletResponse response,
			OaScbConsulter OaScbConsulter,
			String show
			) throws ParseException{
		
		List<Map<String, Object>> DaySheetList=new ArrayList<>();
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd");
		
		int consultTeacher= OaScbConsulter.getConsultTeacher();
		String firstConsultTimes=OaScbConsulter.getFirstConsultTimes();
		
		String yearTime="";/*年*/
		String monthTime="";/*月*/
		String dayTime="";/*日*/
		int number=1;/*定义for循环的次数默认为1*/
		Date firstConsultTime=null;
		if(firstConsultTimes.equals("")){
			Date date=new Date();
			SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
			/*获得年*/
			 yearTime +=yyyy.format(date);
			System.out.println("年（year）："+yearTime);
			
			SimpleDateFormat MM = new SimpleDateFormat("MM");
			/*获得月*/
			 monthTime +=MM.format(date);
			System.out.println("月（month）："+monthTime);
			
			SimpleDateFormat dd = new SimpleDateFormat("dd");
			/*获得日*/
			 dayTime +=dd.format(date);
			System.out.println("日（day）："+dayTime);
			
			/*转换日*/
			number=Integer.parseInt(dayTime);
			
		}else{
			firstConsultTime=dateTime.parse(firstConsultTimes);
		}
		
		
		for (int i = 1; i <= number; i++) {
			Map<String,Object> DaySheetmap=new HashMap<String,Object>();
			if(firstConsultTimes.equals("")){
				
				firstConsultTimes +=yearTime+"-";/*拼接年*/
				firstConsultTimes +=monthTime+"-";/*拼接月*/
				
				String dayOneStr=i+"";/*定义每一天的String类型*/
				firstConsultTimes +=dayOneStr; /*拼接日*/
				
				firstConsultTime=dateTime.parse(firstConsultTimes);/*将拼接后的String时间转换为Date*/
			}
			
			/*电话咨询量*/
			int phoneControllers= OaScbConsultAssistantSheetService.phoneControllers(firstConsultTime,consultTeacher);
			float phoneControllersfloat=phoneControllers;
			/*System.out.println("咨询日期:"+dates+"  电话咨询量:"+phoneControllersfloat);*/
			
			/*电话上门量*/
			int phoneControllersCome=OaScbConsultAssistantSheetService.phoneControllersCome(firstConsultTime,consultTeacher);
			float phoneControllersComefloat=phoneControllersCome;
			/*System.out.println("电话上门量："+phoneControllersCome);*/
		
			/*日报——直接上门量*/
			int ControllersDirectCome=OaScbConsultAssistantSheetService.ControllersDirectCome(firstConsultTime,consultTeacher);
			float ControllersDirectComefloat=ControllersDirectCome;
			/*System.out.println("直接上门量"+ControllersDirectCome);*/
			
			/*日报——总报名量*/
			int Allenrolls=OaScbConsultAssistantSheetService.Allenrolls(firstConsultTime,consultTeacher);
			float Allenrollsfloat=Allenrolls;
			/*System.out.println("总报名量"+Allenrolls);*/
			
			/*日报——总咨询量*/
			int AllControllers=OaScbConsultAssistantSheetService.AllControllers(firstConsultTime,consultTeacher);
			float AllControllersfloat=AllControllers;
			/*System.out.println("总咨询量:"+AllControllers);*/
			
			/*日报——总上门量*/
			int AllComes=OaScbConsultAssistantSheetService.AllComes(firstConsultTime,consultTeacher);
			float AllComesfloat=AllComes;
			/*System.out.println("总上门量:"+AllComes);*/
			
			/*日报——总定金量*/
			int AllpayStatus=OaScbConsultAssistantSheetService.AllpayStatus(firstConsultTime,consultTeacher);
			
			/*DecimalFormat decimalFormat=new DecimalFormat(".00");*///构造方法的字符格式这里如果小数不足2位,会以0补足
			NumberFormat num = NumberFormat.getPercentInstance();/*转换百分比*/
			num.setMaximumIntegerDigits(3); 
			num.setMaximumFractionDigits(2);
			
			
			/*电转率*/
			String phoneToComePercentums="";
			if(phoneControllers==0){
				 phoneToComePercentums="暂无";
			}else{
				float  phoneToComePercentum=phoneControllersComefloat/phoneControllersfloat;
				 phoneToComePercentums=num.format(phoneToComePercentum);
				/*System.out.println("电转率:"+phoneToComePercentums);*/
			}
			
			/*面转率*/
			String ComeToenrollPercentums="";
			if(phoneControllersCome==0 && ControllersDirectCome==0){
				 ComeToenrollPercentums="暂无";
			}else{
				float ComeToenrollPercentum=Allenrollsfloat/(ControllersDirectComefloat+phoneControllersComefloat);
				 ComeToenrollPercentums=num.format(ComeToenrollPercentum);
				/*System.out.println("面转率:"+ComeToenrollPercentums);*/
			}
			
			/*总转率*/
			String ControllerToenrollPercentums="";
			if(phoneControllers==0 && ControllersDirectCome==0){
				 ControllerToenrollPercentums="暂无";
			}else{
				float ControllerToenrollPercentum=Allenrollsfloat/(phoneControllersfloat+ControllersDirectComefloat);
				 ControllerToenrollPercentums=num.format(ControllerToenrollPercentum);
				/*System.out.println("总转率:"+ControllerToenrollPercentums);*/
			}
			DaySheetmap.put("DayTime", firstConsultTimes);/*当日时间*/
			DaySheetmap.put("phoneControllers", phoneControllers);/*电话咨询量*/
			DaySheetmap.put("ControllersDirectCome", ControllersDirectCome);/*直上咨询量*/
			DaySheetmap.put("AllControllers", AllControllers);/*总咨询量*/
			DaySheetmap.put("phoneControllersCome", phoneControllersCome);/*电话上门量*/
			DaySheetmap.put("AllComes", AllComes);/*总上门量*/
			DaySheetmap.put("Allenrolls", Allenrolls);/*总报名量*/
			DaySheetmap.put("AllpayStatus", AllpayStatus);/*总定金量*/
			DaySheetmap.put("phoneToComePercentums",phoneToComePercentums);/*电转率*/
			DaySheetmap.put("ComeToenrollPercentums", ComeToenrollPercentums);/*面转率*/
			DaySheetmap.put("ControllerToenrollPercentums", ControllerToenrollPercentums);/*总转率*/
			DaySheetmap.put("show", show);/*是否显示无效数据*/
				if(show.equals("2")){
					if(phoneToComePercentums.equals("暂无")&&ComeToenrollPercentums.equals("暂无")&&ControllerToenrollPercentums.equals("暂无")){
						
					}else{
						
						DaySheetList.add(DaySheetmap);
					}
				}else{
					DaySheetList.add(DaySheetmap);
				}
				firstConsultTimes="";
			
			}
		
		
		/*进行导出操作*/
			String excelName = "日报表信息";
			ByteArrayOutputStream os = null;
			
			try {
			HttpSession session = request.getSession(true);
			String[] columnNames = { "日期", "电话咨询量", "直上咨询量", "总咨询量","电话上门量","总上门量","总报名量","总定金量","电转率","面转率","总转率"};// 列名
			String[] columnkeys = { "DayTime", "phoneControllers", "ControllersDirectCome", "AllControllers","phoneControllersCome","AllComes","Allenrolls","AllpayStatus","phoneToComePercentums","ComeToenrollPercentums","ControllerToenrollPercentums" };// map中的key
			os = new ByteArrayOutputStream();
			
			
				// 画出excel
				ExcelUtil.createWorkBook(DaySheetList, columnkeys, columnNames, excelName, request).write(os);
				// 发送给客户端
				SendFileUtil.sendExcel(response, os, excelName);
			
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("出错了");
			}finally {
				try {
					if (os != null) {
						os.close();
					}
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
		
		}
		
	
	

	/**
	 * 跳转周报表
	 */
	@RequestMapping("/ToAssistantWeekSheet")
	public String ToAssistantWeekSheet(HttpServletRequest request){
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService.ConsultTeacherFind();

		request.setAttribute("ConsultTeacherList", empList);/*返回所有咨询师*/		
		
		return "marketDepartment/consultAssistantWeekSheet";
	}
	
	
	/**
	 * 周报表查询
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/AssistantWeekSheetFind")
	@ResponseBody
	public Object AssistantWeekSheetFind(String consultTeacher,String Nowday,String Maxday,String Minday) throws ParseException{
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd");
		
		Date NowdayDate=null; /*某天所在一周的报表*/
		Date MaxdayDate=null; /*结束时间*/
		Date MindayDate=null; /*起始时间*/
		int consultTeacherInt=Integer.parseInt(consultTeacher);/*咨询师*/
		if( Nowday.equals("") && Maxday.equals("") &&  Minday.equals("")){
			Date NowDateTime=new Date();
			Nowday=dateTime.format(NowDateTime);
			NowdayDate=dateTime.parse(Nowday);
		}
		System.out.println(Nowday);
		if(Nowday!=null && !Nowday.equals("")){
			NowdayDate=dateTime.parse(Nowday);
		}
		
		if(Maxday!=null && !Maxday.equals("") ){
			MaxdayDate=dateTime.parse(Maxday);
			
		}
		if(Minday!=null && !Minday.equals("")){
			MindayDate=dateTime.parse(Minday);
		}
		/*指定日期与截止日期不可同时选择*/
		if(Nowday!=null && !Nowday.equals("")&& Maxday!=null&&!Maxday.equals("") ){
			return null;
		}

		/*指定日期与起始日期不可同时选择*/
		if(Nowday!=null && !Nowday.equals("")&& Minday!=null && !Minday.equals("")){
			return null;	
		}
		
		
		
		System.out.println("某天所在一周的报表："+NowdayDate+"----"+Nowday);
		System.out.println("起始时间："+MindayDate+"-----"+Minday);
		System.out.println("结束时间："+MaxdayDate+"----"+Maxday);
		System.out.println("咨询师："+consultTeacherInt);
		
		/*周报表——电话咨询量*/
		int WeekPhoneControllers=OaScbConsultAssistantSheetService.WeekPhoneControllers(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekPhoneControllersfloat=WeekPhoneControllers;
		
		/*周报表--电话上门量*/										
		int WeekPhoneControllersCome=OaScbConsultAssistantSheetService.WeekPhoneControllersCome(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekPhoneControllersComefloat=WeekPhoneControllersCome;
		
		/*周报——直接上门量*/
		int WeekControllersDirectCome= OaScbConsultAssistantSheetService.WeekControllersDirectCome(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekControllersDirectComefloat=WeekControllersDirectCome;
		
		/*周报——总报名量*/
		int WeekAllenrolls=OaScbConsultAssistantSheetService.WeekAllenrolls(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekAllenrollsfloat=WeekAllenrolls;
		
		/*周报——总咨询量*/
		int WeekAllControllers=OaScbConsultAssistantSheetService.WeekAllControllers(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekAllControllersfloat=WeekAllControllers;
		
		/*周报——总上门量*/
		int WeekAllComes=OaScbConsultAssistantSheetService.WeekAllComes(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekAllComesfloat=WeekAllComes;
		
		/*周报——总定金量*/
		int WeekAllpayStatus=OaScbConsultAssistantSheetService.WeekAllpayStatus(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekAllpayStatusfloat=WeekAllpayStatus;
		
		NumberFormat num = NumberFormat.getPercentInstance();/*转换百分比*/
		num.setMaximumIntegerDigits(3); 
		num.setMaximumFractionDigits(2);
		
		
		/*电转率*/
		String WeekphoneToComePercentums="";
		if(WeekPhoneControllers==0){
			WeekphoneToComePercentums="暂无";
		}else{
			float  WeekphoneToComePercentum=WeekPhoneControllersComefloat/WeekPhoneControllersfloat;
			WeekphoneToComePercentums=num.format(WeekphoneToComePercentum);
		}System.out.println("电转率:"+WeekphoneToComePercentums);
		
		/*面转率*/
		String WeekComeToenrollPercentums="";
		if(WeekPhoneControllersCome==0 && WeekControllersDirectCome==0){
			WeekComeToenrollPercentums="暂无";
		}else{
			float WeekComeToenrollPercentum=WeekAllenrollsfloat/(WeekControllersDirectComefloat+WeekPhoneControllersComefloat);
			WeekComeToenrollPercentums=num.format(WeekComeToenrollPercentum);
		}System.out.println("面转率:"+WeekComeToenrollPercentums);
		
		/*总转率*/
		String WeekControllerToenrollPercentums="";
		if(WeekPhoneControllers==0 && WeekControllersDirectCome==0){
			WeekControllerToenrollPercentums="暂无";
		}else{
			float WeekControllerToenrollPercentum=WeekAllenrollsfloat/(WeekPhoneControllersfloat+WeekControllersDirectComefloat);
			WeekControllerToenrollPercentums=num.format(WeekControllerToenrollPercentum);
		}System.out.println("总转率:"+WeekControllerToenrollPercentums);
		
		Map<String,Object> WeekSheetmap=new HashMap<String,Object>();
		WeekSheetmap.put("WeekPhoneControllers", WeekPhoneControllers);/*电话咨询量*/
		WeekSheetmap.put("WeekControllersDirectCome", WeekControllersDirectCome);/*直上咨询量*/
		WeekSheetmap.put("WeekAllControllers", WeekAllControllers);/*总咨询量*/
		WeekSheetmap.put("WeekPhoneControllersCome", WeekPhoneControllersCome);/*电话上门量*/
		WeekSheetmap.put("WeekAllComes", WeekAllComes);/*总上门量*/
		WeekSheetmap.put("WeekAllenrolls", WeekAllenrolls);/*总报名量*/
		WeekSheetmap.put("WeekAllpayStatus", WeekAllpayStatus);/*总定金量*/
		WeekSheetmap.put("WeekphoneToComePercentums", WeekphoneToComePercentums);/*电转率*/
		WeekSheetmap.put("WeekComeToenrollPercentums", WeekComeToenrollPercentums);/*面转率*/
		WeekSheetmap.put("WeekControllerToenrollPercentums", WeekControllerToenrollPercentums);/*总转率*/
		WeekSheetmap.put("Nowday", Nowday);
		WeekSheetmap.put("Maxday", Maxday);
		WeekSheetmap.put("Minday", Minday);
		
		return JSONArray.toJSONString(WeekSheetmap);
	}

	
	
	/**
	 * 周报表导出
	 * @param request
	 * @param response
	 * @param consultTeacher
	 * @param Nowday
	 * @param Maxday
	 * @param Minday
	 * @throws ParseException
	 */
	@RequestMapping("/ToDayWekktexport")
	public void ToDayWekktexport(HttpServletRequest request,
			HttpServletResponse response,
			String consultTeacher,
			String Nowday,
			String Maxday,
			String Minday) throws ParseException{
		List<Map<String, Object>> WeekSheetList=new ArrayList<>();
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd");
		
		Date NowdayDate=null; /*某天所在一周的报表*/
		Date MaxdayDate=null; /*结束时间*/
		Date MindayDate=null; /*起始时间*/
		int consultTeacherInt=Integer.parseInt(consultTeacher);/*咨询师*/
		if( Nowday.equals("") && Maxday.equals("") &&  Minday.equals("")){
			Date NowDateTime=new Date();
			Nowday=dateTime.format(NowDateTime);
			NowdayDate=dateTime.parse(Nowday);
		}
		System.out.println(Nowday);
		if(Nowday!=null && !Nowday.equals("")){
			NowdayDate=dateTime.parse(Nowday);
		}
		
		if(Maxday!=null && !Maxday.equals("") ){
			MaxdayDate=dateTime.parse(Maxday);
			
		}
		if(Minday!=null && !Minday.equals("")){
			MindayDate=dateTime.parse(Minday);
		}
		
		
		
		/*周报表——电话咨询量*/
		int WeekPhoneControllers=OaScbConsultAssistantSheetService.WeekPhoneControllers(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekPhoneControllersfloat=WeekPhoneControllers;
		
		/*周报表--电话上门量*/										
		int WeekPhoneControllersCome=OaScbConsultAssistantSheetService.WeekPhoneControllersCome(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekPhoneControllersComefloat=WeekPhoneControllersCome;
		
		/*周报——直接上门量*/
		int WeekControllersDirectCome= OaScbConsultAssistantSheetService.WeekControllersDirectCome(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekControllersDirectComefloat=WeekControllersDirectCome;
		
		/*周报——总报名量*/
		int WeekAllenrolls=OaScbConsultAssistantSheetService.WeekAllenrolls(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekAllenrollsfloat=WeekAllenrolls;
		
		/*周报——总咨询量*/
		int WeekAllControllers=OaScbConsultAssistantSheetService.WeekAllControllers(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekAllControllersfloat=WeekAllControllers;
		
		/*周报——总上门量*/
		int WeekAllComes=OaScbConsultAssistantSheetService.WeekAllComes(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekAllComesfloat=WeekAllComes;
		
		/*周报——总定金量*/
		int WeekAllpayStatus=OaScbConsultAssistantSheetService.WeekAllpayStatus(NowdayDate, MaxdayDate, MindayDate, consultTeacherInt);
		float WeekAllpayStatusfloat=WeekAllpayStatus;
		
		NumberFormat num = NumberFormat.getPercentInstance();/*转换百分比*/
		num.setMaximumIntegerDigits(3); 
		num.setMaximumFractionDigits(2);
		
		
		/*电转率*/
		String WeekphoneToComePercentums="";
		if(WeekPhoneControllers==0){
			WeekphoneToComePercentums="暂无";
		}else{
			float  WeekphoneToComePercentum=WeekPhoneControllersComefloat/WeekPhoneControllersfloat;
			WeekphoneToComePercentums=num.format(WeekphoneToComePercentum);
		}System.out.println("电转率:"+WeekphoneToComePercentums);
		
		/*面转率*/
		String WeekComeToenrollPercentums="";
		if(WeekPhoneControllersCome==0 && WeekControllersDirectCome==0){
			WeekComeToenrollPercentums="暂无";
		}else{
			float WeekComeToenrollPercentum=WeekAllenrollsfloat/(WeekControllersDirectComefloat+WeekPhoneControllersComefloat);
			WeekComeToenrollPercentums=num.format(WeekComeToenrollPercentum);
		}System.out.println("面转率:"+WeekComeToenrollPercentums);
		
		/*总转率*/
		String WeekControllerToenrollPercentums="";
		if(WeekPhoneControllers==0 && WeekControllersDirectCome==0){
			WeekControllerToenrollPercentums="暂无";
		}else{
			float WeekControllerToenrollPercentum=WeekAllenrollsfloat/(WeekPhoneControllersfloat+WeekControllersDirectComefloat);
			WeekControllerToenrollPercentums=num.format(WeekControllerToenrollPercentum);
		}System.out.println("总转率:"+WeekControllerToenrollPercentums);
		
		Map<String,Object> WeekSheetmap=new HashMap<String,Object>();
		WeekSheetmap.put("WeekPhoneControllers", WeekPhoneControllers);/*电话咨询量*/
		WeekSheetmap.put("WeekControllersDirectCome", WeekControllersDirectCome);/*直上咨询量*/
		WeekSheetmap.put("WeekAllControllers", WeekAllControllers);/*总咨询量*/
		WeekSheetmap.put("WeekPhoneControllersCome", WeekPhoneControllersCome);/*电话上门量*/
		WeekSheetmap.put("WeekAllComes", WeekAllComes);/*总上门量*/
		WeekSheetmap.put("WeekAllenrolls", WeekAllenrolls);/*总报名量*/
		WeekSheetmap.put("WeekAllpayStatus", WeekAllpayStatus);/*总定金量*/
		WeekSheetmap.put("WeekphoneToComePercentums", WeekphoneToComePercentums);/*电转率*/
		WeekSheetmap.put("WeekComeToenrollPercentums", WeekComeToenrollPercentums);/*面转率*/
		WeekSheetmap.put("WeekControllerToenrollPercentums", WeekControllerToenrollPercentums);/*总转率*/
		
		if(Nowday!=null&& !Nowday.equals("")){
			WeekSheetmap.put("day", Nowday+" 所在一周的数据统计：");
		}else if(!Maxday.equals("")&& !Minday.equals("")){
			WeekSheetmap.put("day", Minday+"——"+Maxday+"数据统计：");
		}else if(!Maxday.equals("")){
			WeekSheetmap.put("day", Maxday+" 之前的数据统计：");
		}else if(!Minday.equals("")){
			WeekSheetmap.put("day", Minday+" 之后的数据统计：");
		}
		
		WeekSheetList.add(WeekSheetmap);
		
		
		
		/*进行导出操作*/
		String excelName = "周报表信息";
		ByteArrayOutputStream os = null;
		
		try {
		HttpSession session = request.getSession(true);
		String[] columnNames = { "时间", "电话咨询量", "直上咨询量", "总咨询量","电话上门量","总上门量","总报名量","总定金量","电转率","面转率","总转率"};// 列名
		String[] columnkeys = { "day", "WeekPhoneControllers", "WeekControllersDirectCome", "WeekAllControllers","WeekPhoneControllersCome","WeekAllComes","WeekAllenrolls","WeekAllpayStatus","WeekphoneToComePercentums","WeekComeToenrollPercentums","WeekControllerToenrollPercentums" };// map中的key
		os = new ByteArrayOutputStream();
		
		
			// 画出excel
			ExcelUtil.createWorkBook(WeekSheetList, columnkeys, columnNames, excelName, request).write(os);
			// 发送给客户端
			SendFileUtil.sendExcel(response, os, excelName);
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("出错了");
		}finally {
			try {
				if (os != null) {
					os.close();
				}
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 跳转月报表
	 */
	@RequestMapping("/ToAssistantMonthSheet")
	public String ToAssistantMonthSheet(HttpServletRequest request){
		
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService.ConsultTeacherFind();

		request.setAttribute("ConsultTeacherList", empList);/*返回所有咨询师*/		
	
	
		return "marketDepartment/consultAssistantMonthSheet";
	}
	
	
	/**
	 * 月报表查询
	 * @throws ParseException 
	 */
	@RequestMapping(value="/AssistantMonthSheet")
	@ResponseBody
	public Object AssistantMonthSheet(String consultTeachers,String dayTime) throws ParseException{
		
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd");
		Integer consultTeacher=Integer.parseInt(consultTeachers);
		Date day=null;
		if(dayTime==null||dayTime.equals("")){
			
			Date nowDate=new Date();
			day=nowDate;
		}else{
			
			day=dateTime.parse(dayTime);
		}
		SimpleDateFormat ToMonthTime = new SimpleDateFormat("MM");
		int MonthTime=Integer.parseInt(ToMonthTime.format(day));
		SimpleDateFormat ToYearTime = new SimpleDateFormat("yyyy");
		int YearTime=Integer.parseInt(ToYearTime.format(day));
		
		
		/*月报——电话咨询量*/									
		int MonthPhoneControllers=OaScbConsultAssistantSheetService.MonthPhoneControllers(day, consultTeacher);
		float MonthPhoneControllersfloat=MonthPhoneControllers;
		
		/*月报--电话上门量*/
		int MonthPhoneControllersCome=OaScbConsultAssistantSheetService.MonthPhoneControllersCome(day, consultTeacher);
		float MonthPhoneControllersComefloat=MonthPhoneControllersCome;
		
		/*月报——直接上门量*/
		int MonthControllersDirectCome=OaScbConsultAssistantSheetService.MonthControllersDirectCome(day, consultTeacher);
		float MonthControllersDirectComefloat=MonthControllersDirectCome;
		
		/*月报——总报名量*/
		int MonthAllenrolls=OaScbConsultAssistantSheetService.MonthAllenrolls(day, consultTeacher);
		float MonthAllenrollsfloat=MonthAllenrolls;
		
		/*月报——总咨询量*/
		int MonthAllControllers=OaScbConsultAssistantSheetService.MonthAllControllers(day, consultTeacher);
		float MonthAllControllersfloat=MonthAllControllers;
		
		/*月报——总上门量*/
		int MonthAllComes=OaScbConsultAssistantSheetService.MonthAllComes(day, consultTeacher);
		float MonthAllComesfloat=MonthAllComes;
		
		/*周报——总定金量*/
		int MonthAllpayStatus=OaScbConsultAssistantSheetService.MonthAllpayStatus(day, consultTeacher);
		float MonthAllpayStatusfloat=MonthAllpayStatus;
		
		NumberFormat num = NumberFormat.getPercentInstance();/*转换百分比*/
		num.setMaximumIntegerDigits(3); 
		num.setMaximumFractionDigits(2);
		
		
		/*电转率*/
		String MonthphoneToComePercentums="";
		if(MonthPhoneControllers==0){
			MonthphoneToComePercentums="暂无";
		}else{
			float  MonthphoneToComePercentum=MonthPhoneControllersComefloat/MonthPhoneControllersfloat;
			MonthphoneToComePercentums=num.format(MonthphoneToComePercentum);
		}System.out.println("电转率:"+MonthphoneToComePercentums);
		
		/*面转率*/
		String MonthComeToenrollPercentums="";
		if(MonthControllersDirectCome==0 && MonthPhoneControllersCome==0){
			MonthComeToenrollPercentums="暂无";
		}else{
			float MonthComeToenrollPercentum=MonthAllenrollsfloat/(MonthControllersDirectComefloat+MonthPhoneControllersComefloat);
			MonthComeToenrollPercentums=num.format(MonthComeToenrollPercentum);
		}System.out.println("面转率:"+MonthComeToenrollPercentums);
		
		
		/*总转率*/
		String MonthControllerToenrollPercentums="";
		if(MonthPhoneControllers==0 && MonthControllersDirectCome==0){
			MonthControllerToenrollPercentums="暂无";
		}else{
			float MonthControllerToenrollPercentum=MonthAllenrollsfloat/(MonthPhoneControllersfloat+MonthControllersDirectComefloat);
			MonthControllerToenrollPercentums=num.format(MonthControllerToenrollPercentum);
		}System.out.println("总转率:"+MonthControllerToenrollPercentums);

		Map<String,Object>  MonthSheetmap=new HashMap<String,Object>();
		MonthSheetmap.put("MonthPhoneControllers", MonthPhoneControllers);/*月报——电话咨询量*/
		MonthSheetmap.put("MonthPhoneControllersCome", MonthPhoneControllersCome);/*月报--电话上门量*/
		MonthSheetmap.put("MonthControllersDirectCome", MonthControllersDirectCome);/*月报——直接上门量*/
		MonthSheetmap.put("MonthAllenrolls", MonthAllenrolls);/*月报——总报名量*/
		MonthSheetmap.put("MonthAllControllers", MonthAllControllers);/*月报——总咨询量*/
		MonthSheetmap.put("MonthAllComes", MonthAllComes);/*月报——总上门量*/
		MonthSheetmap.put("MonthAllpayStatus", MonthAllpayStatus);/*周报——总定金量*/
		MonthSheetmap.put("MonthphoneToComePercentums", MonthphoneToComePercentums);/*电转率*/
		MonthSheetmap.put("MonthComeToenrollPercentums", MonthComeToenrollPercentums);/*面转率*/
		MonthSheetmap.put("MonthControllerToenrollPercentums", MonthControllerToenrollPercentums);/*总转率*/
		MonthSheetmap.put("MonthTime", MonthTime);/*所查询的月份*/
		MonthSheetmap.put("YearTime", YearTime);/*所查询的年份*/
		
		return JSONArray.toJSONString(MonthSheetmap);
	}

	
	
	/**
	 * 月报表导出
	 * @throws ParseException 
	 */
	@RequestMapping("/ToMonthWekktexport")
	public void ToMonthWekktexport(
			HttpServletRequest request,
			HttpServletResponse response,
			String consultTeachers,
			String dayTime
			) throws ParseException{
		List<Map<String, Object>> MonthSheetList=new ArrayList<>();
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd");
		Integer consultTeacher=Integer.parseInt(consultTeachers);
		Date day=null;
		if(dayTime==null||dayTime.equals("")){
			
			Date nowDate=new Date();
			day=nowDate;
		}else{
			
			day=dateTime.parse(dayTime);
		}
		SimpleDateFormat ToMonthTime = new SimpleDateFormat("MM");
		int MonthTime=Integer.parseInt(ToMonthTime.format(day));
		SimpleDateFormat ToYearTime = new SimpleDateFormat("yyyy");
		int YearTime=Integer.parseInt(ToYearTime.format(day));
		
		
		/*月报——电话咨询量*/									
		int MonthPhoneControllers=OaScbConsultAssistantSheetService.MonthPhoneControllers(day, consultTeacher);
		float MonthPhoneControllersfloat=MonthPhoneControllers;
		
		/*月报--电话上门量*/
		int MonthPhoneControllersCome=OaScbConsultAssistantSheetService.MonthPhoneControllersCome(day, consultTeacher);
		float MonthPhoneControllersComefloat=MonthPhoneControllersCome;
		
		/*月报——直接上门量*/
		int MonthControllersDirectCome=OaScbConsultAssistantSheetService.MonthControllersDirectCome(day, consultTeacher);
		float MonthControllersDirectComefloat=MonthControllersDirectCome;
		
		/*月报——总报名量*/
		int MonthAllenrolls=OaScbConsultAssistantSheetService.MonthAllenrolls(day, consultTeacher);
		float MonthAllenrollsfloat=MonthAllenrolls;
		
		/*月报——总咨询量*/
		int MonthAllControllers=OaScbConsultAssistantSheetService.MonthAllControllers(day, consultTeacher);
		float MonthAllControllersfloat=MonthAllControllers;
		
		/*月报——总上门量*/
		int MonthAllComes=OaScbConsultAssistantSheetService.MonthAllComes(day, consultTeacher);
		float MonthAllComesfloat=MonthAllComes;
		
		/*周报——总定金量*/
		int MonthAllpayStatus=OaScbConsultAssistantSheetService.MonthAllpayStatus(day, consultTeacher);
		float MonthAllpayStatusfloat=MonthAllpayStatus;
		
		NumberFormat num = NumberFormat.getPercentInstance();/*转换百分比*/
		num.setMaximumIntegerDigits(3); 
		num.setMaximumFractionDigits(2);
		
		
		/*电转率*/
		String MonthphoneToComePercentums="";
		if(MonthPhoneControllers==0){
			MonthphoneToComePercentums="暂无";
		}else{
			float  MonthphoneToComePercentum=MonthPhoneControllersComefloat/MonthPhoneControllersfloat;
			MonthphoneToComePercentums=num.format(MonthphoneToComePercentum);
		}System.out.println("电转率:"+MonthphoneToComePercentums);
		
		/*面转率*/
		String MonthComeToenrollPercentums="";
		if(MonthControllersDirectCome==0 && MonthPhoneControllersCome==0){
			MonthComeToenrollPercentums="暂无";
		}else{
			float MonthComeToenrollPercentum=MonthAllenrollsfloat/(MonthControllersDirectComefloat+MonthPhoneControllersComefloat);
			MonthComeToenrollPercentums=num.format(MonthComeToenrollPercentum);
		}System.out.println("面转率:"+MonthComeToenrollPercentums);
		
		
		/*总转率*/
		String MonthControllerToenrollPercentums="";
		if(MonthPhoneControllers==0 && MonthControllersDirectCome==0){
			MonthControllerToenrollPercentums="暂无";
		}else{
			float MonthControllerToenrollPercentum=MonthAllenrollsfloat/(MonthPhoneControllersfloat+MonthControllersDirectComefloat);
			MonthControllerToenrollPercentums=num.format(MonthControllerToenrollPercentum);
		}System.out.println("总转率:"+MonthControllerToenrollPercentums);

		Map<String,Object>  MonthSheetmap=new HashMap<String,Object>();
		MonthSheetmap.put("MonthPhoneControllers", MonthPhoneControllers);/*月报——电话咨询量*/
		MonthSheetmap.put("MonthPhoneControllersCome", MonthPhoneControllersCome);/*月报--电话上门量*/
		MonthSheetmap.put("MonthControllersDirectCome", MonthControllersDirectCome);/*月报——直接上门量*/
		MonthSheetmap.put("MonthAllenrolls", MonthAllenrolls);/*月报——总报名量*/
		MonthSheetmap.put("MonthAllControllers", MonthAllControllers);/*月报——总咨询量*/
		MonthSheetmap.put("MonthAllComes", MonthAllComes);/*月报——总上门量*/
		MonthSheetmap.put("MonthAllpayStatus", MonthAllpayStatus);/*周报——总定金量*/
		MonthSheetmap.put("MonthphoneToComePercentums", MonthphoneToComePercentums);/*电转率*/
		MonthSheetmap.put("MonthComeToenrollPercentums", MonthComeToenrollPercentums);/*面转率*/
		MonthSheetmap.put("MonthControllerToenrollPercentums", MonthControllerToenrollPercentums);/*总转率*/
		MonthSheetmap.put("MonthTime", MonthTime);/*所查询的月份*/
		MonthSheetmap.put("YearTime", YearTime);/*所查询的年份*/
		
		MonthSheetmap.put("day", YearTime+"年"+MonthTime+"月 报表统计");
		
		MonthSheetList.add(MonthSheetmap);
		

		/*进行导出操作*/
		String excelName = "月报表信息";
		ByteArrayOutputStream os = null;
		
		try {
		HttpSession session = request.getSession(true);
		String[] columnNames = { "时间", "电话咨询量", "直上咨询量", "总咨询量","电话上门量","总上门量","总报名量","总定金量","电转率","面转率","总转率"};// 列名
		String[] columnkeys = { "day", "MonthPhoneControllers", "MonthControllersDirectCome", "MonthAllControllers","MonthPhoneControllersCome","MonthAllComes","MonthAllenrolls","MonthAllpayStatus","MonthphoneToComePercentums","MonthComeToenrollPercentums","MonthControllerToenrollPercentums" };// map中的key
		os = new ByteArrayOutputStream();
		
		
			// 画出excel
			ExcelUtil.createWorkBook(MonthSheetList, columnkeys, columnNames, excelName, request).write(os);
			// 发送给客户端
			SendFileUtil.sendExcel(response, os, excelName);
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("出错了");
		}finally {
			try {
				if (os != null) {
					os.close();
				}
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 跳转年报表
	 */
	@RequestMapping("/ToAssistantYearSheet")
	public String ToAssistantYearSheet(HttpServletRequest request){
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService.ConsultTeacherFind();

		request.setAttribute("ConsultTeacherList", empList);/*返回所有咨询师*/		
		
		return "marketDepartment/consultAssistantYearSheet";
	}
	
	
	
	
	/**
	 * 年报表查询
	 * @throws ParseException 
	 */
	@RequestMapping(value="AssistantYearSheetFind")
	@ResponseBody
	public Object AssistantYearSheetFind(String consultTeachers,String dayTime) throws ParseException{
		
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd");
		Integer consultTeacher=Integer.parseInt(consultTeachers);
		Date day=null;
		if(dayTime==null||dayTime.equals("")){
			
			Date nowDate=new Date();
			day=nowDate;
		}else{
			
			day=dateTime.parse(dayTime);
		}
		
		SimpleDateFormat ToYearTime = new SimpleDateFormat("yyyy");
		int YearTime=Integer.parseInt(ToYearTime.format(day));
		
		/*月报——电话咨询量*/									
		int YearPhoneControllers=OaScbConsultAssistantSheetService.YearPhoneControllers(day, consultTeacher);
		float YearPhoneControllersfloat=YearPhoneControllers;
		
		/*月报--电话上门量*/
		int YearPhoneControllersCome=OaScbConsultAssistantSheetService.YearPhoneControllersCome(day, consultTeacher);
		float YearPhoneControllersComefloat=YearPhoneControllersCome;
		
		/*月报——直接上门量*/
		int YearControllersDirectCome=OaScbConsultAssistantSheetService.YearControllersDirectCome(day, consultTeacher);
		float YearControllersDirectComefloat=YearControllersDirectCome;
		
		/*月报——总报名量*/
		int YearAllenrolls=OaScbConsultAssistantSheetService.YearAllenrolls(day, consultTeacher);
		float YearAllenrollsfloat=YearAllenrolls;
		
		/*月报——总咨询量*/
		int YearAllControllers=OaScbConsultAssistantSheetService.YearAllControllers(day, consultTeacher);
		float YearAllControllersfloat=YearAllControllers;
		
		/*月报——总上门量*/
		int YearAllComes=OaScbConsultAssistantSheetService.YearAllComes(day, consultTeacher);
		float YearAllComesfloat=YearAllComes;
		
		/*周报——总定金量*/
		int YearAllpayStatus=OaScbConsultAssistantSheetService.YearAllpayStatus(day, consultTeacher);
		float YearAllpayStatusfloat=YearAllpayStatus;
		
		NumberFormat num = NumberFormat.getPercentInstance();/*转换百分比*/
		num.setMaximumIntegerDigits(3); 
		num.setMaximumFractionDigits(2);
		
		
		/*电转率*/
		String YearphoneToComePercentums="";
		if(YearPhoneControllers==0){
			YearphoneToComePercentums="暂无";
		}else{
			float  YearphoneToComePercentum=YearPhoneControllersComefloat/YearPhoneControllersfloat;
			YearphoneToComePercentums=num.format(YearphoneToComePercentum);
		}System.out.println("电转率:"+YearphoneToComePercentums);
		
		/*面转率*/
		String YearComeToenrollPercentums="";
		if(YearControllersDirectCome==0 && YearPhoneControllersCome==0){
			YearComeToenrollPercentums="暂无";
		}else{
			float YearComeToenrollPercentum=YearAllenrollsfloat/(YearControllersDirectComefloat+YearPhoneControllersComefloat);
			YearComeToenrollPercentums=num.format(YearComeToenrollPercentum);
		}System.out.println("面转率:"+YearComeToenrollPercentums);
		
		
		/*总转率*/
		String YearControllerToenrollPercentums="";
		if(YearPhoneControllers==0 && YearControllersDirectCome==0){
			YearControllerToenrollPercentums="暂无";
		}else{
			float YearControllerToenrollPercentum=YearAllenrollsfloat/(YearPhoneControllersfloat+YearControllersDirectComefloat);
			YearControllerToenrollPercentums=num.format(YearControllerToenrollPercentum);
		}System.out.println("总转率:"+YearControllerToenrollPercentums);

		Map<String,Object>  YearSheetmap=new HashMap<String,Object>();
		YearSheetmap.put("YearPhoneControllers", YearPhoneControllers);/*月报——电话咨询量*/
		YearSheetmap.put("YearPhoneControllersCome", YearPhoneControllersCome);/*月报--电话上门量*/
		YearSheetmap.put("YearControllersDirectCome", YearControllersDirectCome);/*月报——直接上门量*/
		YearSheetmap.put("YearAllenrolls", YearAllenrolls);/*月报——总报名量*/
		YearSheetmap.put("YearAllControllers", YearAllControllers);/*月报——总咨询量*/
		YearSheetmap.put("YearAllComes", YearAllComes);/*月报——总上门量*/
		YearSheetmap.put("YearAllpayStatus", YearAllpayStatus);/*周报——总定金量*/
		YearSheetmap.put("YearphoneToComePercentums", YearphoneToComePercentums);/*电转率*/
		YearSheetmap.put("YearComeToenrollPercentums", YearComeToenrollPercentums);/*面转率*/
		YearSheetmap.put("YearControllerToenrollPercentums", YearControllerToenrollPercentums);/*总转率*/
		YearSheetmap.put("YearTime", YearTime);/*所查询的年*/
		
		return JSONArray.toJSONString(YearSheetmap);
		
	}

	
	/**
	 * 年报表导出
	 * @throws ParseException 
	 */
	@RequestMapping("/ToYearSheetexport")
	public void ToYearSheetexport(
			HttpServletRequest request,
			HttpServletResponse response,
			String consultTeachers,
			String dayTime
			) throws ParseException{
		List<Map<String, Object>> YearSheetList=new ArrayList<>();
		
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd");
		Integer consultTeacher=Integer.parseInt(consultTeachers);
		Date day=null;
		if(dayTime==null||dayTime.equals("")){
			
			Date nowDate=new Date();
			day=nowDate;
		}else{
			
			day=dateTime.parse(dayTime);
		}
		
		SimpleDateFormat ToYearTime = new SimpleDateFormat("yyyy");
		int YearTime=Integer.parseInt(ToYearTime.format(day));
		
		/*月报——电话咨询量*/									
		int YearPhoneControllers=OaScbConsultAssistantSheetService.YearPhoneControllers(day, consultTeacher);
		float YearPhoneControllersfloat=YearPhoneControllers;
		
		/*月报--电话上门量*/
		int YearPhoneControllersCome=OaScbConsultAssistantSheetService.YearPhoneControllersCome(day, consultTeacher);
		float YearPhoneControllersComefloat=YearPhoneControllersCome;
		
		/*月报——直接上门量*/
		int YearControllersDirectCome=OaScbConsultAssistantSheetService.YearControllersDirectCome(day, consultTeacher);
		float YearControllersDirectComefloat=YearControllersDirectCome;
		
		/*月报——总报名量*/
		int YearAllenrolls=OaScbConsultAssistantSheetService.YearAllenrolls(day, consultTeacher);
		float YearAllenrollsfloat=YearAllenrolls;
		
		/*月报——总咨询量*/
		int YearAllControllers=OaScbConsultAssistantSheetService.YearAllControllers(day, consultTeacher);
		float YearAllControllersfloat=YearAllControllers;
		
		/*月报——总上门量*/
		int YearAllComes=OaScbConsultAssistantSheetService.YearAllComes(day, consultTeacher);
		float YearAllComesfloat=YearAllComes;
		
		/*周报——总定金量*/
		int YearAllpayStatus=OaScbConsultAssistantSheetService.YearAllpayStatus(day, consultTeacher);
		float YearAllpayStatusfloat=YearAllpayStatus;
		
		NumberFormat num = NumberFormat.getPercentInstance();/*转换百分比*/
		num.setMaximumIntegerDigits(3); 
		num.setMaximumFractionDigits(2);
		
		
		/*电转率*/
		String YearphoneToComePercentums="";
		if(YearPhoneControllers==0){
			YearphoneToComePercentums="暂无";
		}else{
			float  YearphoneToComePercentum=YearPhoneControllersComefloat/YearPhoneControllersfloat;
			YearphoneToComePercentums=num.format(YearphoneToComePercentum);
		}System.out.println("电转率:"+YearphoneToComePercentums);
		
		/*面转率*/
		String YearComeToenrollPercentums="";
		if(YearControllersDirectCome==0 && YearPhoneControllersCome==0){
			YearComeToenrollPercentums="暂无";
		}else{
			float YearComeToenrollPercentum=YearAllenrollsfloat/(YearControllersDirectComefloat+YearPhoneControllersComefloat);
			YearComeToenrollPercentums=num.format(YearComeToenrollPercentum);
		}System.out.println("面转率:"+YearComeToenrollPercentums);
		
		
		/*总转率*/
		String YearControllerToenrollPercentums="";
		if(YearPhoneControllers==0 && YearControllersDirectCome==0){
			YearControllerToenrollPercentums="暂无";
		}else{
			float YearControllerToenrollPercentum=YearAllenrollsfloat/(YearPhoneControllersfloat+YearControllersDirectComefloat);
			YearControllerToenrollPercentums=num.format(YearControllerToenrollPercentum);
		}System.out.println("总转率:"+YearControllerToenrollPercentums);

		Map<String,Object>  YearSheetmap=new HashMap<String,Object>();
		YearSheetmap.put("YearPhoneControllers", YearPhoneControllers);/*月报——电话咨询量*/
		YearSheetmap.put("YearPhoneControllersCome", YearPhoneControllersCome);/*月报--电话上门量*/
		YearSheetmap.put("YearControllersDirectCome", YearControllersDirectCome);/*月报——直接上门量*/
		YearSheetmap.put("YearAllenrolls", YearAllenrolls);/*月报——总报名量*/
		YearSheetmap.put("YearAllControllers", YearAllControllers);/*月报——总咨询量*/
		YearSheetmap.put("YearAllComes", YearAllComes);/*月报——总上门量*/
		YearSheetmap.put("YearAllpayStatus", YearAllpayStatus);/*周报——总定金量*/
		YearSheetmap.put("YearphoneToComePercentums", YearphoneToComePercentums);/*电转率*/
		YearSheetmap.put("YearComeToenrollPercentums", YearComeToenrollPercentums);/*面转率*/
		YearSheetmap.put("YearControllerToenrollPercentums", YearControllerToenrollPercentums);/*总转率*/
		YearSheetmap.put("YearTime", YearTime);/*所查询的年*/
		YearSheetmap.put("day", YearTime+"年 报表统计");
		
		YearSheetList.add(YearSheetmap);
		
		
		/*进行导出操作*/
		String excelName = "年报表信息";
		ByteArrayOutputStream os = null;
		
		try {
		HttpSession session = request.getSession(true);
		String[] columnNames = { "时间", "电话咨询量", "直上咨询量", "总咨询量","电话上门量","总上门量","总报名量","总定金量","电转率","面转率","总转率"};// 列名
		String[] columnkeys = { "day", "YearPhoneControllers", "YearControllersDirectCome", "YearAllControllers","YearPhoneControllersCome","YearAllComes","YearAllenrolls","YearAllpayStatus","YearphoneToComePercentums","YearComeToenrollPercentums","YearControllerToenrollPercentums" };// map中的key
		os = new ByteArrayOutputStream();
		
		
			// 画出excel
			ExcelUtil.createWorkBook(YearSheetList, columnkeys, columnNames, excelName, request).write(os);
			// 发送给客户端
			SendFileUtil.sendExcel(response, os, excelName);
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("出错了");
		}finally {
			try {
				if (os != null) {
					os.close();
				}
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
	}
	
	
	/**
	 * 跳转通知页面
	 */
	@RequestMapping("toconsultNotice_list")
	public String toconsultNotice_list(){
		
		return "marketDepartment/consultNotice_list";
	}
	
	/**
	 * 跳转发送通知页面
	 */
	@RequestMapping("toconsultNotice_add")
	public String toconsultNotice_add(){
		return "marketDepartment/consultNotice_add";
	}

	
}

