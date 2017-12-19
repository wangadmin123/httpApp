package cn.tyyhoa.controller;

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
import cn.tyyhoa.pojo.OaRlzybPosition;
import cn.tyyhoa.pojo.OaRlzybSalaryAdjustment;
import cn.tyyhoa.service.OaRlzybDepartmentService;
import cn.tyyhoa.service.OaRlzybEmployeeService;
import cn.tyyhoa.service.OaRlzybPositionService;
import cn.tyyhoa.service.OaRlzybSalaryAdjustmentService;

@Controller
public class OaRlzybSalaryAdjustmentController {

	@Autowired
	OaRlzybSalaryAdjustmentService oaRlzybSalaryAdjustmentService;
	@Autowired
	OaRlzybDepartmentService oaRlzybDepartmentService;
	@Autowired
	OaRlzybPositionService oaRlzybPositionService;
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	List<OaRlzybSalaryAdjustment> oaRlzybSalaryAdjustments;
	List<OaRlzybDepartment> oaRlzybDepartments;
	List<OaRlzybPosition> oaRlzybPositions;
	List<OaRlzybEmployee> EmpList;
	OaRlzybEmployee Position;
	OaRlzybSalaryAdjustment oaRlzybSalaryAdjustment;
	@RequestMapping("/managesalary_search.html")
	public String managesalary_search(HttpServletRequest request){
		oaRlzybDepartments = oaRlzybDepartmentService.selectAll();
		oaRlzybPositions = oaRlzybPositionService.selectAll();
		request.setAttribute("oaRlzybDepartments", oaRlzybDepartments);
		request.setAttribute("oaRlzybPositions", oaRlzybPositions);
		return "human_resource_department/managesalary_search";
	}
	
	@ResponseBody
	@RequestMapping(value="/managesalary_search",method=RequestMethod.POST)
	public Object managesalary_search2(@RequestParam(required=false)String position_id,
			@RequestParam(required=false)String emp_name,
			@RequestParam(required=false)String depart_id,
			@RequestParam(required=false)String pageIndex,
			HttpServletRequest request){
		
		System.out.println(emp_name);
		System.out.println(position_id);
		System.out.println(depart_id);
		
		int score = 10;
		
		Integer position_name = 0;
		Integer depart_name = 0;
		if(position_id != null){
			position_name = Integer.parseInt(position_id);
		}
		if(depart_id != null){
			depart_name = Integer.parseInt(depart_id);
		}
		
		int count = oaRlzybSalaryAdjustmentService.selectCount(position_name, emp_name, depart_name);
		
		
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
	
		oaRlzybSalaryAdjustments = oaRlzybSalaryAdjustmentService.selectAll(position_name, emp_name, depart_name, startPos, score);
		
		String oa1 = JSON.toJSONStringWithDateFormat(oaRlzybSalaryAdjustments, "YYYY-MM-dd HH:mm:ss");
		StringBuffer sb = new StringBuffer();
		
		sb.append("{");
		sb.append("\"oaRlzybSalaryAdjustments\":");
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
	@RequestMapping("managesalary_add.html")
	public String managesalary_add(HttpServletRequest request){
		oaRlzybDepartments = oaRlzybDepartmentService.selectAll();
		request.setAttribute("oaRlzybDepartments", oaRlzybDepartments);
		return "human_resource_department/managesalary_add";
	}
	
	@RequestMapping(value="managesalary_add",method=RequestMethod.POST)
	public String managesalary_add2(
			@RequestParam(required=false)String emp_id,
			@RequestParam(required=false)String salary_adjustment_beforeMoney,
			@RequestParam(required=false)String salary_adjustment_afterMoney,
			@RequestParam(required=false)String salary_adjustment_reason,
			@RequestParam(required=false)String salary_adjustment_explain,
			HttpServletRequest request){
		if(emp_id != null && emp_id != ""){
			Integer empId = Integer.parseInt(emp_id);
			OaRlzybSalaryAdjustment oa = new OaRlzybSalaryAdjustment();
			oa.setEmp_id(empId);
			oa.setSalary_adjustment_reason(salary_adjustment_reason);
			oa.setSalary_adjustment_afterMoney(salary_adjustment_afterMoney);
			oa.setSalary_adjustment_beforeMoney(salary_adjustment_beforeMoney);
			oa.setSalary_adjustment_explain(salary_adjustment_explain);
			oa.setSalary_adjustment_delectStatus(1);
			
			Date date = new Date();
			
			oa.setCreate_time(date);
			
			boolean flag = oaRlzybSalaryAdjustmentService.insertSelective(oa);
			if(flag == true){
				return "redirect:managesalary_search.html";
			}
		}
		return "human_resource_department/managesalary_add";
	}
	
	@RequestMapping("/managesalary_show")
	public String managesalary_show(
			@RequestParam(required=false)String salary_adjustment_id,HttpServletRequest request){
		System.out.println(salary_adjustment_id);
		
		Integer salary_adjustment_id2 = 0;
		if(salary_adjustment_id != null && salary_adjustment_id != ""){
			salary_adjustment_id2 = Integer.parseInt(salary_adjustment_id);
		}
		oaRlzybSalaryAdjustment = oaRlzybSalaryAdjustmentService.selectShowById(salary_adjustment_id2);
		request.setAttribute("oaRlzybSalaryAdjustment", oaRlzybSalaryAdjustment);
		return "human_resource_department/managesalary_show";
	}
	
	@ResponseBody
	@RequestMapping("/managesalary_delete")
	public Object managesalary_delete(
			@RequestParam(required=false)String salary_adjustment_id){
		
		System.out.println("傳過來的参数："+salary_adjustment_id);
		
		Integer salary_adjustment_id2 = 0;
		
		if(salary_adjustment_id != null && salary_adjustment_id != ""){
			salary_adjustment_id2 = Integer.parseInt(salary_adjustment_id);
		}
		
		Boolean flag = oaRlzybSalaryAdjustmentService.updateDelete(salary_adjustment_id2);
		
		return JSONArray.toJSONString(flag);
		
	}
}
