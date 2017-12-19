package cn.tyyhoa.controller;


import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJybReport;
import cn.tyyhoa.pojo.OaRlzybUser;

import cn.tyyhoa.service.OaJybRecordService;

@RequestMapping("/employment_department")
@Controller
public class OaJybTableController {
	
	@Autowired
	OaJybRecordService oaJybRecordService;
	
	public OaJybRecordService getOaJybRecordService() {
		return oaJybRecordService;
	}
	public void setOaJybRecordService(OaJybRecordService oaJybRecordService) {
		this.oaJybRecordService = oaJybRecordService;
	}
	@RequestMapping(value="/addtable")
	public String  afsgs(HttpSession session){
		 OaRlzybUser user =(OaRlzybUser) session.getAttribute("loginUser"); 
	    
		
		String name=user.getName();
		session.setAttribute("ename", name);
		return "employment_department/addtable";
	}
	@RequestMapping(value="/tabletianjiaa")
	public String sgs(OaJybReport oaJybReport,String createtime,String plantime,HttpSession session
			
			){
		 OaRlzybUser user =(OaRlzybUser) session.getAttribute("loginUser"); 
	     int empid=user.getEmp_id();
		DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(createtime != null){oaJybReport.setReport_createtime(df.parse(createtime));}
			if(plantime != null)oaJybReport.setWork_plan_plantime(df.parse(plantime));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		oaJybReport.setTeacterid(empid);
		
		oaJybRecordService.insertSelective(oaJybReport);
		
		return "employment_department/looktable";
		
	}
	@RequestMapping(value="/tabletianjiaa1")//提交主管
	public String sgss(OaJybReport oaJybReport){
		
		oaJybReport.setTablestruts(1);
		System.out.println("************************************************8id"+oaJybReport.getReport_id());
		oaJybRecordService.updateByPrimaryKeySelective(oaJybReport);
		
		return "employment_department/looktable";
		
	}
	
	 
     @RequestMapping(value="/chakanbaobiao")
     public String sfsgs(){
		 
		return "employment_department/looktable";
	}
     
     @SuppressWarnings("unchecked")
	@RequestMapping(value="/showtable",produces="application/json;charset=utf-8",method=RequestMethod.POST)
 	@ResponseBody
 	public Object showcompany(Integer index,String tabletime,String tableType,HttpSession session){
    	 DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
    	 java.util.Date repotrtime;
    	 HashMap<String, Object>	result = new HashMap<String, Object>();
    	 OaRlzybUser user =(OaRlzybUser) session.getAttribute("loginUser"); 
		try {
			if(tabletime != null && tabletime !=""){repotrtime = df.parse(tabletime);
			List<OaJybReport> reports = oaJybRecordService.GetAllReport(index,10,tableType,repotrtime,user.getEmp_id());
			
	    	 int count = oaJybRecordService.allcounts(tableType,repotrtime,user.getEmp_id());
	    	 int counts=count%10==0?count/10:count/10+1;
	    	 result.put("index", index);
	    	 result.put("reports", reports);
	    	 result.put("count", counts);
			
			}
			else{
				
				List<OaJybReport> reports = oaJybRecordService.GetAllReport(index,10,tableType,null,user.getEmp_id());
				
		    	 int count = oaJybRecordService.allcounts(tableType,null,user.getEmp_id());
		    	 int counts=count%10==0?count/10:count/10+1;
		    	 result.put("index", index);
		    	 result.put("reports", reports);
		    	 result.put("count", counts);
			}
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 
    	 
    	
    	return JSONArray.toJSONStringWithDateFormat(result, "yyyy-MM-dd");
    	 
    	 
    	 
     }
     
     @RequestMapping(value="/showtable1",produces="application/json;charset=utf-8",method=RequestMethod.POST)
  	@ResponseBody
  	public Object showcompany(Integer index,String tabletime,String tableType,String report_people){
     	 DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
     	 java.util.Date repotrtime;
     	 HashMap<String, Object>	result = new HashMap<String, Object>();
 		try {
 			if(tabletime != null && tabletime !=""){repotrtime = df.parse(tabletime);
 			
 			List<OaJybReport> reports = oaJybRecordService.GetbumenReport(index, 10, tableType, repotrtime, report_people);
 			
 	    	 int count = oaJybRecordService.allbumencounts(tableType, repotrtime, report_people);
 	    	 int counts=count%10==0?count/10:count/10+1;
 	    	 result.put("index", index);
 	    	 result.put("reports", reports);
 	    	 result.put("count", counts);
 			
 			}
 			else{
 				
 				List<OaJybReport> reports = oaJybRecordService.GetbumenReport(index, 10, tableType,null, report_people);
 				
 				int count = oaJybRecordService.allbumencounts(tableType,null, report_people);
 		    	 int counts=count%10==0?count/10:count/10+1;
 		    	 result.put("index", index);
 		    	 result.put("reports", reports);
 		    	 result.put("count", counts);
 			}
 			
 			
 		} catch (ParseException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
     	 
     	 
     	
     	return JSONArray.toJSONStringWithDateFormat(result, "yyyy-MM-dd");
     	 
     	 
     	 
      }
      
     
     @RequestMapping(value="/jutire.html")
     public String sfsgsdgd(String id,HttpServletRequest request){
    	 OaJybReport  oaJybReport=oaJybRecordService.selectByPrimaryKey(Integer.parseInt(id));
    	 DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
    	String str=df.format(oaJybReport.getReport_createtime());
    	 String ss=df.format(oaJybReport.getWork_plan_plantime());
    	 request.setAttribute("oaJybReport", oaJybReport);
    	 request.setAttribute("time",str );
    	 request.setAttribute("timee", ss);
    	 return "employment_department/addtable1";
    	 
    	 
     }
     @RequestMapping(value="/jutire2.html")
     public String sfsgsdgd(String id,HttpServletRequest request,HttpSession session){
    	 OaJybReport  oaJybReport=oaJybRecordService.selectByPrimaryKey(Integer.parseInt(id));
    	 DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
    	String str=df.format(oaJybReport.getReport_createtime());
    	 String ss=df.format(oaJybReport.getWork_plan_plantime());
    	 request.setAttribute("oaJybReport", oaJybReport);
    	 request.setAttribute("time",str );
    	 request.setAttribute("timee", ss);
    	 return "employment_department/addtable2";
    	 
    	 
     }
     
     
     @RequestMapping(value="/chabaobiao")
     public String getpeople(HttpServletRequest request){
    	 
    	 List<OaJybReport> lists = oaJybRecordService.GetAllpeople();
    	 request.setAttribute("lists", lists);
    	 
		return "employment_department/lookbaobiao";
    	 
    	 
     }     
}
