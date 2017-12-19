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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJzbDailyschedule;
import cn.tyyhoa.pojo.OaJzbDailyworkcontent;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaJzbDailyworkcontentService;
import cn.tyyhoa.util.OaJzbRevoke;

@SuppressWarnings("unused")
@Controller
public class OaJzbDailyController {
	
	@Autowired
	OaJzbDailyworkcontentService  oaJzbDailyworkcontentService;
	//跳转个人列表页面
	@RequestMapping("Dailygeren")
	public String Dailygeren(){
 		return "teach_nature_department/jzb/daily";
 	}
	//显示全部员工日报表列表AJAX
			@ResponseBody
			@RequestMapping(value="/showDailyone",produces="application/json;charset=utf-8")
			public Object showDailyone(String bieTime,String outTime,String index,HttpSession session){
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
				OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
				//需要登录人的ID
		 		int row = oaJzbDailyworkcontentService.getCountDaily(loginUser.getEmp_id(),date,date1);
		 		//得到总页数
		 		int pagecount= row % 10==0?row/10:(row/10)+1;
				List<OaJzbDailyworkcontent> OaJzbDailyworkcontents= oaJzbDailyworkcontentService.getDailyWorkcontents(loginUser.getEmp_id(),Integer.parseInt(index),10,date,date1);
				List<Object> fals = new ArrayList<>();
				for (int i = 0; i < OaJzbDailyworkcontents.size(); i++) {
					OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
					boolean a = oaJzbRevoke.Revoke(OaJzbDailyworkcontents.get(i).getEntrytime());
					fals.add(a);
				}
				//48小时
				
				String OaJzbDailyworkcontent = JSONArray.toJSONStringWithDateFormat(OaJzbDailyworkcontents, "yyyy-MM-dd");
				 map.put("fals", fals);	
				map.put("row", row);
				 map.put("pagecount", pagecount);
				 map.put("index", Integer.parseInt(index));
				 map.put("OaJzbDailyworkcontent", OaJzbDailyworkcontent);
				 return JSONArray.toJSONString(map);
			}
			/*查看个人列表详情*/
			@RequestMapping("showdailyone1/{entrytime}/{teacher_id}")
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
				 return "teach_nature_department/jzb/showdailyone";
			}
			//跳转修改页面
			@RequestMapping("/updatedailyone")
			public String updatedaily(HttpServletRequest requset,HttpSession session){
				 Date date1 = (Date) session.getAttribute("date1");
				 System.out.println(date1);
				 
				 int teacher_id = (int) session.getAttribute("teacher_id");
				 System.out.println(teacher_id);
				 OaJzbDailyworkcontent oaJzbDailyworkcontent  = oaJzbDailyworkcontentService.getDailyworkcontentById(date1,teacher_id);
				 List<OaJzbDailyschedule> oaJzbDailyschedules = oaJzbDailyworkcontentService.getDailyschedulsByteacher_id(date1,teacher_id);
				
				 requset.setAttribute("oaJzbDailyworkcontent", oaJzbDailyworkcontent);
				 requset.setAttribute("oaJzbDailyschedules", oaJzbDailyschedules);
				return "teach_nature_department/jzb/updatedailyone";
			}
			//修改
			@RequestMapping("/updatedailyviewone/{dailyworkcontent_id}")
			public String updatedailyview(@PathVariable("dailyworkcontent_id") String dailyworkcontent_id,String theContentOfThework,String morningwork,String afternoonjobcontent,String remarks,String[]contentsoftheclass,String [] dailyschedule_id){
				//单条插入
				int row = oaJzbDailyworkcontentService.UpdateDailyworkconte(theContentOfThework, morningwork, afternoonjobcontent, remarks,Integer.parseInt(dailyworkcontent_id));
				//批量插入
				for (int i = 0; i < dailyschedule_id.length; i++) {
					oaJzbDailyworkcontentService.UpdateDailschedul(contentsoftheclass[i], Integer.parseInt(dailyschedule_id[i]));
				}
				if(row==1){
					return "redirect:/Dailygeren";
				}else{
					return "redirect:/updatedailyone";
				}
			}
			//删除日报表
			@RequestMapping("/deletedailyone/{entrytime}/{dailyworkcontent_id}")
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
				return "redirect:/Dailygeren";
			}
			
}
