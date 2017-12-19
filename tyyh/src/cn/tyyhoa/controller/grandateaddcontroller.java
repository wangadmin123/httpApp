package cn.tyyhoa.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJzbGradedata;
import cn.tyyhoa.pojo.OaJzbProject;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.StudentDK;
import cn.tyyhoa.service.GrandDateadd;
import cn.tyyhoa.service.OaJzbChronicleService;
import cn.tyyhoa.service.OaJzbClassplanService;
import cn.tyyhoa.util.OaJzbRevoke;

@SuppressWarnings("unused")
@Controller
public class grandateaddcontroller {
	@Autowired
	GrandDateadd granddate;
	
	@Autowired
	OaJzbClassplanService oaJzbClassplanService;
	
	@Autowired
	OaJzbChronicleService oaJzbChronicleService;
	  
	
	//批量插入班级数据
	@RequestMapping(value = "/grand", method = RequestMethod.POST)
	@ResponseBody
    public Object add(
    		@RequestParam(required=false) String[] student_id,
    		@RequestParam(required=false) String[] amturn,
    		@RequestParam(required=false) String[] pmturn,
    		@RequestParam(required=false) String[] word,
    		@RequestParam(required=false) String[] classHour,
    		@RequestParam(required=false) String[] qijiaHour,
    		@RequestParam(required=false) String[] grade_id,
    		HttpServletRequest request,
    		HttpSession session
    			      )
    {
		String gradeid=(String)session.getAttribute("gradeid");
		String a_time = request.getParameter("a_time");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		//new Date()为获取当前系统时间
		Date DNow = new Date();
		String sdate2 = sdf2.format(DNow);
		Date date1 = null;
		Date date2 = null;
		Date date3 = null;
		try {
			date1 = sdf1.parse(a_time);//转换为默认Date格式
			date3 = sdf2.parse(a_time + " 20:30:12");//转换为默认Date格式
			date2 = sdf2.parse(sdate2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp time2=new Timestamp(date2.getTime());//转换为日期格式
		Timestamp time3=new Timestamp(date3.getTime());//转换为日期格式
		boolean flag=true;
			for (int i = 0; i < student_id.length; i++) {
				OaJzbGradedata OaJzbGradedata=new OaJzbGradedata();
				OaJzbGradedata.setStudent_id(Integer.parseInt(student_id[i]));
				OaJzbGradedata.setAmturn(amturn[i]);		
				OaJzbGradedata.setPmturn(pmturn[i]);
				OaJzbGradedata.setWord(word[i]);
				OaJzbGradedata.setClassHour(Double.parseDouble(classHour[i]));
				OaJzbGradedata.setQijiaHour(Integer.parseInt(qijiaHour[i]));
				OaJzbGradedata.setGrade_id(Integer.parseInt(grade_id[i]));
				OaJzbGradedata.setTime(date1);
				OaJzbGradedata.setEnteringTime(time2);
				flag =granddate.insertGradedata(OaJzbGradedata);
			}
		if(flag){
			/*班级数据*/
			List<OaJzbGradedata> oaJzbGradedatas = granddate.selectStuDataBytime(date1, Integer.parseInt(gradeid));
			for(int i = 0; i < oaJzbGradedatas.size(); i++){
				OaJybChronicle oaJybChronicle = new OaJybChronicle();
				oaJybChronicle.setStudent_id(oaJzbGradedatas.get(i).getStudent_id());
				oaJybChronicle.setEvent_time(time3);
				oaJybChronicle.setInput_time(time2);
				if(oaJzbGradedatas.get(i).getAmturn().equals("旷课") && oaJzbGradedatas.get(i).getPmturn().equals("旷课")){
					oaJybChronicle.setEvent_name("上午旷课，下午旷课");
					oaJybChronicle.setIsNormal(1);
					oaJzbChronicleService.delectSelective("迟到", a_time, oaJybChronicle.getStudent_id());
					oaJzbChronicleService.delectSelective("早退", a_time, oaJybChronicle.getStudent_id());
				}else if(oaJzbGradedatas.get(i).getPmturn().equals("旷课")){
					oaJybChronicle.setEvent_name("下午旷课");
					oaJybChronicle.setIsNormal(1);
					oaJzbChronicleService.delectSelective("早退", a_time, oaJybChronicle.getStudent_id());
				}else if(oaJzbGradedatas.get(i).getAmturn().equals("旷课")){
					oaJybChronicle.setEvent_name("上午旷课");
					oaJybChronicle.setIsNormal(1);
					oaJzbChronicleService.delectSelective("迟到", a_time, oaJybChronicle.getStudent_id());
				}else if(oaJzbGradedatas.get(i).getAmturn().equals("事假") || oaJzbGradedatas.get(i).getAmturn().equals("病假")){
					oaJzbChronicleService.delectSelective("迟到", a_time, oaJybChronicle.getStudent_id());
				}else if(oaJzbGradedatas.get(i).getPmturn().equals("事假") || oaJzbGradedatas.get(i).getPmturn().equals("病假")){
					oaJzbChronicleService.delectSelective("早退", a_time, oaJybChronicle.getStudent_id());
				}
				OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
				//登录人名字
				oaJybChronicle.setInputUser(loginUser.getName()+"老师");
				if(oaJybChronicle.getIsNormal()==1){
					oaJzbChronicleService.insertSelective(oaJybChronicle);
				}
			}
			return "redirect:/gradeShowListLink/"+gradeid;
		}else{
			 return "addGradeData";
		}
	 }
	
	//查询指定班级数据信息
	@RequestMapping(value = "/gradeName",method=RequestMethod.GET)
	public String gradeName(String gradeid,HttpServletRequest request,HttpSession session) throws ParseException{
		session.setAttribute("gradeid", gradeid);
		List<OaJzbStudent> oa = granddate.toSelectGradeStu(Integer.parseInt(gradeid));
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String zhDate = sdf1.format(new Date());
		/*学生打卡记录*/
		List<StudentDK> listDK=granddate.selListDK(zhDate, gradeid);
		Date date2=sdf1.parse(zhDate);
		int count = granddate.getDataByTime(date2, Integer.parseInt(gradeid));
		
		request.setAttribute("stuDk", listDK);
		request.setAttribute("oa", oa);
		request.setAttribute("createTime", zhDate);
		request.setAttribute("count", count);
		return "teach_nature_department/jzb/addGradeData";
	}
	@RequestMapping(value = "/gradeName1",method=RequestMethod.GET)
	public String gradeNames(String dates ,HttpServletRequest request,HttpSession session) throws ParseException{
		String gradeid=(String)session.getAttribute("gradeid");
		List<OaJzbStudent> oa = granddate.toSelectGradeStu(Integer.parseInt(gradeid));
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		Date zhDate = sdf1.parse(dates);
	
		int count = granddate.getDataByTime(zhDate, Integer.parseInt(gradeid));
		
		/*学生打卡记录*/
		List<StudentDK> listDK=granddate.selListDK(dates, gradeid);
		request.setAttribute("stuDk", listDK);
		request.setAttribute("oa", oa);
		request.setAttribute("createTime", dates);
		request.setAttribute("count", count);
		return "teach_nature_department/jzb/addGradeData";
	}
	
	//根据时间查询班级信息
	@RequestMapping(value="/seltime",method = RequestMethod.GET)
	@ResponseBody
	public Object seltime(String currentdate,String index,HttpSession session){
		Date date1=null;
		if(currentdate!=null&&!currentdate.equals("")){
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			try {
				date1=sdf1.parse(currentdate.toString());
			} catch (ParseException e) {
				e.printStackTrace();
			}//转换为默认Date格式
		}
		String gradeid = (String) session.getAttribute("gradeid");
		/*当前页*/
		if(index == null){
			index = "1";
		}
		/*班级数据*/
		List<OaJzbGradedata> oaJzbGradedatas = granddate.selecttime(date1, Integer.parseInt(gradeid),Integer.parseInt(index),10);
		/*学生打卡记录*/
		List<StudentDK> listDK=granddate.selListDK(currentdate, gradeid);
		List<Object> fals = new ArrayList<>();
		for (int i = 0; i < oaJzbGradedatas.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(oaJzbGradedatas.get(i).getEnteringTime());
			fals.add(a);
		}
		/*总记录*/
		int count = granddate.getDataByTime(date1, Integer.parseInt(gradeid));
		/*总页数*/
		int pageCount = count % 10 == 0 ? count / 10 : count / 10 + 1;
		
		Map<String, Object> maps = new HashMap<String, Object>();
		 maps.put("fals", fals);	
		 maps.put("stuDk", listDK);
		maps.put("index", Integer.parseInt(index));
		maps.put("oaJzbGradedatas", oaJzbGradedatas);
		maps.put("gradeid", gradeid);
		maps.put("pageCount", pageCount);
		
		return JSONArray.toJSONStringWithDateFormat(maps,"yyyy-MM-dd");
	}
	
	
	/*跳转到编辑班级数据页面*/
	@RequestMapping(value="/toupdateGradeData")
	public String toupdateGradeData(String id,String time,HttpServletRequest request){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		Date date=null;
		try {
			date=sdf.parse(time);//转换为默认Date格式
		} catch (ParseException e) {
			e.printStackTrace();
		}
		OaJzbGradedata oaGradeData = granddate.selectStuDataBytimeAndStudent_id(date, Integer.parseInt(id));
		request.setAttribute("oaGradeData", oaGradeData);
		return "teach_nature_department/jzb/updateGradeData";
	}
	
	
	
	/*编辑班级数据*/
	@RequestMapping(value = "/editGradeData",method=RequestMethod.POST)
    public String edit(
    					OaJzbGradedata insertGradedata,
    		 			HttpServletRequest request,
    		 			HttpSession session
    		)
    {	
		String gradeid = (String) session.getAttribute("gradeid");
		boolean flag = granddate.updateGradeData(insertGradedata);
		if(flag){
			
			return "redirect:/gradeShowListLink/"+gradeid;
		}else{
			return "redirect:/gradeShowListLink/"+gradeid;
		}
		
	 }
	

}
