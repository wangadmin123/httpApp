package cn.tyyhoa.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJzbPatrolgrade;
import cn.tyyhoa.pojo.OaJzbQuestion;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaJybChronicleService;
import cn.tyyhoa.service.OaJzbPatrolgradeService;

@Controller
public class OaJzbPatrolgradeController {

	@Autowired
	OaJybChronicleService oaJybChronicleService;
	@Autowired
	OaJzbPatrolgradeService patrolgradeservice;
	

	
	//进入添加页面
	@RequestMapping(value="/addpatrol.html")
	public String selectpatrol(HttpServletRequest request,HttpSession session){
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date = df.format(new Date());
		request.setAttribute("date", date);
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		//班主任ID
		List<OaJwbGrade> gradelist = null;
		if(loginUser.getPosition().getPosition_id()==22){
			gradelist =patrolgradeservice.selectgradelist(0);
		}else{
			gradelist = patrolgradeservice.selectgradelist(loginUser.getEmp_id());
		}
		
		List<OaJzbQuestion> questlist=patrolgradeservice.selectquestlist();
		request.setAttribute("gradelist", gradelist);
		request.setAttribute("questlist", questlist);
		return "teach_nature_department/jzb/addpatrol";
		
	}
	
    //点击班级查询班级所有学生

	@RequestMapping(value="/selectstudentlist/{uid}",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectstudent(@PathVariable String uid,HttpServletRequest request){
	
		List<OaJzbStudent> list=patrolgradeservice.selectstudentlist(Integer.parseInt(uid));
		String str = "<div>";
		for (Iterator<OaJzbStudent> iterator = list.iterator(); iterator.hasNext();) {
			OaJzbStudent oaJzbStudent = iterator.next();
			str+="<div style='float:left; margin-right:15px;color:#333;width:95px;height:30px;line-height:30px;'>"+oaJzbStudent.getStu_name()+"&nbsp;<input type='checkbox' class='checkedStyle' name='studentName_ids' value='"+oaJzbStudent.getStu_Id()+"'></div>";
		}
		str+="</div>";
		return str;
		
	}
	
	//添加巡班记录
	@RequestMapping(value="/addpatrolinfo",method=RequestMethod.GET)
	public String addpatrol(OaJzbPatrolgrade patrolgrade,String studentName_ids[],HttpSession session) throws UnsupportedEncodingException{
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String newdates=sdf3.format(new Date());
		Date date3=null;
		try {
			date3=sdf3.parse(newdates.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//转换为默认Date格式
		int row=0;
		for(int i=0;i<studentName_ids.length;i++){
		//12 为登录人的ID
		patrolgrade.setQuestion(new String(patrolgrade.getQuestion().getBytes("ISO-8859-1"),"UTF-8"));
		patrolgrade.setStudentName_id(Integer.parseInt(studentName_ids[i]));
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		patrolgrade.setTeacher_id(loginUser.getEmp_id());
		patrolgrade.setEnteringTime(date3);
		if(!patrolgrade.getQuestion().equals("正常")){
			/*学生大记事*/
			OaJybChronicle oaJybChronicle = new OaJybChronicle();
			oaJybChronicle.setStudent_id(Integer.parseInt(studentName_ids[i]));
			oaJybChronicle.setEvent_time(new Date());
			oaJybChronicle.setInputUser(loginUser.getName());
			oaJybChronicle.setInput_time(new Date());
			oaJybChronicle.setEvent_name(patrolgrade.getQuestion());
			oaJybChronicle.setIsNormal(1);
			oaJybChronicleService.insertSelective(oaJybChronicle);
		}
		/*添加巡班信息*/
		row=patrolgradeservice.addpatrolgrade(patrolgrade);
		}
		if(row==1){
			return "redirect:/oaJwbGradeslist.html/";
		}else{
			return "redirect:/addpatrol.html";
			}
		
		
		
	}
	
	//删除巡班记录
	@RequestMapping(value="/delpatrol")
	public String delpatrols(@RequestParam(value="del",required=false)String del, String id,HttpSession session){
		if(del==null){
			del="0";
		}
		if(Integer.parseInt(del)==3){
			int row=patrolgradeservice.delxunbanbeizhu(Integer.parseInt(id));
		}else{
			int row=patrolgradeservice.delpatrolgrade(Integer.parseInt(id));
		}
		Integer gradeid1 = (Integer) session.getAttribute("gradeid");
		 return "redirect:/joinxbjl/"+gradeid1;	
	}
	
	//打开修改巡班记录
	@RequestMapping(value="/editxb.html")
	public String updatepatrols(@RequestParam(value="up",required=false)String up,String id,HttpServletRequest request){
		if(up==null){
			up="0";
		}
		if(Integer.parseInt(up)==3){
			OaJzbPatrolgrade patrol=patrolgradeservice.selectxunbanbeizhu(Integer.parseInt(id));
			request.setAttribute("patrolsinfo", patrol);
			return "teach_nature_department/jzb/editxbbz";
		}else{
			OaJzbPatrolgrade patrol=patrolgradeservice.selectpatrol(Integer.parseInt(id));
			List<OaJzbQuestion> questlist=patrolgradeservice.selectquestlist();
			request.setAttribute("questlist", questlist);
			request.setAttribute("patrolsinfo", patrol);
			return "teach_nature_department/jzb/editxb";
		}
	}
	
	//修改巡班记录
	@RequestMapping(value="/editpatrolsinfo",method=RequestMethod.GET)
	public String editpatrols(@RequestParam int problem,@RequestParam int gradeid,HttpSession session){
		int row=patrolgradeservice.updatepatrolgrade(problem, gradeid);
		Integer gradeid1 = (Integer) session.getAttribute("gradeid");
		if(row==1){
			return "redirect:/joinxbjl/"+gradeid1;
		}else{
			return "redirect:/editxb.html";
		}
		
	}
	
	//修改巡班记录备注
		@RequestMapping(value="/editpatrolsinfobz",method=RequestMethod.GET)
		public String editpatrolsinfobz(@RequestParam String problem,@RequestParam int gradeid,HttpSession session){
			int row=patrolgradeservice.updatexunbanbeizhu(problem, gradeid);
			Integer gradeid1 = (Integer) session.getAttribute("gradeid");
			if(row==1){
				return "redirect:/joinxbjl/"+gradeid1;
			}else{
				return "redirect:/editxb.html?up=3";
			}
			
		}
}
