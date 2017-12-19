package cn.tyyhoa.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;


import cn.tyyhoa.pojo.OaJzbDailyschedule;
import cn.tyyhoa.pojo.OaJzbDailyworkcontent;
import cn.tyyhoa.pojo.OaJzbPatrolgrade;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaJzbDailyworkcontentService;
import cn.tyyhoa.util.OaJzbRevoke;


@Controller
public class OaJzbDailypaperController {
	@Autowired
	OaJzbDailyworkcontentService  oaJzbDailyworkcontentService;
	//跳转到员工日报表列表
	 	@RequestMapping("DailyStaffList")
	 	public String DailyStaffList(HttpServletRequest request){
	 		List<OaRlzybEmployee> OaRlzybEmployees = oaJzbDailyworkcontentService.getJzbEmp_names();
	 		request.setAttribute("OaRlzybEmployees", OaRlzybEmployees);	
	 		return "teach_nature_department/jzb/dailylist";
	 	}
	 //显示全部员工日报表列表AJAX
		@ResponseBody
		@RequestMapping(value="/showDailyList",produces="application/json;charset=utf-8")
		public Object showDailyList(String bieTime,String outTime,String index,String empid){
			if(bieTime.length()==0){
				if(outTime.length()!=0){
					bieTime="2000-01-01";
				}else{
					bieTime="";
				}
				
			}
			if(outTime.length()==0){
				if(bieTime.length()!=0){
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					String a = df.format(new Date());
					outTime=a;
				}else{
					outTime="";
				}
				
			}
			Date date=null;
			Date date1=null;
			if(!bieTime.equals("")&&bieTime!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式		
				try {
					date=sdf.parse(bieTime.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//转换为默认Date格式
			}
			if(outTime!=null&&!outTime.equals("")){
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
				
				try {
					date1=sdf1.parse(outTime.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//转换为默认Date格式
			}
			HashMap<String, Object> map = new HashMap<String,Object>();
			//得到总记录数
	 		int row = oaJzbDailyworkcontentService.getCount(Integer.parseInt(empid),date,date1);
	 		//得到总页数
	 		int pagecount= row % 10==0?row/10:(row/10)+1;
			List<OaJzbDailyworkcontent> OaJzbDailyworkcontents= oaJzbDailyworkcontentService.getDailyWorkcontents(Integer.parseInt(empid),Integer.parseInt(index),10,date,date1);
			List<Object> fals = new ArrayList<>();
			for (int i = 0; i < OaJzbDailyworkcontents.size(); i++) {
				OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
				boolean a = oaJzbRevoke.Revoke(OaJzbDailyworkcontents.get(i).getEntrytime());
				fals.add(a);
			}
			String OaJzbDailyworkcontent = JSONArray.toJSONStringWithDateFormat(OaJzbDailyworkcontents, "yyyy-MM-dd");
			 map.put("fals", fals);	
			 map.put("row", row);
			 map.put("pagecount", pagecount);
			 map.put("index", Integer.parseInt(index));
			 map.put("OaJzbDailyworkcontent", OaJzbDailyworkcontent);
			 return JSONArray.toJSONString(map);
		}
		/*查看个人列表详情*/
		@RequestMapping("showdaily/{entrytime}/{teacher_id}")
		public String showdaily( @PathVariable("entrytime") String entrytime, @PathVariable("teacher_id") String teacher_id,HttpServletRequest requset,HttpSession session){
			Date date1=null;
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			try {
				date1=sdf1.parse(entrytime.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//转换为默认Date格式
			session.setAttribute("date1", date1);
			session.setAttribute("teacher_id", Integer.parseInt(teacher_id));
			 OaJzbDailyworkcontent oaJzbDailyworkcontent  = oaJzbDailyworkcontentService.getDailyworkcontentById(date1, Integer.parseInt(teacher_id));
			 List<OaJzbDailyschedule> oaJzbDailyschedules = oaJzbDailyworkcontentService.getDailyschedulsByteacher_id(date1, Integer.parseInt(teacher_id));
			 requset.setAttribute("oaJzbDailyworkcontent", oaJzbDailyworkcontent);
			 requset.setAttribute("oaJzbDailyschedules", oaJzbDailyschedules);
			 return "teach_nature_department/jzb/showdaily";
		}
		//跳转修改页面
		@RequestMapping("/updatedaily")
		public String updatedaily(HttpServletRequest requset,HttpSession session){
			 Date date1 = (Date) session.getAttribute("date1");
			 int teacher_id = (int) session.getAttribute("teacher_id");
			 OaJzbDailyworkcontent oaJzbDailyworkcontent  = oaJzbDailyworkcontentService.getDailyworkcontentById(date1,teacher_id);
			 List<OaJzbDailyschedule> oaJzbDailyschedules = oaJzbDailyworkcontentService.getDailyschedulsByteacher_id(date1,teacher_id);
			 requset.setAttribute("oaJzbDailyworkcontent", oaJzbDailyworkcontent);
			 requset.setAttribute("oaJzbDailyschedules", oaJzbDailyschedules);
			return "teach_nature_department/jzb/updatedaily";
		}
		//修改
		@RequestMapping("/updatedailyview/{dailyworkcontent_id}")
		public String updatedailyview(@PathVariable("dailyworkcontent_id") String dailyworkcontent_id,String theContentOfThework,String morningwork,String afternoonjobcontent,String remarks,String[]contentsoftheclass,String [] dailyschedule_id){
			//单条插入
			if(dailyschedule_id.length==0){
				dailyschedule_id[0]="0";
			}
			if(contentsoftheclass.length==0){
				contentsoftheclass[0]=null;
			}
			int row = oaJzbDailyworkcontentService.UpdateDailyworkconte(theContentOfThework, morningwork, afternoonjobcontent, remarks,Integer.parseInt(dailyworkcontent_id));
			//批量插入
			for (int i = 0; i < dailyschedule_id.length; i++) {
					oaJzbDailyworkcontentService.UpdateDailschedul(contentsoftheclass[i], Integer.parseInt(dailyschedule_id[i]));
			}
			if(row==1){
				return "redirect:/DailyStaffList";
			}else{
				return "redirect:/updatedaily";
			}
		}
		//跳转页面
		/*@RequestMapping("addadilyview")
		public String addadilyview(HttpServletRequest request,HttpSession session,String teacheraa){
			//获取系统时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			System.out.println(teacheraa);
			request.setAttribute("data",df.format(new Date()));		
			return "teach_nature_department/jzb/adddaily";
		}*/
		
		@RequestMapping("addadilyview")
		public String addadilyviewa(HttpServletRequest request,HttpSession session,String teacheraa){
			//获取系统时间
			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			Date date1=null;
			String today = sdf1.format(date);
			try {
				date1 = sdf1.parse(today.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(teacheraa);
			System.out.println(date1);
			System.out.println(today);
			OaJzbDailyworkcontent oaJzbDailyworkcontent  = oaJzbDailyworkcontentService.getDailyworkcontentById(date1, Integer.parseInt(teacheraa));
			if(oaJzbDailyworkcontent==null){
				request.setAttribute("data",today);		
				return "teach_nature_department/jzb/adddaily";
			}else{
				return "errorrb";
			}
			
		}
		
		//添加日报表
		@RequestMapping("adddaily")
		public String adddaily(HttpServletRequest request,String[] Starttime,String[] Outtime,String[] Contentsoftheclass,
				String theContentOfThework,String morningwork,String afternoonjobcontent,String remarks, HttpSession session){
			OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
			//获取系统时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			String format =  df.format(new Date());	
			Date date3=null;
			try {
				date3=df.parse(format.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//转换为默认Date格式
			//转换时间 String 转 Date
			Date date=null;
			Date date1=null;
			for (int i = 0; i < Contentsoftheclass.length-1; i++) {
				String da = format+" "+Starttime[i];
				String da1 = format+" "+Outtime[i];
				if(!da.equals("")&&da!=null){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式		
					try {
						date=sdf.parse(da.toString());
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}//转换为默认Date格式
				}
				if(da1!=null&&!da1.equals("")){
					SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式
					
					try {
						date1=sdf1.parse(da1.toString());
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}//转换为默认Date格式
				}	
			
			int row = oaJzbDailyworkcontentService.addDailyschedule(date, date1, date3, Contentsoftheclass[i], loginUser.getEmp_id());
			if(row!=1){
				return "redirect:/addadilyview";
			}
			}
			int sum = oaJzbDailyworkcontentService.addDailyworkconten(date3, loginUser.getEmp_id(), theContentOfThework, morningwork, afternoonjobcontent, remarks);
			if(sum!=1){
				return "redirect:/addadilyview";
			}else{
				return "redirect:/DailyStaffList";
			}
		}
		//删除日报表
		@RequestMapping("/deletedaily/{entrytime}/{dailyworkcontent_id}")
		public String deletedaily(@PathVariable("dailyworkcontent_id") String dailyworkcontent_id,@PathVariable("entrytime") String entrytime){
			Date date=null;
			if(!entrytime.equals("")&&entrytime!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式		
				try {
					date=sdf.parse(entrytime.toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//转换为默认Date格式
			}
			oaJzbDailyworkcontentService.deleteDaily(Integer.parseInt(dailyworkcontent_id));
			oaJzbDailyworkcontentService.deleteDilyworkcontent(date, Integer.parseInt(dailyworkcontent_id));
			return "redirect:/DailyStaffList";
		}
}
