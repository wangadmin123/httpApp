package cn.tyyhoa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbOperation;
import cn.tyyhoa.pojo.fy;
import cn.tyyhoa.service.OaScbOperationService;
import cn.tyyhoa.util.Page;

@RequestMapping("/oaScbOperation")
@Controller
public class OaScbOperationController {
	
	@Autowired
	OaScbOperationService OaScbOperationService;
	
	@ResponseBody
	@RequestMapping(value = "/OperationSelectJSON",produces={"application/json;charset=UTF-8"})
	public String SelectJSON(HttpSession session, String employee_id,String pageNo,String Time,String consulter_name,String emp_name,String pageSize){
		if(pageNo==null || pageNo.equals("")){
			pageNo="1";
		}
		Integer num=Integer.parseInt(pageNo);
		Integer totalCount =OaScbOperationService.SelectOperationCount(employee_id,Time,emp_name,consulter_name);
		Integer pageSize2 =0;
		if(pageSize==null || pageSize.equals("")){
			pageSize2=10;
		}else{
			pageSize2=Integer.parseInt(pageSize);
		}
		
		fy fys=new fy();
		fys.setCurrPageNo(num);
		fys.setPageSize(pageSize2);
		fys.setTotalCount(totalCount);
		List<OaScbOperation> operationList=OaScbOperationService.SelectOperation(employee_id,(num-1)*pageSize2, pageSize2,Time,emp_name,consulter_name);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for(OaScbOperation tion:operationList){
			if(tion.getTime()!=null){
				tion.setTimes(sdf.format(tion.getTime()));
			}
		}
		fys.setGetOaScbOperationList(operationList);
		
		String pageJSON=JSON.toJSONString(fys);
		return pageJSON;
	}
	
	@RequestMapping(value = "/OperationSelect")
	public String Select(HttpSession session){
		List<OaRlzybEmployee> OaRlzybEmployeelist=OaScbOperationService.EmployeeList();
		session.setAttribute("OaRlzybEmployeeList", OaRlzybEmployeelist);
		return "marketDepartment/consultOperationSelect";
	}

}
