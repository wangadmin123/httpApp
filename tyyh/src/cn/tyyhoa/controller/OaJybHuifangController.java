package cn.tyyhoa.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJybVisit;
import cn.tyyhoa.pojo.OaRlzybPosition;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaJybChronicleService;
import cn.tyyhoa.service.OaJybHuifangService;

@RequestMapping("/employment_department")
@Controller
public class OaJybHuifangController {
	@Autowired
	OaJybHuifangService oaJybHuifangService;
	@Autowired
	OaJybChronicleService oaJybChronicleService;
	
	public OaJybHuifangService getOaJybHuifangService() {
		return oaJybHuifangService;
	}

	public void setOaJybHuifangService(OaJybHuifangService oaJybHuifangService) {
		this.oaJybHuifangService = oaJybHuifangService;
	}

	@RequestMapping(value="/huifang")
	public String kjl(HttpServletRequest request,HttpSession session){
		OaRlzybUser user =(OaRlzybUser) session.getAttribute("loginUser"); 
		OaRlzybPosition posutio = user.getPosition();
		List<OaJybVisit> fff=oaJybHuifangService.GetGrades(posutio.getPosition_id(),user.getEmp_id());
		request.setAttribute("grades", fff);
		return "employment_department/huifang";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/huifanglist",produces="application/json;charset=utf-8",method=RequestMethod.POST)
 	@ResponseBody
 	public String okk(String studentname,String gradename,Integer index, Integer pageSize,HttpSession session){
		 HashMap<String, Object>	result = new HashMap<String, Object>();
		 OaRlzybUser user =(OaRlzybUser) session.getAttribute("loginUser"); 
			OaRlzybPosition posutio = user.getPosition();
		 int count = oaJybHuifangService.Gethfcounts(studentname, gradename,posutio.getPosition_id(),user.getEmp_id());
		 
		 int counts=count%10==0?count/10:count/10+1;
		 
		 List<OaJybVisit> visits=oaJybHuifangService.GetHuifang(studentname, gradename, index, 10,posutio.getPosition_id(),user.getEmp_id());
		 result.put("index", index);
		 result.put("count", counts);
		 result.put("visits", visits);
		 
		 
		  return JSONArray.toJSONStringWithDateFormat(result, "yyyy-MM-dd HH:mm");
		
	}
	@RequestMapping(value="/huifangxinxi.html")
	public String sggs(String id,HttpServletRequest request){
		
		List<OaJybVisit>
		 oaJybVisit = oaJybHuifangService.GetHuifangById(Integer.parseInt(id));
		
		DateFormat  df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for (Iterator<OaJybVisit> iterator = oaJybVisit.iterator(); iterator.hasNext();) {
			OaJybVisit oaJybVisit2 = iterator.next();
			if(oaJybVisit2.getVisit_createtime()!=null){
				oaJybVisit2.setXianshishijian(df.format(oaJybVisit2.getVisit_createtime()));
			}
			
		}
		
		request.setAttribute("oaJybVisit", oaJybVisit);
	
		
		return "employment_department/chakanhuifang";
		
	}
	
	@RequestMapping(value="/addhuifang")
	public String sge(Integer id,HttpSession session){
		session.setAttribute("stuid", id.toString());
		
		return "employment_department/addhuifang";
	}
	
	@RequestMapping(value="/tianjiahuifang",method=RequestMethod.POST)
	public String sgee(String id,OaJybVisit oaJybVisi,HttpServletRequest request){
		oaJybVisi.setVisit_studentId(Integer.parseInt(id));
	     Date date = new Date();
	    
	     oaJybVisi.setVisit_createtime(date);
		
		oaJybHuifangService.insertSelective(oaJybVisi);
		OaJybChronicle oaJybChronicle = new OaJybChronicle();
		oaJybChronicle.setEvent_time(date);
		oaJybChronicle.setStudent_id(Integer.parseInt(id));
		oaJybChronicle.setEvent_name("回访："+oaJybVisi.getVisit_content());
		oaJybChronicleService.insertSelective(oaJybChronicle);

		/*List<OaJybVisit>
		 oaJybVisit = oaJybHuifangService.GetHuifangById(Integer.parseInt(id));
		
		
		for (Iterator iterator = oaJybVisit.iterator(); iterator.hasNext();) {
			OaJybVisit oaJybVisit2 = (OaJybVisit) iterator.next();
			
			oaJybVisit2.setXianshishijian(df.format(oaJybVisit2.getVisit_createtime()));
		}
		
		request.setAttribute("oaJybVisit", oaJybVisit);
		System.out.println(oaJybVisit.size()+"++++++++++++++++++++");*/
		
		return "redirect:/employment_department/huifangxinxi.html?id="+id;
		/*return "employment_department/huifang";*/
		
	}
	

}
