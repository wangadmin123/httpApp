package cn.tyyhoa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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

import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybPosition;
import cn.tyyhoa.pojo.OaRlzybTechnicalTitle;
import cn.tyyhoa.pojo.OaRlzybTransferPosition;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaRlzybDepartmentService;
import cn.tyyhoa.service.OaRlzybEmployeeService;
import cn.tyyhoa.service.OaRlzybPositionService;
import cn.tyyhoa.service.OaRlzybTransferPositionService;
import cn.tyyhoa.service.OaRlzybUserService;

@Controller
public class OaRlzybTransferPositionController {

	@Autowired
	OaRlzybTransferPositionService oaRlzybTransferPositionService;
	
	@Autowired
	OaRlzybPositionService oaRlzybPositionService;
	
	@Autowired
	OaRlzybDepartmentService oaRlzybDepartmentService;
	
	@Autowired
	OaRlzybUserService oaRlzybUserService;
	
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	
	public List<OaRlzybTransferPosition> oaRlzybTransferPositions;

	public List<OaRlzybTransferPosition> oaRlzybTransferPositions2;
	
	public List<OaRlzybPosition> oaRlzybPositions;
	
	public List<OaRlzybDepartment> oaRlzybDepartments;
	
	public List<OaRlzybEmployee> oaRlzybEmployees;
	
	public List<OaRlzybEmployee> oaRlzybEmployee;
	
	OaRlzybEmployee oaRlzybEmployee2;
	
	OaRlzybTransferPosition oaRlzybTransferPosition1;
	
	OaRlzybTransferPosition oaRlzybTransferPosition2;
	
	@RequestMapping("/transfer_position_search.html")
	public String transfer_position_search(HttpServletRequest request){
		
		return "human_resource_department/transfer_position_search";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/transfer_position_search",method=RequestMethod.POST)
	public Object transfer_position_search2(
			@RequestParam(required = false) String emp_name,
			@RequestParam(required = false) String pageIndex,
			HttpServletRequest request,HttpSession session){
		
		System.out.println(emp_name);
		System.out.println(pageIndex);
		
		int score = 10;
		
		int count = oaRlzybTransferPositionService.selectAllCount(emp_name);
		
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
	
		oaRlzybTransferPositions = oaRlzybTransferPositionService.selectAll(emp_name, startPos, score);
		
		oaRlzybTransferPositions2 = oaRlzybTransferPositionService.selectBeforePositionDepart(emp_name, startPos, score);
    		
		Object obj = JSONArray.toJSONString(oaRlzybTransferPositions);
		Object obj2 = JSONArray.toJSONString(oaRlzybTransferPositions2);
		Object totalPageCount = JSONArray.toJSONString(pageCount);
		Object totalCount = JSONArray.toJSONString(count);
		Object currentPageNo = JSONArray.toJSONString(PageIndex);
		
		session.setAttribute("obj", obj);
		session.setAttribute("obj2", obj2);
		session.setAttribute("totalPageCount", totalPageCount);
		session.setAttribute("totalCount", totalCount);
		session.setAttribute("currentPageNo", currentPageNo);
		
		String oaRlzybTransferPosition = JSON.toJSONStringWithDateFormat(oaRlzybTransferPositions, "YYYY-MM-dd HH:mm:ss");
		String oaRlzybTransferPosition2 = JSON.toJSONStringWithDateFormat(oaRlzybTransferPositions2, "YYYY-MM-dd HH:mm:ss");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("{");
		sb.append("\"oaRlzybTransferPosition\":");
		sb.append(oaRlzybTransferPosition);
		sb.append(",\"oaRlzybTransfer\":");
		sb.append(oaRlzybTransferPosition2);
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
	public String transformPhotoPath(String photoPath){
		int photoPath_index = photoPath.lastIndexOf("\\");
		photoPath = photoPath.substring(photoPath_index+1);
		photoPath = "/uploadfiles/"+photoPath;
		return photoPath;
	}
	/*跳转调岗页面*/
	@RequestMapping("/transfer_position_add.html/{emp_id}")
	public String transfer_position_add1(@PathVariable String emp_id,
			HttpServletRequest request){
		OaRlzybEmployee oaRlzybEmployee = oaRlzybEmployeeService
				.getOaRlzybEmployeeById(Integer.parseInt(emp_id));
		String emp_photo_path = oaRlzybEmployee.getEmp_photo_path();
		if(emp_photo_path!=null){
			oaRlzybEmployee.setEmp_photo_path(transformPhotoPath(emp_photo_path));	
		}else{
			oaRlzybEmployee.setEmp_photo_path("空");
		}
		String emp_idcard_front = oaRlzybEmployee.getEmp_idcard_front();
		if(emp_idcard_front!=null){
			oaRlzybEmployee.setEmp_idcard_front(transformPhotoPath(emp_idcard_front));
		}else{
			oaRlzybEmployee.setEmp_idcard_front("空");
		}
		String emp_idcard_reverse = oaRlzybEmployee.getEmp_idcard_reverse();
		System.out.println("测试测试"+emp_idcard_reverse);
		if(emp_idcard_reverse!=null){
			oaRlzybEmployee.setEmp_idcard_reverse(transformPhotoPath(emp_idcard_reverse));
		}else{
			oaRlzybEmployee.setEmp_idcard_reverse("空");
		}
		String emp_Degree_certificate = oaRlzybEmployee.getEmp_Degree_certificate();
		if(emp_Degree_certificate!=null){
			oaRlzybEmployee.setEmp_Degree_certificate(transformPhotoPath(emp_Degree_certificate));
		}else{
			oaRlzybEmployee.setEmp_Degree_certificate("空");
		}
		String emp_Education_certificate = oaRlzybEmployee.getEmp_Education_certificate();
		if(emp_Education_certificate!=null){
			
			oaRlzybEmployee.setEmp_Education_certificate(transformPhotoPath(emp_Education_certificate));
		}else{
			oaRlzybEmployee.setEmp_Education_certificate("空");
		}
		List<OaRlzybTechnicalTitle> oaRlzybTechnicalTitleList = oaRlzybEmployeeService.getOaRlzybTechnicalTitleByEmpId(Integer.parseInt(emp_id));
		for (Iterator iterator = oaRlzybTechnicalTitleList.iterator(); iterator
		.hasNext();) {
	OaRlzybTechnicalTitle oaRlzybTechnicalTitle = (OaRlzybTechnicalTitle) iterator
			.next();
	String emp_technical_title_path  = oaRlzybTechnicalTitle.getTechnical_title_path();
	oaRlzybTechnicalTitle.setTechnical_title_path(transformPhotoPath(emp_technical_title_path));
	
}		
		Date emp_Entry_date = oaRlzybEmployee.getEmp_Entry_date();
		Date emp_tryout_end_date = oaRlzybEmployee.getEmp_tryout_end_date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		oaRlzybEmployee.setEmp_Entry_date_str(sdf.format(emp_Entry_date));
		oaRlzybEmployee.setEmp_tryout_end_date_str(sdf.format(emp_tryout_end_date));
        request.setAttribute("oaRlzybTechnicalTitleList", oaRlzybTechnicalTitleList);
		request.setAttribute("oaRlzybEmployee", oaRlzybEmployee);
		oaRlzybDepartments = oaRlzybDepartmentService.selectAll();
		/*oaRlzybPositions = oaRlzybPositionService.selectAllByDepartId(department_id);*/
		request.setAttribute("oaRlzybDepartments", oaRlzybDepartments);
		/*request.setAttribute("oaRlzybPositions", oaRlzybPositions);*/
		return "human_resource_department/transfer_position_add";
	}
	
	@ResponseBody
	@RequestMapping(value="/showDepartment")
	public Object add(@RequestParam(required=false)String departId,
			HttpServletRequest request){
		
		Integer department_id = 0;
		if(departId != null && departId != ""){
			department_id = Integer.parseInt(departId);
		}
		
		oaRlzybPositions = oaRlzybPositionService.selectAllByDepartId(department_id);
		
		return JSONArray.toJSONString(oaRlzybPositions);
	}
	
	@ResponseBody
	@RequestMapping(value="/transfer_position_add1")
	public Object transfer_position_add(
			@RequestParam(required=false)String depart_id,
			HttpServletRequest request){
		
		System.out.println("depart_id:" + depart_id);
		
		Integer departId = 0;
		if(depart_id != null &&depart_id != ""){
			departId = Integer.parseInt(depart_id);
		}
		oaRlzybEmployees = oaRlzybEmployeeService.selectByDepart(departId);
		
		return JSONArray.toJSONString(oaRlzybEmployees);
	}
	
	/*@ResponseBody
	@RequestMapping(value="/transfer_position_add3")
	public Object transfer_position_add3(
			@RequestParam(required=false)String depart_id,
			HttpServletRequest request){
		
		System.out.println("depart_id:" + depart_id);
		
		Integer departId = 0;
		if(depart_id != null &&depart_id != ""){
			departId = Integer.parseInt(depart_id);
		}
		oaRlzybEmployees = oaRlzybEmployeeService.selectByDepart(departId);
		
		return JSONArray.toJSONString(oaRlzybEmployees);
	}*/
	@ResponseBody
	@RequestMapping(value="/transfer_position_add2",method=RequestMethod.GET)
	public Object transfer_position_add2(
			@RequestParam(required=false)String emp_id,
			HttpServletRequest request){
		System.out.println("emp_id:" + emp_id);		
		
		Integer empId = 1;
		if(emp_id != null &&emp_id != ""){
			empId = Integer.parseInt(emp_id);
		}
		oaRlzybEmployee2 = oaRlzybEmployeeService.showInfo(empId);
		return JSONArray.toJSONString(oaRlzybEmployee2);
	}
	
	@RequestMapping(value="/transfer_position_add",method=RequestMethod.POST)
	public String transfer_position_add2(
			@RequestParam(required=false)String emp_id,
			@RequestParam(required=false)String depart_id,
			@RequestParam(required=false)String position,
			@RequestParam(required=false)String departId,
			@RequestParam(required=false)String positionId,
			@RequestParam(required=false)String transfer_position_reason,
			@RequestParam(required=false)String transfer_position_details,
			@RequestParam(required=false)String transfer_position_time,
			HttpServletRequest request){
		
		System.out.println(emp_id);
		System.out.println(depart_id);
		System.out.println(position);
		System.out.println(departId);
		System.out.println(positionId);
		System.out.println(transfer_position_reason);
		System.out.println(transfer_position_details);
		System.out.println(transfer_position_time);

		OaRlzybTransferPosition oa = new OaRlzybTransferPosition();
		Integer depart_id2 = 0;
		if(depart_id != null && depart_id != ""){
			depart_id2 = Integer.parseInt(depart_id);
			oa.setDepart(depart_id2);
		}
		Integer position_id2 = 0;
		if(position != null && position != ""){
			position_id2 = Integer.parseInt(position);
			oa.setPosition(position_id2);
		}
		Integer emp_id2 = 0;
		if(emp_id != null && emp_id != ""){
			emp_id2 = Integer.parseInt(emp_id);
			oa.setEmp_id(emp_id2);
		}
		Integer departId2 = 0;
		if(departId != null){
			departId2 = Integer.parseInt(departId);
			oa.setDepart_id(departId2);
		}
		Integer positionId2 = 0;
		if(positionId != null && positionId != ""){
			positionId2 = Integer.parseInt(positionId);
			oa.setPosition_id(positionId2);
		}
		oa.setTransfer_position_reason(transfer_position_reason);
		oa.setTransfer_position_details(transfer_position_details);
		oa.setTransfer_position_time(transfer_position_time);
		oa.setTransfer_position_delectStatus(1);
		
		Date date = new Date();
		
		oa.setCreate_time(date);
		
		boolean flag = oaRlzybTransferPositionService.insertSelective(oa);
		
		if(flag == true){
			OaRlzybEmployee emp = new OaRlzybEmployee();
			emp.setEmp_position(positionId2);
			emp.setEmp_department(departId2);
			emp.setEmp_id(emp_id2);
			oaRlzybEmployeeService.updateByEmpId(emp);
			
			OaRlzybUser user = new OaRlzybUser();
			user.setEmp_id(emp_id2);
			user.setPosition_id(positionId2);
			oaRlzybUserService.updatePositionByEmpId(user);
			
			return "human_resource_department/transfer_position_search";
		}
		
		return "human_resource_department/transfer_position_add";
	}
	
	@RequestMapping(value="/transfer_position_show")
	public String transfer_position_show(@RequestParam(required=false)String transfer_position_id,HttpServletRequest request){
		
		System.out.println(transfer_position_id);
		
		Integer transfer_position_id2 = 0;
		if(transfer_position_id != null && transfer_position_id != ""){
			transfer_position_id2 = Integer.parseInt(transfer_position_id);
		}
		
		oaRlzybTransferPosition1 = oaRlzybTransferPositionService.selectAllShow(transfer_position_id2);
		oaRlzybTransferPosition2 = oaRlzybTransferPositionService.selectBeforeShow(transfer_position_id2);
		
		request.setAttribute("oaRlzybTransferPosition1", oaRlzybTransferPosition1);
		request.setAttribute("oaRlzybTransferPosition2", oaRlzybTransferPosition2);
		
		return "human_resource_department/transfer_position_show";
	}
	

	@ResponseBody
	@RequestMapping("/transfer_position_delete")
	public Object transfer_position_delete(
			@RequestParam(required=false)String transfer_position_id){
		
		System.out.println("傳過來的参数："+transfer_position_id);
		
		Integer transfer_position_id2 = 0;
		
		if(transfer_position_id != null && transfer_position_id != ""){
			transfer_position_id2 = Integer.parseInt(transfer_position_id);
		}
		
		Boolean flag = oaRlzybTransferPositionService.updateDeleteStatus(transfer_position_id2);
		
		return JSONArray.toJSONString(flag);
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
