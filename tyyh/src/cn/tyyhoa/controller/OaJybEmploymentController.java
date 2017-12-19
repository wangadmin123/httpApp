package cn.tyyhoa.controller;


import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJybCompany;
import cn.tyyhoa.pojo.OaJybEmployment;
import cn.tyyhoa.pojo.OaJybVisit;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybHatCity;
import cn.tyyhoa.pojo.OaRlzybHatProvince;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaJybEmploymentService;
import cn.tyyhoa.service.OaJybHuifangService;
import cn.tyyhoa.util.GetFirstSpellUtil;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;


@RequestMapping("/employment_department")
@Controller
public class OaJybEmploymentController {
	@Autowired
	OaJybHuifangService oaJybHuifangService;
	private ApplicationContext count = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
	private OaJybEmploymentService oaJybEmp = (OaJybEmploymentService) count.getBean("OaJybEmploymentService");	
	//查看个人就业信息  大事件那里
	@ResponseBody
	@RequestMapping(value="/selectoneEmp")
	public String selectEmp(HttpServletRequest req,String stuid,HttpSession session){
		Integer id = Integer.valueOf(stuid);
		OaJybEmployment employ = oaJybEmp.selectoneEmp(id);
		String num=JSON.toJSONString(employ);
		/*session.setAttribute("employ", employ);*/
		return  num;
	}
	//查看就业信息页面
	@RequestMapping(value="/employment")
	public String employment(HttpServletRequest req,String row,HttpSession session){		
		List<OaJybEmployment> citys2 =oaJybEmp.selectCity();
		List<OaJybEmployment> className =oaJybEmp.selectClassName();
		List<OaJybEmployment> record =oaJybEmp.selectRecord2();
		List<OaJzbStudent> citys1 =oaJybEmp.daiCity();
		List<OaJzbStudent> daixueli =oaJybEmp.daixueli();
		List<OaJzbStudent> daibanji =oaJybEmp.daibanji();
		OaRlzybUser ou = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJybVisit> fff=oaJybHuifangService.GetGrades(ou.getPosition().getPosition_id(),ou.getEmp_id());
		req.setAttribute("grades", fff);
		List<OaJwbGrade> banji =oaJybEmp.empClass(ou.getEmp_id(), ou.getPosition().getPosition_id());
		req.setAttribute("citys", citys2);
		req.setAttribute("className", banji);
		req.setAttribute("record", record);		
		req.setAttribute("daicity", citys1);
		req.setAttribute("daibanji", daibanji);
		req.setAttribute("daixueli", daixueli);
		req.setAttribute("index", row);
		return "employment_department/employmentList";
	}


    /* 待就业信息*/
    @ResponseBody
   	@RequestMapping(value="/employmentdaiList",produces="application/json;charset=utf-8",method=RequestMethod.POST)
   	public Object employmentList1(String currentPageNo,OaJybEmployment employment, String sname1,String grade,HttpSession session ){ 
     	Map<String, Object> emp1 = new HashMap<String, Object>();
      	if(currentPageNo == null){
       		currentPageNo="1";
       	}
       	if(sname1 != null && sname1 != ""){
    		boolean isWord=sname1.matches("[a-zA-Z]+");    		
    		if(isWord==true){
    			emp1.put("sname1", sname1);
    		}else{
    			String stuName =GetFirstSpellUtil.getFirstLetter(sname1);
    			emp1.put("sname1", stuName);
    		}	
    	}
       	
    	emp1.put("empsal", null);
       	int pageSize = 10;
       	emp1.put("nowPage", (Integer.parseInt(currentPageNo)-1)*pageSize);
       	emp1.put("pageSize", pageSize);
       	emp1.put("employments", employment);  
     	OaRlzybUser ou = (OaRlzybUser) session.getAttribute("loginUser");
     	emp1.put("positionid", ou.getPosition().getPosition_id()); 
     	emp1.put("empTecid", ou.getEmp_id()); 
    	List<OaJybEmployment> empList1 =oaJybEmp.selectOaJybEmployments2(emp1);
        int totalCount = oaJybEmp.count2(emp1);
       	Map<String, Object> emps = new HashMap<String, Object>();
    	int totalPageCount = totalCount % pageSize ==0 ? totalCount / pageSize :totalCount / pageSize +1;
        emps.put("currentPageNo", currentPageNo);
       	emps.put("totalPageCount", totalPageCount);
       	emps.put("totalCount", totalCount);
       	emps.put("employmentList", empList1);     
   		return JSONArray.toJSONStringWithDateFormat(emps, "yyyy-MM-dd ");
   	}
    
    /*已就业信息*/
    @ResponseBody
   	@RequestMapping(value="/employmentyiList",produces="application/json;charset=utf-8",method=RequestMethod.POST)
   	public Object employmentList2(String currentPageNo,OaJybEmployment employment,int empsal,String sname2,HttpSession session){  
    	
     	System.out.println(employment.getEmployment_status()+"*&*&*&*&*&*");
    	
       	Map<String, Object> emp1 = new HashMap<String, Object>();
       	if(currentPageNo == null){
       		currentPageNo="1";
       	}
       	if(sname2 != null && sname2 != ""){
    		boolean isWord=sname2.matches("[a-zA-Z]+");    		
    		if(isWord==true){
    			emp1.put("sname2", sname2);
    		}else{
    			String stuName =GetFirstSpellUtil.getFirstLetter(sname2);
    			emp1.put("sname2", stuName);
    		}	
    	}
       	emp1.put("empsal", empsal);
       	int pageSize = 10;
       	emp1.put("nowPage", (Integer.parseInt(currentPageNo)-1)*pageSize);
       	emp1.put("pageSize", pageSize);
    	OaRlzybUser ou = (OaRlzybUser) session.getAttribute("loginUser");
     	emp1.put("positionid", ou.getPosition().getPosition_id()); 
     	emp1.put("empTecid", ou.getEmp_id()); 
       	emp1.put("employments", employment);      	 	    	
       	List<OaJybEmployment> empList1 =oaJybEmp.selectOaJybEmployments(emp1);
       	Map<String, Object> emps = new HashMap<String, Object>();
       	int totalCount = oaJybEmp.selectOaJybEmploymentByCount(emp1);
       	int totalPageCount = totalCount % pageSize ==0 ? totalCount / pageSize :totalCount / pageSize +1;
       	emps.put("currentPageNo", currentPageNo);
       	emps.put("totalPageCount", totalPageCount);
       	emps.put("totalCount", totalCount);
       	emps.put("employmentList", empList1);  
       	System.out.println(JSONArray.toJSONStringWithDateFormat(emps, "yyyy-MM-dd"));
   		return JSONArray.toJSONStringWithDateFormat(emps, "yyyy-MM-dd");
   	}

    /*跳转添加页面*/
    @RequestMapping(value="/logaddemployment")
    public String addemployment(int stuid ,int empNo,String stuName, HttpServletRequest req){  
    	    List<OaRlzybHatProvince> city1 =  oaJybEmp.selectAllcity1();
    	    List<OaJybCompany>coms = oaJybEmp.GetAllComList();
    		req.setAttribute("city1list", city1);
    		req.setAttribute("empNo", empNo);	
    		req.setAttribute("stuid", stuid);
    		String sname;
    		
    		try {
				sname=new String(stuName);
				req.setAttribute("stuName", sname);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
    		req.setAttribute("comlist", coms);
    	    return "employment_department/addemployment";
    }
    /*获取城市信息*/
    @ResponseBody
    @RequestMapping(value="/getcity",produces="application/json;charset=utf-8")
    public Object addCity2(String ProvinceId,String comName){
    	Map<String, Object> m = new HashMap<String, Object>();
  
    	if(ProvinceId != null){
    		List<OaRlzybHatCity> city2 = oaJybEmp.selectAllcity2(ProvinceId); 
    		m.put("citys", city2);
    	}    	
  
    	if(comName != null){
    		OaJybCompany  oo =oaJybEmp.GetByComLEnglist(Integer.parseInt(comName));
    		String  ss =oo.getCompany_station();   		
    		String[] sss = ss.split("、");		
    		m.put("coms", sss);
    	}
    	
    	return JSONArray.toJSONString(m);
    }
    
    
    //就业信息添加
    @RequestMapping(value="/addemployment",method=RequestMethod.POST)
    public String  addemployment(String stu_Id,OaJybEmployment emp , HttpServletRequest req,String empDate,String stuName,String citt) throws ParseException{
    	
		if(citt.contains("市"))
		{
		  emp.setEmployment_city(citt);
		} 
    	DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
    	try {    		
    		if(empDate != null && empDate != "" ){	   		
    		emp.setEmployment_time(df.parse(empDate));
    		}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	int row =oaJybEmp.updateByPrimaryKeySelective(emp);
    	if(row ==1){
    		if(empDate != null && empDate != ""){
    			 /* DateFormat  df1 = new SimpleDateFormat("yyyy-MM-dd");*/
    	    		OaJybChronicle oo = new OaJybChronicle();	
    	   		    oo.setStudent_id(Integer.parseInt(stu_Id)); 		
    	   			oo.setEvent_time(new Date());
    	   			oo.setEvent_name("在"+emp.getEmployment_city()+"就业,薪资"+emp.getEmployment_Salary_worker());
    	   			oaJybEmp.insertSelective(oo);
    		}
    		return "redirect:/employment_department/employment?row="+row;
    	}else{	
    		return "dfee/error";
    	}
    	
    }

    //就业信息修改页面跳转
    @RequestMapping(value="/logupEmployment",method=RequestMethod.GET)
    public String logEmployment(int empid,HttpServletRequest req,OaJybEmployment employment,int stuNo,String stuName){ 	
    		employment.setEmployment_id(empid);
    	    List<OaRlzybHatProvince> city1 =  oaJybEmp.selectAllcity1();
       	    List<OaJybCompany>coms = oaJybEmp.GetAllComList();
        	employment=oaJybEmp.selectempbyterm(employment);
        	OaRlzybHatCity c=oaJybEmp.selectByCityPojoKey(employment.getEmployment_city());
        	System.out.println(c);
        	if(c==null){
        		req.setAttribute("seng", employment.getEmployment_city());
        	}else{
        		req.setAttribute("seng",c.getFather());
        	}
        	String sname="";
        	try {
				 sname=new String(stuName.getBytes("ISO8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	req.setAttribute("stuid", stuNo);
        	req.setAttribute("stuname", sname);
        	req.setAttribute("upempinfo", employment);
        	req.setAttribute("comlist", coms);
        	req.setAttribute("city1list", city1);
        	return "employment_department/updateEmployment";

    }
    
    /**
     * 
     * 就业信息修改
     * @param empid
     * @param req
     * @param employment
     * @param stuNo
     * @return
     * @throws ParseException 
     */
    @RequestMapping(value="/updateEmployment",method=RequestMethod.POST)
    public  String updateEmployment(OaJybEmployment employment,String empData,int stu_id) throws ParseException{ 
    
    	DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
    	try {
    		OaJzbStudent os = new OaJzbStudent();
    		os.setStu_Id(stu_id); 
    		if(empData != null && empData != ""){
    		employment.setEmployment_time(df.parse(empData));
    		
    		}
    		employment.setEmployment_studentId(os);
    		System.out.println(employment.getEmployment_studentId().getStu_Id());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	int row =oaJybEmp.empinsertSelective(employment);
    	if(row ==1){
    		if(empData != null && empData != ""){
    	    /*DateFormat  df1 = new SimpleDateFormat("yyyy-MM-dd");*/
    		OaJybChronicle oo = new OaJybChronicle();	
   		    oo.setStudent_id(stu_id); 		
   			oo.setEvent_time(new Date());
   			oo.setEvent_name("在"+employment.getEmployment_city()+"就业,薪资"+employment.getEmployment_Salary_worker());
   			oaJybEmp.insertSelective(oo);
    			
    		}
    		return "redirect:/employment_department/employment?row="+row;
    	}else{	
    		return "dfee/error";
    	}
    }
    	
    
    //就业信息统计页面
    @RequestMapping(value="/logEmpstatistic")
    public String logEmpstatistic(HttpServletRequest req,String claName,HttpSession session){
    	List<OaJybEmployment> className =oaJybEmp.selectClassName();
    	List<OaJybEmployment> citys2 =oaJybEmp.selectCity1(claName);
		/*List<OaJybEmployment> record =oaJybEmp.selectRecord();*/
		OaRlzybUser ou = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> banji =oaJybEmp.empClass(ou.getEmp_id(), ou.getPosition().getPosition_id());
    	req.setAttribute("className", banji);
    	req.setAttribute("classId", claName);
    	/*req.setAttribute("record", record);*/
    	req.setAttribute("empCity", citys2);
    	return "employment_department/empstatistic";
    }
    
    
    //就业信息统计数据
    @ResponseBody
   	@RequestMapping(value="/empstatistic",produces="application/json;charset=utf-8",method=RequestMethod.POST)
    public Object showEmpstatistic(String className){
    	Map<String, Comparable> stat = new HashMap<String, Comparable>();  
    	stat.put("className", className);
    	int classSizeCount = oaJybEmp.selectEmpStatic2(stat); 
    	int[] empStatusCount = new int[4];
    	String[] empType = new String[]{"已就业","未就业","自主","待业"};
    	for (int i = 0; i < empType.length; i++) {    		
        	stat.put("employment_status",empType[i]);
        	empStatusCount[i]= oaJybEmp.selectEmpStatic2(stat); 
		} 

    	

    	//城市
    	Map<String, Comparable> stat2 = new HashMap<String, Comparable>();     	
    	List<OaJybEmployment> citys2 =oaJybEmp.selectCity1(className);
    	int[] empCityCount = new int[citys2.size()];
    	String[] empCity = new String[citys2.size()];
    	for (int i = 0; i < citys2.size(); i++) {
    	    System.out.println(citys2.get(i).getEmployment_city());
    		empCity[i]=citys2.get(i).getEmployment_city();
		}
    	for (int i = 0; i < empCity.length; i++) {
    		stat2.put("className", className);
			stat2.put("employment_city", empCity[i]);
			empCityCount[i]= oaJybEmp.selectEmpStatic(stat2); 			
		}
      
    	//学历
    	Map<String, Comparable> stat5 = new HashMap<String, Comparable>(); 
    	
    	List<OaJybEmployment> record =oaJybEmp.selectRecord(className);
    	int[] empRecordCount = new int[record.size()];
    	String[] empRecord = new String[record.size()];
    	for (int i = 0; i < record.size(); i++) {
    		empRecord[i]=record.get(i).getRecord();
		}
    	for (int i = 0; i < empRecord.length; i++) {
    		stat5.put("className", className);
    		stat5.put("record", empRecord[i]);
    		empRecordCount[i]= oaJybEmp.selectEmpStatic(stat5); 			
		}
    	
    	  //薪资统计
    	  Map<String, Comparable> stat3 = new HashMap<String, Comparable>(); 
    	  int[] empSalCount = new int[4];
    	  int[] empSal = new int[]{1,2,3,4};
    	  String[] empSalCheck= new String[]{"2000-4000元","4000-6000元","6000-8000元","8000元以上"};
    	  for (int i = 0; i < empSal.length; i++) {
    		 System.out.println(empSal[i]);
    		stat3.put("className", className);
			stat3.put("empsal", empSal[i]);						
			empSalCount[i]=oaJybEmp.selectEmpStatic(stat3);
			System.out.println(empSalCount[i]);
		  }
    	
    	//年龄统计    	
    	  Map<String, Comparable> stat4 = new HashMap<String, Comparable>(); 
    	  int[] empStuAgeCount = new int[4];
    	  int[]  empStuAge = new int[]{1,2,3,4};
          String[] empStuAgeCheck= new String[]{"18岁以下","18-20","20-24","24岁以上"};
    	  for (int i = 0; i < empStuAge.length; i++) {
			stat4.put("agePd", empStuAge[i]);	
			stat4.put("className", className);
			empStuAgeCount[i]=oaJybEmp.selectEmpStatic(stat4);
		  }
    	
    	
    	Map<String, Object> empStat = new HashMap<String, Object>();
    	
    
     	empStat.put("className33", className);
    	empStat.put("classSizeCount", classSizeCount);
    	empStat.put("empStatusCount", empStatusCount);
    	empStat.put("empCityCount", empCityCount);
    	empStat.put("empCity", empCity);
    	empStat.put("record", empRecord);
    	empStat.put("empRecordCount", empRecordCount);
    	empStat.put("empSalCount", empSalCount);
    	empStat.put("empSalCheck", empSalCheck);
    	empStat.put("empStuAgeCount", empStuAgeCount);
    	empStat.put("empStuAgeCheck", empStuAgeCheck);
    	return JSONArray.toJSONString(empStat);
    }
    
    List<String> ls = new ArrayList<String>();
    List<Integer> la = new ArrayList<Integer>(); 
    List<Integer> ll = new ArrayList<Integer>(); 
    @ResponseBody
   	@RequestMapping(value="/empstatistic1",produces="application/json;charset=utf-8",method=RequestMethod.POST)
    public Object showEmpstatistic(Integer agePd,String record,String employment_city,Integer empsal,String cne){
        la.removeAll(la);
        ls.removeAll(ls);  
        ll.removeAll(ll); 
    	System.out.println(agePd+record+employment_city+empsal);
    	Map<String, Comparable> empStatDao = new HashMap<String, Comparable>();
    	
    	empStatDao.put("className", cne);  
    	empStatDao.put("employment_city", employment_city);   	
    	String cityStatus[] = new String[]{"已就业","未就业","自主"};
    	int cityStatusNum[] = new int[cityStatus.length];
    	int citySum =oaJybEmp.selectEmpStatic2(empStatDao);
    	for (int i = 0; i < cityStatus.length; i++) {
    	 	empStatDao.put("className", cne);  
    		empStatDao.put("employment_city", employment_city);
    		empStatDao.put("employment_status", cityStatus[i]);
    		cityStatusNum[i]=oaJybEmp.selectEmpStatic2(empStatDao);
		}
    	
    	  for (int i = 0; i < ls.size(); i++){	
			  if(ls.get(i).equals(record)){
				   ls.remove(i);
				   break;
			  }
		  }	
    	
    	for (int i = 0; i < la.size(); i++) {
    		System.out.println(la.size()); 

    		if(la.get(i).equals(agePd)){
		     la.remove(i);
		     break;
    		} 
    	
    		
        } 

    	for (int i = 0; i < ll.size(); i++) {
    		System.out.println(ll.size());
    	
    		if(ll.get(i).equals(empsal)){
		     ll.remove(i);
		     break;
    		} 
    		   		
        } 

    	   int[] cityRecSum =null;	  	
    	   int[] cityRecSum1 =null;
    	 
    	  if(record != null && record != ""){
    		  ls.add(record); 
    		
    		cityRecSum=new int[ls.size()]; 
    		
    		cityRecSum1=new int[ls.size()];
    		for (int i = 0; i < ls.size(); i++){		
            Map<String, Comparable> empStatDao1 = new HashMap<String, Comparable>();
        	empStatDao1.put("className", cne);
        	empStatDao1.put("employment_city", employment_city);
        	empStatDao1.put("record", ls.get(i));
        	cityRecSum[i] =oaJybEmp.selectEmpStatic2(empStatDao1);
        	Map<String, Comparable> empStatDao2 = new HashMap<String, Comparable>();
        	empStatDao1.put("className", cne);
        	empStatDao2.put("record", ls.get(i));
        	cityRecSum1[i]=oaJybEmp.selectEmpStatic2(empStatDao2);
    	    }
    	}
    	
    	
       
    	
    	
    	int [] cityAgeSum = null;
    	int [] cityAgeSum1 = null;
    	if(agePd != null && agePd !=0){
    		
    		la.add(agePd);
    		cityAgeSum=new int[la.size()];
    		cityAgeSum1=new int[la.size()];
    		for (int i = 0; i < la.size(); i++) {
    			Map<String, Comparable> empStatDao1 = new HashMap<String, Comparable>();
    			System.out.println(la.get(i)+"********************");
    			empStatDao1.put("className", cne);
    	        empStatDao1.put("employment_city", employment_city);
    	        empStatDao1.put("agePd", la.get(i));
    	        cityAgeSum[i] =oaJybEmp.selectEmpStatic2(empStatDao1);
    	        Map<String, Comparable> empStatDao2 = new HashMap<String, Comparable>();
    	        empStatDao2.put("className", cne);
            	empStatDao2.put("agePd", la.get(i));
            	cityAgeSum1[i]=oaJybEmp.selectEmpStatic2(empStatDao2);
			}
    		
    	}
    	int [] citySalSum = null;
    	int [] citySalSum1 = null;
    	if(empsal != null && empsal != 0){ 
    		ll.add(empsal);
    		citySalSum=new int[ll.size()];
    		citySalSum1=new int[ll.size()];   		
    		for (int i = 0; i < ll.size(); i++) {
    			Map<String, Comparable> empStatDao1 = new HashMap<String, Comparable>();
    			System.out.println(ll.get(i)+"********************");
    			empStatDao1.put("className", cne);
    	        empStatDao1.put("employment_city", employment_city);
    	        empStatDao1.put("empsal", ll.get(i));
    	        citySalSum[i] =oaJybEmp.selectEmpStatic(empStatDao1);
    	        Map<String, Comparable> empStatDao2 = new HashMap<String, Comparable>();
    	        empStatDao2.put("className", cne);
            	empStatDao2.put("empsal", ll.get(i));
            	citySalSum1[i]=oaJybEmp.selectEmpStatic(empStatDao2);
			}

    	}
    
    	Map<String, Object> empStat = new HashMap<String, Object>();
    	empStat.put("citySum", citySum);   	
    	empStat.put("employment_city", employment_city);
    	empStat.put("cityStatusNum", cityStatusNum);   	
    	empStat.put("record", ls);
    	empStat.put("agePd", la);
    	empStat.put("cityRecSum", cityRecSum);
    	empStat.put("cityRecSum1", cityRecSum1);   
    	empStat.put("cityAgeSum", cityAgeSum);
    	empStat.put("cityAgeSum1", cityAgeSum1);
    	empStat.put("empsal", ll);
    	empStat.put("citySalSum", citySalSum);
    	empStat.put("citySalSum1", citySalSum1);

    	/**/
    	return JSONArray.toJSONString(empStat);   	
    }
    

	}


