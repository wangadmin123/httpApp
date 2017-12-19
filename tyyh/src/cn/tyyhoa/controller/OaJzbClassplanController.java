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
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaClassTeacher;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbClassplan;
import cn.tyyhoa.pojo.OaJzbGradedata;
import cn.tyyhoa.pojo.OaJzbTermstage;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaXsbDailypaper2;
import cn.tyyhoa.pojo.OaXsbWeek;
import cn.tyyhoa.service.OaJwbGradeService;
import cn.tyyhoa.service.OaJzbClassplanService;
import cn.tyyhoa.service.OaJzbClassplansumsService;
import cn.tyyhoa.service.OaRlzybEmployeeService;
import cn.tyyhoa.service.OaXsbDailypaper2Service;


@Controller
public class OaJzbClassplanController {
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	@Autowired
	OaJzbClassplanService oaJzbClassplanService;
	@Autowired
	OaJzbClassplansumsService oaJzbClassplansumsService;
	@Autowired
	OaJwbGradeService oaJwbGradeService;
	@Autowired
	OaXsbDailypaper2Service oaXsbDailypaper2Service;
	//跳转到添加带班计划页面
	@RequestMapping("/addClassPlan")
	public String addClassplan(String gradeid,HttpServletRequest requset,HttpSession session){
		session.setAttribute("gradeid", gradeid);
		List<OaJzbTermstage> OaJzbTermstages = oaJzbClassplanService.gettermstages();
		requset.setAttribute("OaJzbTermstages", OaJzbTermstages);
		return "teach_nature_department/jzb/addDbjh";
	}
	//添加带班计划
	@RequestMapping("/addDBJH")
	public String addDBJH(String Stage_id,String coursecontent,String
			question,String work,HttpSession session){
		String gradeid = (String) session.getAttribute("gradeid");
		//7 是登录人ID
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date1 = df.format(new Date());// new Date()为获取当前系统时间
		Date date2 = null; 
		try {
			date2=df.parse(date1.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}//转换为默认Date格式
		int row = oaJzbClassplanService.addClassplan(loginUser.getEmp_id(), question, work, Integer.parseInt(gradeid), Integer.parseInt(Stage_id), coursecontent, date2);
		if(row==1){
			return "redirect:/gradeShowListLink/"+gradeid;
		}else{
			return "redirect:/addClassPlan";
		}
		
	}
	//跳转添加带班总结页面
	@RequestMapping("/adddbjhSumView")
	public String adddbjhSumView(String gradeid,HttpSession session){
		session.setAttribute("gradeid", gradeid);
		return "teach_nature_department/jzb/addDbjhSum";
	}
	//添加带班计划总结
	@RequestMapping("/addDBJHSum")
	public String addDBJHSum(String sum,HttpSession session){
		String gradeid = (String) session.getAttribute("gradeid");
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date1 = df.format(new Date());// new Date()为获取当前系统时间
		Date date2 = null; 
		try {
			date2=df.parse(date1.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//转换为默认Date格式
		int row = oaJzbClassplansumsService.addDbjhSum(Integer.parseInt(gradeid), sum, loginUser.getEmp_id(),date2);
		if(row==1){
			return "redirect:/gradeShowListLink/"+gradeid;	
		}else{
			return "redirect:/adddbjhSumView";
		}
	}
	//跳转修改带班计划页面
	@RequestMapping("/editdbjh")
	public String editdbjh(String id,HttpServletRequest requset,HttpSession session){
		session.setAttribute("DBJHid", id);
		List<OaJzbTermstage> OaJzbTermstages = oaJzbClassplanService.gettermstages();
		requset.setAttribute("OaJzbTermstages", OaJzbTermstages);
		return "teach_nature_department/jzb/editdbjh";
	}
	//修改带班计划
	@RequestMapping("/UpdateDBJH")
	public String UpdateDBJH(String Stage_id,String coursecontent,String
			question,String work,HttpSession session){
		String id = (String) session.getAttribute("DBJHid");
		String gradeid = (String) session.getAttribute("gradeid");
		//修改
		int row = oaJzbClassplanService.UpdateClassplan(question, work, Integer.parseInt(Stage_id), coursecontent,Integer.parseInt(id));
		if(row==1){
			return "redirect:/gradeShowListLink/"+gradeid;
		}else{
			return "redirect:/editdbjh";
		}	
	}
	//删除带班计划
	@RequestMapping("/deletedbjh")
	public String deletedbjh(String id,HttpSession session){
		String gradeid = (String) session.getAttribute("gradeid");
		oaJzbClassplanService.deteleClassplan(Integer.parseInt(id));
		return "redirect:/gradeShowListLink/"+gradeid;
	}
	//跳转带班计划总结页面
	@RequestMapping("/editdbjhsumview")
	public String editdbjhsum(String id,HttpSession session){
		int id2 = Integer.parseInt(id);
		session.setAttribute("DBJHSUM_ID", id2);
		return "teach_nature_department/jzb/editdbjhsum";
	}
	//修改带班计划总结页面
	@RequestMapping("/UpdateDBJHSum")
	public String UpdateDBJHSum(String sum,HttpSession session){
		int id = (int) session.getAttribute("DBJHSUM_ID");
		int row = oaJzbClassplansumsService.UpdateClassplanSum(sum, id);
		String gradeid = (String) session.getAttribute("gradeid");
		if(row==1){
			return "redirect:/gradeShowListLink/"+gradeid;
		}else{
			return "redirect:/editdbjhsumview";
		}
	}
	//删除带班计划总结页面
	@RequestMapping("/deletedbjhsum")
	public String deletedbjhsum(String id,HttpSession session){
		int great_id = Integer.parseInt(id);
		String gradeid = (String) session.getAttribute("gradeid");
		oaJzbClassplansumsService.deleteClassplansum(great_id);
		return "redirect:/gradeShowListLink/"+gradeid;
	}
	/****以下为周考****/
	@ResponseBody
	@RequestMapping("showzhoukao")
	public Object showzhoukao(String stuID,String stu_name,String zhou,String index,HttpSession session){
		int r = Integer.parseInt(zhou);
		if(zhou.equals("0")&&stuID.equals("")&&stu_name.equals("")){
			List<OaXsbWeek> weeklists=oaJzbClassplanService.getWhatweek();
			r=weeklists.get(0).getWhatweek();
		}
		HashMap<String, Object> map = new HashMap<String,Object>();
		String gradeid = (String) session.getAttribute("gradeid");
		//得到总记录数
		int row = oaJzbClassplanService.getCountWeek(Integer.parseInt(gradeid), stuID, stu_name,r);
		int pagecount= row % 10==0?row/10:(row/10)+1;
		List<OaXsbWeek> OaXsbWeeks = oaJzbClassplanService.getWeeksByGradeId(Integer.parseInt(gradeid), stuID, stu_name, ((Integer.parseInt(index)-1)*10), 10,r);
		for (int i = 0; i < OaXsbWeeks.size(); i++) {
			System.out.println(OaXsbWeeks.get(i).getStu_name());
		}
		map.put("row", row);
		 map.put("pagecount", pagecount);
		 map.put("index", Integer.parseInt(index));
		 map.put("OaXsbWeeks", OaXsbWeeks);
		 return JSONArray.toJSONString(map);
	}
	
	//进入班级日常数据表页面
	@RequestMapping("showClassData")
	public String showClassData(Model model){
		List<OaJwbGrade> gradeList=oaJwbGradeService.selectGradeByTeacherId(0);;
		model.addAttribute("gradeList", gradeList);
		SimpleDateFormat  stf=new SimpleDateFormat ( "yyyy-MM-dd" );
		String times=stf.format(new Date());
		model.addAttribute("createTime", times);
		return "teach_nature_department/jzb/ShowClassData";
	}
	//班级日常数据查询
	@ResponseBody
	@RequestMapping("getClassData")
	public String getShowClassdata(Integer classId,String time) throws ParseException{
		SimpleDateFormat stf=new SimpleDateFormat( "yyyy-MM-dd" );
		Date times=stf.parse(time);
		OaClassTeacher tList=oaJzbClassplanService.gettList(classId);
		List<OaXsbDailypaper2> OaXsbDailypaper2=oaXsbDailypaper2Service.selectOaXsbDailypaper2(classId, times);
		List<OaJzbGradedata> gradeData=oaJzbClassplanService.getGradedata(classId,times);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("count", OaXsbDailypaper2);
		map.put("gradeData",gradeData);
		map.put("tList",tList);
		return JSON.toJSONString(map);
	}
}
