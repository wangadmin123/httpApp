package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.pojo.OaRlzybPosition;
import cn.tyyhoa.pojo.OaRlzybTalentPool;
import cn.tyyhoa.service.OaRlzybDepartmentService;
import cn.tyyhoa.service.OaRlzybPositionService;
import cn.tyyhoa.service.OaRlzybTalentPoolService;

@Controller
public class OaRlzybTalentPoolController {

	@Autowired
	OaRlzybTalentPoolService oaRlzybTalentPoolService;
	
	@Autowired
	OaRlzybPositionService oaRlzybPositionService;
	
	@Autowired
	OaRlzybDepartmentService oaRlzybDepartmentService;
	
	public List<OaRlzybTalentPool> oaRlzybTalentPools;
	
	public List<OaRlzybPosition> oaRlzybPositions;
	
	OaRlzybTalentPool oaRlzybTalentPool;
	
	List<OaRlzybDepartment> oaRlzybDepartments;
	
	@RequestMapping("/welcome.html")
	public String index(){
		
		return "welcome";
	}
	
	@RequestMapping("/talentReserve_search.html")
	public String selectAllOaRlzybTalentPool(HttpServletRequest request){
		
		oaRlzybDepartments = oaRlzybDepartmentService.selectAll();
		request.setAttribute("oaRlzybDepartments", oaRlzybDepartments);
		/*oaRlzybPositions = oaRlzybPositionService.selectAll();
		
		request.setAttribute("oaRlzybPositions", oaRlzybPositions);*/
		
		return "human_resource_department/talentReserve_search";
		
		
	}
	
	@ResponseBody
	@RequestMapping("/showPositionName")
	public Object showPositionName(@RequestParam(required = false) String depart_id){
		
		Integer department_id = 0;
		if(depart_id != null && depart_id != ""){
			department_id = Integer.parseInt(depart_id);
		}
		
		oaRlzybPositions = oaRlzybPositionService.selectAllByDepartId(department_id);
		
		return JSONArray.toJSONString(oaRlzybPositions);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/talentReserve_search",method = RequestMethod.POST)
	public Object shows(
			@RequestParam(required = false) String position_id,
			@RequestParam(required = false) String depart_id,
			@RequestParam(required = false) String pageIndex,
			HttpServletRequest request,HttpSession session,Model model){
		
		
		int score = 10;
		
		Integer positionId = 0;
		if(position_id != null && position_id != ""){
			positionId = Integer.parseInt(position_id);
		}
		
		int count = oaRlzybTalentPoolService.selectAllCount(positionId);
		
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
	
		oaRlzybTalentPools = oaRlzybTalentPoolService.selectAll(positionId, startPos, score);
		
		
		Object obj = JSONArray.toJSONString(oaRlzybTalentPools);
		Object totalPageCount = JSONArray.toJSONString(pageCount);
		Object totalCount = JSONArray.toJSONString(count);
		Object currentPageNo = JSONArray.toJSONString(PageIndex);
		
		session.setAttribute("obj", obj);
		session.setAttribute("totalPageCount", totalPageCount);
		session.setAttribute("totalCount", totalCount);
		session.setAttribute("currentPageNo", currentPageNo);
		
		/*Integer department_id = 0;
		if(depart_id != null && depart_id != ""){
			department_id = Integer.parseInt(depart_id);
		}
		
		oaRlzybPositions = oaRlzybPositionService.selectAllByDepartId(department_id);*/
		
		String oaRlzybTalentPool = JSON.toJSONStringWithDateFormat(oaRlzybTalentPools, "YYYY-MM-dd HH:mm:ss");
		/*String oaRlzybPosition = JSON.toJSONStringWithDateFormat(oaRlzybPositions, "YYYY-MM-dd");*/
		StringBuffer sb = new StringBuffer();
		
		sb.append("{");
		sb.append("\"oaRlzybTalentPools\":");
		sb.append(oaRlzybTalentPool);
		/*sb.append(",\"oaRlzybPositions\":");
		sb.append(oaRlzybPosition);*/
		sb.append(",\"totalPageCount\":");
		sb.append(pageCount);
		sb.append(",\"totalCount\":");
		sb.append(count);
		sb.append(",\"currentPageNo\":");
		sb.append(PageIndex);
		sb.append("}");
		
		
		 return JSONArray.toJSONString(sb);
	}

	
	@RequestMapping("/talentReserve-add.html")
	public String OaRlzybTalentPool(HttpServletRequest request){
		
		oaRlzybPositions = oaRlzybPositionService.selectAll();
		
		request.setAttribute("oaRlzybPositions", oaRlzybPositions);
		
		return "human_resource_department/talentReserve_add";
		
	}
	
	@RequestMapping("/talentReserve.html")
	public String addOaRlzybTalentPool(
			@RequestParam(required=false) String talent_pool_name,
			@RequestParam(required=false) String talent_pool_sex,
			@RequestParam(required=false) String talent_pool_birthday,
			@RequestParam(required=false) String talent_pool_age,
			@RequestParam(required=false) String position_id,
			@RequestParam(required=false) String talent_pool_salaryExpect,
			@RequestParam(required=false) String talent_pool_addTime,
			@RequestParam(required=false) String talent_pool_phone,
			@RequestParam(required=false) String talent_pool_work_experience,
			
			@RequestParam(value="pageIndex",required=false) String pageIndex,
			Model model,
			
			HttpServletRequest request,HttpServletResponse response){
				
		OaRlzybTalentPool oaRlzybTalentPool = new OaRlzybTalentPool();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = null;
		Date addtime = null;
		if(talent_pool_birthday != null || talent_pool_birthday != ""){
			try {
				birthday = sdf.parse(talent_pool_birthday);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if(talent_pool_addTime != null || talent_pool_addTime != ""){
			try {
				addtime = sdf.parse(talent_pool_addTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		oaRlzybTalentPool.setTalent_pool_name(talent_pool_name);
		oaRlzybTalentPool.setTalent_pool_sex(talent_pool_sex);
		oaRlzybTalentPool.setTalent_pool_birthday(birthday);
		
		if(position_id != null || position_id != ""){
			oaRlzybTalentPool.setPosition_id(Integer.parseInt(position_id));
		}
		if(talent_pool_age != null || talent_pool_age != ""){
			oaRlzybTalentPool.setTalent_pool_age(Integer.parseInt(talent_pool_age));
		}
		
		String start = request.getParameter("start").toString();
		String end = request.getParameter("end").toString();
		talent_pool_salaryExpect = start + "~" + end;
		
		oaRlzybTalentPool.setTalent_pool_salaryExpect(talent_pool_salaryExpect);
		oaRlzybTalentPool.setTalent_pool_addTime(addtime);
		oaRlzybTalentPool.setTalent_pool_phone(talent_pool_phone);
		oaRlzybTalentPool.setTalent_pool_work_experience(talent_pool_work_experience);
		oaRlzybTalentPool.setTalent_pool_delectStatus(1);
		
		Date date = new Date();
		
		oaRlzybTalentPool.setCreate_time(date);
		
		Boolean flag = oaRlzybTalentPoolService.insertSelective(oaRlzybTalentPool);
		
		if(flag == true){
			return "human_resource_department/talentReserve_search";
		}
		
		return "human_resource_department/talentReserve_add";
		
	}

	@RequestMapping("/talentReserve_edit")
	public String talentReserve_edit(@RequestParam(required=false)String talent_pool_id,
			HttpServletRequest request){
		System.out.println("傳過來的参数："+talent_pool_id);
		
		Integer talentPoolId = 0;
		if(talent_pool_id != null){
			talentPoolId = Integer.parseInt(talent_pool_id);
		}
		
		oaRlzybTalentPool = oaRlzybTalentPoolService.selectByPrimaryKey(talentPoolId);
		oaRlzybPositions = oaRlzybPositionService.selectAll();
		request.setAttribute("oaRlzybTalentPool", oaRlzybTalentPool);
		request.setAttribute("oaRlzybPositions", oaRlzybPositions);
		
		System.out.println(oaRlzybTalentPool.getTalent_pool_salaryExpect());
		
		return "human_resource_department/talentReserve_edit";
	}
	
	@RequestMapping(value="/talentReserve_edit",method=RequestMethod.POST)
	public String talentReeserce2(
			@RequestParam(required=false)String talent_pool_id,
			@RequestParam(required=false)String talent_pool_name,
			@RequestParam(required=false)String talent_pool_sex,
			@RequestParam(required=false)String talent_pool_birthday,
			@RequestParam(required=false)String talent_pool_age,
			@RequestParam(required=false)String talent_pool_addTime,
			@RequestParam(required=false)String position_id,
			@RequestParam(required=false)String talent_pool_salaryExpect,
			@RequestParam(required=false)String talent_pool_phone,
			@RequestParam(required=false)String talent_pool_work_experience,
			@RequestParam(required=false)String start,
			@RequestParam(required=false)String end,
			HttpServletRequest request){
		
		OaRlzybTalentPool oa = new OaRlzybTalentPool();
		Integer talent_pool_id2 = 0;
		if(talent_pool_id != null){
			talent_pool_id2 = Integer.parseInt(talent_pool_id);
		}
		Integer talent_pool_age2 = 0;
		if(talent_pool_age != null){
			talent_pool_age2 = Integer.parseInt(talent_pool_age);
		}
		Integer position_id2 = 0;
		if(position_id != null){
			position_id2 = Integer.parseInt(position_id);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = null;
		Date addtime = null;
		if(talent_pool_birthday != null || talent_pool_birthday != ""){
			try {
				birthday = sdf.parse(talent_pool_birthday);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			oa.setTalent_pool_birthday(birthday);
			oa.setTalent_pool_age(talent_pool_age2);
		}
		if(talent_pool_addTime != null || talent_pool_addTime != ""){
			try {
				addtime = sdf.parse(talent_pool_addTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			oa.setTalent_pool_addTime(addtime);
		}
		
		oa.setTalent_pool_id(talent_pool_id2);
		oa.setTalent_pool_name(talent_pool_name);
		oa.setTalent_pool_sex(talent_pool_sex);
		oa.setPosition_id(position_id2);
		if(start != null && end != null){
			oa.setTalent_pool_salaryExpect(start + "~" + end);
		}
		oa.setTalent_pool_phone(talent_pool_phone);
		oa.setTalent_pool_work_experience(talent_pool_work_experience);
		
		Boolean flag = oaRlzybTalentPoolService.updateByPrimaryKeySelective(oa);
		
		if(flag == true){
			return "human_resource_department/talentReserve_search";
		}
		
		return "human_resource_department/talentReserve_edit";
	}
	
	@RequestMapping("/talentReserve_show")
	public String showTalentReserve(@RequestParam(required=false)String talent_pool_id,
			HttpServletRequest request){
		
		System.out.println("傳過來的参数："+talent_pool_id);
		
		Integer talentPoolId = 0;
		if(talent_pool_id != null){
			talentPoolId = Integer.parseInt(talent_pool_id);
		}
		
		oaRlzybTalentPool = oaRlzybTalentPoolService.selectByPrimaryKey(talentPoolId);
		oaRlzybPositions = oaRlzybPositionService.selectAll();
		request.setAttribute("oaRlzybTalentPool", oaRlzybTalentPool);
		request.setAttribute("oaRlzybPositions", oaRlzybPositions);
		
		Date talent_pool_birthday =  oaRlzybTalentPool.getTalent_pool_birthday();
		Date talent_pool_addTime = oaRlzybTalentPool.getTalent_pool_addTime();
		
		int year = talent_pool_birthday.getYear() + 1900;
		int month = talent_pool_birthday.getMonth() + 1;
		int day = talent_pool_birthday.getDate();
		
		String mon = "" + month;
		String date = "" + day;
		
		if(month < 10){
			mon = "0" + month;
		}
		if(day < 10){
			date = "0" + day;
		}
		
		String birthday = year + "-" + mon + "-" + date;
		
		int year2 = talent_pool_addTime.getYear() + 1900;
		int month2 = talent_pool_addTime.getMonth() + 1;
		int day2 = talent_pool_addTime.getDate();
		
		String mon2 = "" + month2;
		String date2 = "" + day2;
		
		if(month2 < 10){
			mon2 = "0" + month2;
		}
		if(day2 < 10){
			date2 = "0" + day2;
		}
		
		String addtime = year2 + "-" + mon2 + "-" + date2;
		
		System.out.println(year);
		System.out.println(year2);
		
		request.setAttribute("birthday", birthday);
		request.setAttribute("addtime", addtime);
		return "human_resource_department/talentReserve_show";
		
	}
	
	@ResponseBody
	@RequestMapping("/talentReserve_delete")
	public Object talentReserve_delete(
			@RequestParam(required=false)String talent_pool_id){
		
		System.out.println("傳過來的参数："+talent_pool_id);
		
		Integer talent_pool_id2 = 0;
		
		if(talent_pool_id != null && talent_pool_id != ""){
			talent_pool_id2 = Integer.parseInt(talent_pool_id);
		}
		
		Boolean flag = oaRlzybTalentPoolService.updateByTalentPoolId(talent_pool_id2);
		
		/*if(flag == true){
			return "redirect:/talentReserve_search.html";
		}*/
		
		return JSONArray.toJSONString(flag);
		
	}
}
