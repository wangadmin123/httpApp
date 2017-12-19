package cn.tyyhoa.controller;






import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.service.OaJybChronicleService;
import cn.tyyhoa.service.OaJybChrscbService;




@RequestMapping("/employment_department")
@Controller
public class OaJybChronicleController {
	@Autowired
	OaJybChronicleService oaJybChronicleService;
    @Autowired
    OaJybChrscbService oaJybChrscbService;
	
	
	public OaJybChrscbService getOaJybChrscbService() {
		return oaJybChrscbService;
	}

	public void setOaJybChrscbService(OaJybChrscbService oaJybChrscbService) {
		this.oaJybChrscbService = oaJybChrscbService;
	}

	public OaJybChronicleService getOaJybChronicleService() {
		return oaJybChronicleService;
	}

	public void setOaJybChronicleService(OaJybChronicleService oaJybChronicleService) {
		this.oaJybChronicleService = oaJybChronicleService;
	}
	
	@RequestMapping(value="/jishi.html")
	public String getjishi(int id,HttpServletRequest request){
		
		
		request.setAttribute("stuid", id);
		
        
		return "employment_department/student";
		
		
	}
	@RequestMapping(value="/showjishi",produces="application/json;charset=utf-8",method=RequestMethod.POST)
 	@ResponseBody
 	public String egghe(String stuid){
		
		HashMap<String, Object>	result = new HashMap<String, Object>();
		List<OaJybChronicle> lists = oaJybChronicleService.GetChrobicleById(Integer.parseInt(stuid));
		//查询学员信息、时间
		List<Date> dates = new ArrayList<Date>();
		List<Date> dates1 = new ArrayList<Date>();
		List<OaScbRecord> list1=oaJybChrscbService.GetChrscbById(Integer.parseInt(stuid));
		 //查询市场部学员信息、时间
		for (Iterator<OaJybChronicle> iterator = lists.iterator(); iterator.hasNext();) {
			OaJybChronicle oaJybChronicle = iterator.next();
			dates.add(oaJybChronicle.getEvent_time());
		}
		for (Iterator<OaScbRecord> iterator = list1.iterator(); iterator.hasNext();) {
			OaScbRecord oaScbRecord = iterator.next();
			dates1.add(oaScbRecord.getEventTime());
		}
		
		
		
		List<List<OaJybChronicle>> newlist = new ArrayList<List<OaJybChronicle>>();
		
		for (Iterator<Date> iterator = dates.iterator(); iterator.hasNext();) {
			Date object = iterator.next();
			List<OaJybChronicle> lis = oaJybChronicleService.GetChronicleByTime(object,Integer.parseInt(stuid));
			newlist.add(lis);
			
		}
		
		OaJybChronicle oaJybChronicle = oaJybChronicleService.GetgradeStudent(Integer.parseInt(stuid));
		
		if(oaJybChronicle != null){result.put("stuname",oaJybChronicle.getStuname());
		result.put("gradename",oaJybChronicle.getGradename());
		result.put("newlist", newlist);
		}else{
	        result.put("stuname",null);
		result.put("gradename",null);
		result.put("newlist", null);
		}
		
		return JSONArray.toJSONStringWithDateFormat(result,"yyyy-MM-dd HH:mm");
		
		
	}
}
