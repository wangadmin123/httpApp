package cn.tyyhoa.controller;

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
import cn.tyyhoa.pojo.OaRlzybRewards;
import cn.tyyhoa.service.OaRlzybDepartmentService;
import cn.tyyhoa.service.OaRlzybEmployeeService;
import cn.tyyhoa.service.OaRlzybRewardsService;

@Controller
public class OaRlzybRewardsController {

	@Autowired
	OaRlzybRewardsService oaRlzybRewardsService;
	@Autowired
	OaRlzybDepartmentService oaRlzybDepartmentService;
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	
	List<OaRlzybRewards> oaRlzybRewardss;
	
	List<OaRlzybDepartment> oaRlzybDepartments;
	
	List<OaRlzybEmployee> EmpList;
	
	OaRlzybEmployee Position;
	
	OaRlzybRewards oaRlzybReward;
	
	@RequestMapping("Randp_search.html")
	public String Randp_search(){
		return "human_resource_department/Randp_search";
	}
	@RequestMapping("/Randp_add.html")
	public String Randp_add(HttpServletRequest request){
		oaRlzybDepartments = oaRlzybDepartmentService.selectAll();
		request.setAttribute("oaRlzybDepartments", oaRlzybDepartments);
		return "human_resource_department/Randp_add";
	}
	
	@ResponseBody
	@RequestMapping(value="Randp_search",method=RequestMethod.POST)
	public Object Randp_search2(
			@RequestParam(required=false)String emp_name,
			@RequestParam(required=false)String rewards_type,
			@RequestParam(required=false)String pageIndex,
			HttpServletRequest request){
		
		System.out.println(emp_name);
		System.out.println(rewards_type);
		
		int score = 10;
		
		int count = oaRlzybRewardsService.selectCount(emp_name, rewards_type);
		
		
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
	
		oaRlzybRewardss = oaRlzybRewardsService.selectAll(emp_name, rewards_type, startPos, score);
		
		String oa1 = JSON.toJSONStringWithDateFormat(oaRlzybRewardss, "YYYY-MM-dd HH:mm:ss");
		StringBuffer sb = new StringBuffer();
		
		sb.append("{");
		sb.append("\"oaRlzybRewards\":");
		sb.append(oa1);
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
	
/*	@RequestMapping("/showDepartName")
	public String add1(HttpServletRequest request){
		oaRlzybDepartments = oaRlzybDepartmentService.selectAll();
		request.setAttribute("oaRlzybDepartments", oaRlzybDepartments);
		return "Randp_add";
	}
	*/
	@ResponseBody
	@RequestMapping("/showEmpName")
	public Object add2(@RequestParam(required=false) String emp_department){
		System.out.println(emp_department);
		Integer empDepartment = 0;
		if(emp_department != null){
			empDepartment = Integer.parseInt(emp_department);
		}
		EmpList = oaRlzybEmployeeService.selectEmpNameByDepartId(empDepartment);
		return JSONArray.toJSONString(EmpList);
	}
	@ResponseBody
	@RequestMapping("/showPosition")
	public Object add3(@RequestParam(required=false) String emp_id){
		System.out.println(emp_id);
		Integer empId = 0;
		if(emp_id != null){
			empId = Integer.parseInt(emp_id);
		}
		Position = oaRlzybEmployeeService.selectPositionByEmpName(empId);
		return JSONArray.toJSONString(Position);
	}
	
	@RequestMapping(value="/Randp_add",method=RequestMethod.POST)
	public String add4(
			@RequestParam(required=false) String emp_id,
			@RequestParam(required=false) String rewards_type,
			@RequestParam(required=false) String rewards_date,
			@RequestParam(required=false) String rewards_reason,
			@RequestParam(required=false) String rewards_content,
			HttpServletRequest request) throws ParseException{
		
		Integer empId = 0;
		if(emp_id != null){
			empId = Integer.parseInt(emp_id);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date rewardsDate = null;
		rewardsDate = sdf.parse(rewards_date);
		
		OaRlzybRewards oa = new OaRlzybRewards();
		oa.setEmp_id(empId);
		oa.setRewards_type(rewards_type);
		oa.setRewards_date(rewardsDate);
		oa.setRewards_reason(rewards_reason);
		oa.setRewards_content(rewards_content);
		oa.setRewards_delectStatus(1);
		
		Date date = new Date();
		
		oa.setCreate_time(date);
		
		boolean flag = oaRlzybRewardsService.insertSelective(oa);
		
		if(flag == true){
			return "human_resource_department/Randp_search";
		}
		
		return "human_resource_department/Randp_add";
	}
	
	@RequestMapping("rewards_show")
	public String rewards_show(
			@RequestParam(required=false) String rewards_id,
			HttpServletRequest request){
		Integer rewardsId = 0;
		if(rewards_id != null && rewards_id != ""){
			rewardsId = Integer.parseInt(rewards_id);
		}
		oaRlzybReward = oaRlzybRewardsService.selectShowInfo(rewardsId);
		request.setAttribute("oaRlzybReward", oaRlzybReward);
		
		Date d = oaRlzybReward.getRewards_date();
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
		
		request.setAttribute("rewards_date", time);
		
		return "human_resource_department/Randp_show";
	}
	
	@ResponseBody
	@RequestMapping("/Randp_delete")
	public Object talentReserve_delete(
			@RequestParam(required=false)String rewards_id){
		
		System.out.println("傳過來的参数："+rewards_id);
		
		Integer rewards_id2 = 0;
		
		if(rewards_id != null && rewards_id != ""){
			rewards_id2 = Integer.parseInt(rewards_id);
		}
		
		boolean flag = oaRlzybRewardsService.updateByRewardsId(rewards_id2);
				
		return JSONArray.toJSONString(flag);
		
	}
	
	
	
	
	
	
}
