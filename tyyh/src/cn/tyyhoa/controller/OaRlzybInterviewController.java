package cn.tyyhoa.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybInterview;
import cn.tyyhoa.service.OaRlzybDepartmentService;
import cn.tyyhoa.service.OaRlzybEmployeeService;
import cn.tyyhoa.service.OaRlzybInterviewService;
import cn.tyyhoa.service.OaRlzybPositionService;

@Controller
public class OaRlzybInterviewController {

	@Autowired
	OaRlzybInterviewService oaRlzybInterviewService;

	@Autowired
	OaRlzybDepartmentService oaRlzybDepartmentService;
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	
	public List<OaRlzybDepartment> oaRlzybDepartments;
	
	List<OaRlzybInterview> oaRlzybInterviews1;
	
	List<OaRlzybInterview> oaRlzybInterviews2;
	
	List<OaRlzybInterview> oaRlzybInterviews3;
	
	List<OaRlzybInterview> oaRlzybInterviews4;
	
	List<OaRlzybInterview> oaRlzybInterviewIdByNames;
	
	List<OaRlzybEmployee> oaRlzybEmployees;
	
	OaRlzybInterview oaRlzybInterview1;
	
	OaRlzybInterview oaRlzybInterview2;
	
	@RequestMapping("/interview_search.html")
	public String interview_search1(){
		return "human_resource_department/interview_search";
	}
	
	@RequestMapping("/interview_show.html")
	public String show(){
		return "human_resource_department/interview_show";
	}
	
	@ResponseBody
	@RequestMapping(value="/interview_search1",produces = "application/json;charset=utf-8")
	public Object interview_search2(
			@RequestParam(required = false) String interview_person_name){
		try {
			interview_person_name=new String(interview_person_name.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(interview_person_name);
		
		oaRlzybInterviewIdByNames = null;
		if(interview_person_name != null && interview_person_name != ""){
			oaRlzybInterviewIdByNames = oaRlzybInterviewService.selectPersonByName(interview_person_name);
		}
		return JSONArray.toJSONString(oaRlzybInterviewIdByNames);
	}
	
	@ResponseBody
	@RequestMapping(value="/interview_search2",produces = "application/json;charset=utf-8")
	public Object interview_search3(
			@RequestParam(required = false) String emp_name){
		try {
			emp_name=new String(emp_name.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(emp_name);
		
		oaRlzybInterviewIdByNames = null;
		if(emp_name != null && emp_name != ""){
			oaRlzybInterviewIdByNames = oaRlzybInterviewService.selectIdByName(emp_name);
		}
		return JSONArray.toJSONString(oaRlzybInterviewIdByNames);
	}
	
	@ResponseBody
	@RequestMapping(value="/interview_search",method=RequestMethod.POST)
	public Object interview_search3(
			@RequestParam(required=false)String interview_person,
			@RequestParam(required=false)String emp_name,
			@RequestParam(required=false)String interview_date,
			@RequestParam(required=false)String pageIndex,
			HttpServletRequest request) throws ParseException{
		
		System.out.println(interview_person);
		System.out.println(emp_name);
		System.out.println(interview_date);
		
		int score = 10;
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date interviewDate = null;
		
		if(interview_date != null && interview_date != ""){
			interviewDate = sdf.parse(interview_date);
			
		}
		
		int count = 0;
		oaRlzybInterviews3 = oaRlzybInterviewService.selectPerson(interview_person, interviewDate);
		oaRlzybInterviews4 = oaRlzybInterviewService.selectEmpName(emp_name, interviewDate);
		
		for (int i = 0; i < oaRlzybInterviews3.size(); i++) {
			Integer id = oaRlzybInterviews3.get(i).getInterview_id();
			for (int j = 0; j < oaRlzybInterviews4.size(); j++) {
				Integer id2 = oaRlzybInterviews4.get(j).getInterview_id();
				if(id == id2){
					count = count + 1;
				}
			}
		}
		System.out.println(count);
		
		int pageCount = count % score == 0 ? count / score : count / score + 1;	//总页数
		if(pageCount < 1){
			pageCount = 1;
		}
		
		Integer PageIndex = 1;
		if(pageIndex != null && pageIndex != ""){
			PageIndex = Integer.parseInt(pageIndex);	//当前页数
		}
		
		if(PageIndex < 1){
			PageIndex = 1;
    	}else if(PageIndex > pageCount){
    		PageIndex = pageCount;
    	}
		
		int startPos = score * (PageIndex - 1);
	
		oaRlzybInterviews1 = oaRlzybInterviewService.selectAllPerson(interview_person, interviewDate, startPos, score);
		oaRlzybInterviews2 = oaRlzybInterviewService.selectAllEmpName(emp_name, interviewDate, startPos, score);
		
		String oa1 = JSON.toJSONStringWithDateFormat(oaRlzybInterviews1, "YYYY-MM-dd HH:mm:ss");
		String oa2 = JSON.toJSONStringWithDateFormat(oaRlzybInterviews2, "YYYY-MM-dd HH:mm:ss");
		StringBuffer sb = new StringBuffer();
		
		sb.append("{");
		sb.append("\"person\":");
		sb.append(oa1);
		sb.append(",\"empName\":");
		sb.append(oa2);
		sb.append(",\"totalPageCount\":");
		sb.append(pageCount);
		sb.append(",\"totalCount\":");
		sb.append(count);
		sb.append(",\"currentPageNo\":");
		sb.append(PageIndex);
		sb.append("}");
		System.out.println(sb.toString());
		return JSONArray.toJSONString(sb);
	}
	
	@RequestMapping("interview_add.html")
	public String interview_add(HttpServletRequest request){
		oaRlzybDepartments = oaRlzybDepartmentService.selectAll();
		request.setAttribute("oaRlzybDepartments", oaRlzybDepartments);
		return "human_resource_department/interview_add";
	}
	
	@ResponseBody
	@RequestMapping("/interview_add")
	public Object interview_add1(@RequestParam(value="emp_name",required=false)String emp_name){
		try {
			emp_name=new String(emp_name.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(emp_name);
		
		
		oaRlzybEmployees = oaRlzybEmployeeService.selectAll(emp_name);
		return JSONArray.toJSONString(oaRlzybEmployees);
	}
	
	@RequestMapping(value="/interview_add",method=RequestMethod.POST)
	public String interview_add2(
			@RequestParam(required=false)String interview_person,
			@RequestParam(required=false)String emp_id,
			@RequestParam(required=false)String interview_date,
			@RequestParam(required=false)String interview_reason,
			@RequestParam(required=false)String interview_content,
			@RequestParam(required=false)String interview_recorder,
			HttpServletRequest request) throws ParseException{
		
		System.out.println(interview_person);
		System.out.println(emp_id);
		System.out.println(interview_date);
		System.out.println(interview_reason);
		System.out.println(interview_content);
		System.out.println(interview_recorder);
		
		OaRlzybInterview oa = new OaRlzybInterview();
		
		Integer emp_id2 = 0;
		if(emp_id != null){
			emp_id2 = Integer.parseInt(emp_id);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse(interview_date);
		
		oa.setInterview_person(interview_person);
		oa.setEmp_id(emp_id2);
		oa.setInterview_date(d);
		oa.setInterview_reason(interview_reason);
		oa.setInterview_content(interview_content);
		oa.setInterview_recorder(interview_recorder);
		oa.setInterview_delectStatus(1);
		
		Date date = new Date();
		
		oa.setCreate_time(date);
		
		boolean flag = oaRlzybInterviewService.insertSelective(oa);
		if(flag == true){
			return "human_resource_department/interview_search";
		}
		return "human_resource_department/interview_add";
	}
	
	@RequestMapping("/interview_show")
	public String interview_show(@RequestParam(required=false)String interview_id,
			HttpServletRequest request){
		
		System.out.println(interview_id);
		Integer interviewId = 0;
		if(interview_id != null){
			interviewId = Integer.parseInt(interview_id);
		}
		
		oaRlzybInterview1 = oaRlzybInterviewService.selectShowPerson(interviewId);
		oaRlzybInterview2 = oaRlzybInterviewService.selectShowEmpName(interviewId);
		
		Date d = oaRlzybInterview1.getInterview_date();
		int year = d.getYear() + 1900;
		int month = d.getMonth() + 1;
		int day = d.getDate();
		
		String mon = "" + month;
		String date = "" + day;
		
		if(month < 10){
			mon = "0" + month;
		}
		if(day < 10){
			date = "0" + day;
		}
		
		String time = year + "-" + mon + "-" + date;
		
		request.setAttribute("oaRlzybInterview1", oaRlzybInterview1);
		request.setAttribute("oaRlzybInterview2", oaRlzybInterview2);
		request.setAttribute("interview_date", time);
		
		return "human_resource_department/interview_show";
	}
	
	
	@ResponseBody
	@RequestMapping("/interview_delete")
	public Object interview_delete(
			@RequestParam(required=false)String interview_id){
		
		System.out.println("傳過來的参数："+interview_id);
		
		Integer interview_id2 = 0;
		
		if(interview_id != null && interview_id != ""){
			interview_id2 = Integer.parseInt(interview_id);
		}
		
		Boolean flag = oaRlzybInterviewService.updateDelete(interview_id2);
		
		return JSONArray.toJSONString(flag);
		
	}
	
	
	
	
}

