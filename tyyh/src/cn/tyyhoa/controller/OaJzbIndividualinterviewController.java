package cn.tyyhoa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbIndividualinterview;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.service.OaJzbIndividualinterviewService;

@Controller
public class OaJzbIndividualinterviewController {
	private Logger logger = Logger.getLogger("OaJzbIndividualinterviewController.class");
	
	@Autowired
	OaJzbIndividualinterviewService oaJzbIndividualinterviewService;
	
	/*跳转到添加个性访谈页面*/
	@RequestMapping(value="/addstuterview.html")
	public String addstuterview(){
		return "teach_nature_department/jzb/addstuterview";
	}
	
	/*添加个性化访谈成功*/
	@RequestMapping(value="/showgrade.html",method=RequestMethod.POST)
	public String addIndividualinterview(@ModelAttribute OaJzbIndividualinterview oaJzbIndividualinterview,HttpServletRequest request,HttpSession session){
		String gradeid1 = (String) session.getAttribute("gradeid");
		int gradeid = Integer.parseInt(gradeid1);
		oaJzbIndividualinterview.setGrade_id(gradeid);
		oaJzbIndividualinterview.setDeleteStatus(0);
		boolean flag = oaJzbIndividualinterviewService.addIndividualinterview(oaJzbIndividualinterview);
		if(flag){
			return "redirect:/oaJwbGradeslist.html";
		}else{
			return "redirect:/addstuterview.html";
		}
		
	}
	
	/*跳转到修改个性化访谈界面*/
	@RequestMapping(value="/editInterview")
	public String editInterview(String id,HttpServletRequest request){
		OaJzbIndividualinterview oaJzbIndividualinterview = oaJzbIndividualinterviewService.getStuIndividualinterviewById(Integer.parseInt(id));
		request.setAttribute("oaJzbIndividualinterview", oaJzbIndividualinterview);
		return "teach_nature_department/jzb/editInterview";
	}
	
	
	/*修改个性化访谈*/
	@RequestMapping(value="/modifyInterview",method=RequestMethod.POST)
	public String modifyInterview(@ModelAttribute OaJzbIndividualinterview oaJzbIndividualinterview){
		boolean flag = oaJzbIndividualinterviewService.editStuIndividualinterview(oaJzbIndividualinterview);
		if(flag){
			return "redirect:/oaJwbGradeslist.html";
		}else{
			return "redirect:/editInterview";
		}
	}
	
	/*删除个性化访谈*/
	@RequestMapping(value="/deleteInterview")
	public String deleteInterview(String id){
		boolean flag = oaJzbIndividualinterviewService.deleteStuIndividualinterview(Integer.parseInt(id));
		if(flag){
			return "redirect:/oaJwbGradeslist.html";
		}else{
			return "redirect:/oaJwbGradeslist.html";
		}
	}
	
	/*学期*/
	@RequestMapping(value = "/semesterlist", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String semesterlist() {
		List<OaJwbSemester> semesters = oaJzbIndividualinterviewService.semesters();
		return JSONArray.toJSONString(semesters);
	}
	
	
	/*查看个性化访谈*/
	@RequestMapping(value="/selectgrade.html")
	public String showIndividualinterview(
			@RequestParam(required = false) String searchName,
			@RequestParam(required = false) String Term_id,
			@RequestParam(required = false) String month,
			@RequestParam(required = false) String grade_id,
			HttpSession session){
		/*System.out.println("************"+searchName);*/
		List<OaJzbIndividualinterview> stus = oaJzbIndividualinterviewService.stuList(searchName,Integer.parseInt(Term_id),month,Integer.parseInt(grade_id));
		/*System.out.println(stus.size());*/
		session.setAttribute("stuInfoList", stus);
		return "teach_nature_department/jzb/selectgrade";
	}
	
}
