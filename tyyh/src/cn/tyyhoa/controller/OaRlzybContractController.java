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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaRlzybContract;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.service.OaRlzybContractService;
import cn.tyyhoa.service.OaRlzybEmployeeService;
import cn.tyyhoa.util.Page;

@Controller
public class OaRlzybContractController {

	@Autowired
	OaRlzybContractService oaRlzybContractService;
	
	List<OaRlzybContract> oaRlzybContracts;
	
	OaRlzybContract oaRlzybContract;
	
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	
	List<OaRlzybEmployee> oaRlzybEmployees;
	
	OaRlzybEmployee oaRlzybEmployee;
	
	@RequestMapping("/employee_contract_search.html")
	public String employee_contract_search(){
		
		return "human_resource_department/employee_contract_search";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/employee_contract_search",method=RequestMethod.POST)
	public Object showAllContract(
			@RequestParam(required = false) String emp_name,
			@RequestParam(required = false) String contract_id,
			@RequestParam(required = false) String contract_startDate,
			@RequestParam(required = false) String contract_endDate,
			@RequestParam(required = false) String contract_status,
			@RequestParam(required = false) String pageIndex,
			HttpServletRequest request,HttpSession session,Model model) throws ParseException{
		
		int score = 10;
		
		Integer contractId = 0;
		if(contract_id != null && contract_id != ""){
			contractId = Integer.parseInt(contract_id);
		}
		
		int count = oaRlzybEmployeeService.selectCount(emp_name, contractId, contract_startDate, contract_endDate, contract_status);
		
	
		int	pageCount = count % score == 0 ? count / score : count / score + 1;	//总页数
	if(pageCount==0){
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
	
    	oaRlzybEmployees = oaRlzybEmployeeService.selectAllContract(emp_name, contractId, contract_startDate, contract_endDate, contract_status, startPos, score);
    	
		Date now = new Date();
		
		for (OaRlzybEmployee oaRlzybEmployee : oaRlzybEmployees) {
			if(oaRlzybEmployee.getContract_num() == null){
				oaRlzybEmployee.setContract_status("未签订");
			}else if(oaRlzybEmployee.getContract_endDate()==null){
				oaRlzybEmployee.setContract_status("已到期");
				oaRlzybEmployee.setContract_endDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date end = sdf.parse(oaRlzybEmployee.getContract_endDate());
				int year = end.getYear() - now.getYear();
				int month = end.getMonth() - now.getMonth();
				int day = end.getDate() - now.getDate();
				if(year > 1 || 
						year > 0 && end.getMonth() + 12 - now.getMonth() > 2 ||
						year == 0 && month >2){
					oaRlzybEmployee.setContract_status("已签订");
				}else if(year == 0 && month>0 && month<2||year == 0 && month==0&&day>0){
					oaRlzybEmployee.setContract_status("即将到期");
				}else{
					oaRlzybEmployee.setContract_status("已到期");
				}
			}
			oaRlzybEmployee.setEmp_id(oaRlzybEmployee.getEmp_id());
			oaRlzybEmployee.setContract_endDate(oaRlzybEmployee.getContract_endDate());
		    oaRlzybEmployeeService.updateByContractEndDate(oaRlzybEmployee);
		}
		
		Object obj = JSONArray.toJSONString(oaRlzybEmployees);
		Object totalPageCount = JSONArray.toJSONString(pageCount);
		Object totalCount = JSONArray.toJSONString(count);
		Object currentPageNo = JSONArray.toJSONString(PageIndex);
		
		session.setAttribute("obj", obj);
		session.setAttribute("totalPageCount", totalPageCount);
		session.setAttribute("totalCount", totalCount);
		session.setAttribute("currentPageNo", currentPageNo);
		
		String oa = JSON.toJSONStringWithDateFormat(oaRlzybEmployees, "YYYY-MM-dd HH:mm:ss");
		StringBuffer sb = new StringBuffer();
		
		sb.append("{");
		sb.append("\"oaRlzybEmployees\":");
		sb.append(oa);
		sb.append(",\"totalPageCount\":");
		sb.append(pageCount);
		sb.append(",\"totalCount\":");
		sb.append(count);
		sb.append(",\"currentPageNo\":");
		sb.append(PageIndex);
		sb.append("}");
		
		 /*Map<String, Object> map = new HashMap<String, Object>();
		 map.put("obj", oaRlzybEmployees);
		 map.put("totalPageCount", pageCount);
		 map.put("totalCount", count);
		 map.put("currentPageNo", PageIndex);*/
		 
		 System.out.println(sb.toString());
		
		return JSONArray.toJSONString(sb);
		
	}
	
	
	@RequestMapping("/employee_contract_add")
	public String employee_contract_add2(@RequestParam(required = false) String emp_id,
			HttpServletRequest request){		
		Integer empId = 0;
		
		if(emp_id != null){
			empId = Integer.parseInt(emp_id);
		}
		
		/*oaRlzybContract = oaRlzybContractService.showInfo(empId);*/
		oaRlzybEmployee = oaRlzybEmployeeService.showInfo(empId);
		oaRlzybContracts = oaRlzybContractService.selectContractId();
		
		request.setAttribute("oaRlzybContract", oaRlzybEmployee);
		request.setAttribute("oaRlzybContracts", oaRlzybContracts);
		
		return "human_resource_department/employee_contract_add";
	}
	
	@RequestMapping(value="/employee_contract_add",method=RequestMethod.POST)
	public String addContract(
			@RequestParam(required = false) String contract_id,
			@RequestParam(required = false) String depart_id,
			@RequestParam(required = false) String emp_id,
			@RequestParam(required = false) String position_id,
			@RequestParam(required = false) String contract_startDate,
			@RequestParam(required = false) String contract_endDate,
			@RequestParam(required = false) String contract_company,
			HttpServletRequest request){
		
		OaRlzybContract oa = new OaRlzybContract();
		
		if(contract_id != null && contract_id != ""){
			oa.setContract_id(Integer.parseInt(contract_id));
		}
		if(depart_id != null && depart_id != ""){
			oa.setEmp_department(Integer.parseInt(depart_id));
		}
		if(emp_id != null && emp_id != ""){
			oa.setEmp_id(Integer.parseInt(emp_id));
		}
		if(position_id != null && position_id != ""){
			oa.setEmp_position(Integer.parseInt(position_id));
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date contractStartDate = null;
		Date contractEndDate = null;
		if(contract_startDate != null || contract_startDate != ""){
			try {
				contractStartDate = sdf.parse(contract_startDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if(contract_endDate != null || contract_endDate != ""){
			try {
				contractEndDate = sdf.parse(contract_endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		oa.setContract_belong_company(contract_company);
		oa.setContract_status("已签订");
		oa.setContract_startDate(contractStartDate);
		oa.setContract_endDate(contractEndDate);
		oa.setContract_delectStatus(1);
		
		Date date = new Date();
		
		oa.setCreate_time(date);
		
		Boolean flag = oaRlzybContractService.insertSelective(oa);
		
		if(flag == true){
			return "human_resource_department/employee_contract_search";
		}
		
		return "human_resource_department/employee_contract_add";
		
	}
	
}
