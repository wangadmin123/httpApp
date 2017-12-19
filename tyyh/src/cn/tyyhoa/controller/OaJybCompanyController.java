package cn.tyyhoa.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJybCompany;
import cn.tyyhoa.service.OaJybCompanyService;
@RequestMapping("/employment_department")
@Controller
public class OaJybCompanyController {
	@Autowired
	OaJybCompanyService oaJybCompanyService ;

	@RequestMapping(value="/jiuye.html")
	public String sdsd(){
		
		return "employment_department/index";
		
	}
	
	@RequestMapping(value="/showlist.html")
	public String ddd(HttpServletRequest request){
		
		List<OaJybCompany> stations = oaJybCompanyService.GetStations();
		request.setAttribute("stations", stations);
		List<OaJybCompany> citys = oaJybCompanyService.GetCitys();
		request.setAttribute("citys", citys);
		
		
		/*List<OaJybCompany> companys = oaJybCompanyService.GetCompanyByContent("众",null,null,null, 1, 5);
		request.setAttribute("companys", companys);*/
		return "employment_department/companylist";
		
		
		
	}
	
	

	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/showlist",produces="application/json;charset=utf-8",method=RequestMethod.POST)
	@ResponseBody
	public Object showcompany(String company_name,
			String company_station, String company_city,
			String company_category, Integer index, Integer pageSize,HttpServletRequest request){
	     
		
	     HashMap<String, Object>	result = new HashMap<String, Object>();
	     String company_pinyin = new String();
		if(company_name==null){
			company_name=null;
			company_pinyin=null;
		}else{
			char[] emp_name_chars = company_name.toCharArray();
			for (int i = 0; i < emp_name_chars.length; i++) {
				if ((int) emp_name_chars[i] >= 97 && (int) emp_name_chars[i] <= 122) {
					company_pinyin = company_name.toUpperCase();
					company_name=null;	
					break;
				} else if ((int) emp_name_chars[i] >= 65
						&& (int) emp_name_chars[i] <= 90) {
					company_pinyin=company_name;
					company_name=null;	
					break;
				} else {
					company_pinyin=null;
				}
			}
		}
		
		
		
	   List<OaJybCompany> companys = oaJybCompanyService.GetCompanyByContent(company_name,company_pinyin,company_station,company_city,company_category, index, 10);
	   List<OaJybCompany> stations = oaJybCompanyService.GetStations();
		
		List<OaJybCompany> citys = oaJybCompanyService.GetCitys();
		int count =oaJybCompanyService.GetCountsByContent(company_name,company_pinyin, company_station, company_city, company_category);
	     int counts=count%10==0?count/10:count/10+1;
		result.put("index", index);
	   result.put("companys", companys);
	   result.put("stations",stations);
	   result.put("citys", citys);
	   result.put("count", counts);
	    /*StringBuffer stf = new StringBuffer();
	    for (int i = 0; i < companys.size(); i++) {
	    	
			stf.append("<tr><td><input type=\"checkbox\" name=\"CheckBox\" value=\"pro1\"/></td><td ><a href=\"company.html\" >"+companys.get(i).getCompany_id()+"</a></td><td>"+companys.get(i).getCompany_name()+"</td><td>"+companys.get(i).getCompany_job()+"</td> <td>"+companys.get(i).getCompany_phone()+"</td><td>"+companys.get(i).getCompany_station()+"</td><td>"+companys.get(i).getCompany_scope()+"</td> <td>"+companys.get(i).getCompany_category()+"</td><td>"+companys.get(i).getCompany_trade()+"</td> <td>"+companys.get(i).getCompany_type()+"</td><td>"+companys.get(i).getCompany_Address()+"</td> <td><a href=\"xiugaiqiye.html\" class=\"edit\">编辑</a></td> </tr>");
		}
		System.out.println(stf);
		return stf.toString();*/
	   
	    
	    return JSONArray.toJSONString(result);
	    
	}
	
	@RequestMapping(value="/company.html")
	public String sfsg(String id,HttpServletRequest request){
		System.out.println("***********"+id);
		int cid = Integer.parseInt(id);
		OaJybCompany oaJybCompany = oaJybCompanyService.selectByPrimaryKey(cid);
		 request.setAttribute("company", oaJybCompany);
		return "employment_department/company";
	}
	@RequestMapping(value="/xiugaiqiye.html")
	public String xiugai(String id,HttpServletRequest request){
		int cid = Integer.parseInt(id);
		OaJybCompany oaJybCompany = oaJybCompanyService.selectByPrimaryKey(cid);
		 request.setAttribute("company", oaJybCompany);
		 String str=oaJybCompany.getCompany_station();
		 String[] strs = str.split("、");
		 request.setAttribute("stations", strs);
		 
		 
		return "employment_department/xiugaiqiye";
		
		
		
		
	}
	
	
	@RequestMapping(value="/getstation",produces="application/json;charset=utf-8",method=RequestMethod.POST)
	@ResponseBody
	public String wfgwg(String[] station){
		String str="";
		boolean flag1=true;
		boolean flag2=true;
		boolean flag3=true;
		boolean flag4=true;
		boolean flag5=true;
		boolean flag11=true;
		boolean flag6=true;
		boolean flag7=true;
		boolean flag8=true;
		boolean flag9=true;
		boolean flag10=true;
		
		
		
		
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			str+= "<input  type='checkbox'  name='station'  class='checkedStyle' checked='checked' value='"+string+"'/>"+string+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("java开发工程师")){flag1=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("android开发工程师")){flag2=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("实施工程师")){flag3=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("软件测试")){flag4=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("需求工程师")){flag5=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("系统架构设计师")){flag6=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("网页设计制作")){flag7=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("用户界面UI设计")){flag8=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("游戏设计开发")){flag9=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("软件研发工程师")){flag10=false;break;}
		}
		for (int i = 0; i < station.length; i++) {
			String string = station[i];
			
			if(string.equals("数据库开发工程师")){flag11=false;break;}
		}
		
	   
		
		if(flag1==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='java开发工程师'/>java开发工程师&nbsp;&nbsp;&nbsp;&nbsp;";}
		if(flag2==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='android开发工程师'/>android开发工程师&nbsp;&nbsp;&nbsp;&nbsp;";}
		if(flag3==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='实施工程师'/>实施工程师&nbsp;&nbsp;&nbsp;&nbsp;";}
		if(flag4==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='软件测试'/>软件测试&nbsp;&nbsp;&nbsp;&nbsp;";}
		if(flag5==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='需求工程师'/>需求工程师&nbsp;&nbsp;&nbsp;&nbsp;";}
		str+="<br/>";
		if(flag6==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='系统架构设计师'/>系统架构设计师&nbsp;&nbsp;&nbsp;&nbsp;";}
		
		if(flag7==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='网页设计制作'/>网页设计制作&nbsp;&nbsp;&nbsp;&nbsp;";}
		if(flag8==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='用户界面UI设计'/>用户界面UI设计&nbsp;&nbsp;&nbsp;&nbsp;";}
		if(flag9==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='游戏设计开发'/>游戏设计开发&nbsp;&nbsp;&nbsp;&nbsp;";}
		if(flag10==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='软件研发工程师'/>软件研发工程师&nbsp;&nbsp;&nbsp;&nbsp;";}
		if(flag11==true){str+= "<input  type='checkbox'  name='station'  class='checkedStyle'  value='数据库开发工程师'/>数据库开发工程师&nbsp;&nbsp;&nbsp;&nbsp;";}
		
		return str;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/qiyexiugai")
	public String fsggs(OaJybCompany oaJybCompany,String id,String[] station){
		oaJybCompany.setCompany_id(Integer.parseInt(id));
		 String str="";
		 for (int i = 0; i < station.length; i++) {
			String string = station[i];
			str+=string+"、";
			
		
		}
		 oaJybCompany.setCompany_station(str.substring(0, str.length()-1));
		
		if(oaJybCompanyService.updateByPrimaryKeySelective(oaJybCompany)==1){
			return "redirect:/employment_department/showlist.html";
			
		}
		
		else{return "employment_department/xiugaiqiye";}
		
		
	}
	
	@RequestMapping(value="/add.html")
	public String sgsgdsk(){
		return "employment_department/addcompany";
		}	
	@RequestMapping(value="/qiyetianjia")
	public String sgsgd(OaJybCompany oaJybCompany,String[] station){
		 
		 String str="";
		 for (int i = 0; i < station.length; i++) {
			String string = station[i];
			str+=string+"、";
			oaJybCompany.setCompany_station(str.substring(0, str.length()-1));
		
		}
		
		
		if(oaJybCompanyService.insert(oaJybCompany)==1){return "redirect:/employment_department/showlist.html";}
		else{return "employment_department/addcompany";}
		}	
	
	
	@RequestMapping(value="/welcome")
	public String sgg(){
		return "employment_department/welcome";
		
		
	}
}
