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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.service.OaJzbReceiveConsultService;

@Controller
public class OaJzbReceiveConsultController {
	@Autowired
	OaJzbReceiveConsultService receiveConsultSer;
	
	//列表显示
	@RequestMapping(value="/oaJzbReceiveConsultlist.html")
	public String selectReceiveConsult(HttpServletRequest request,HttpSession session){
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		
		if(loginUser.getPosition().getPosition_id()==22){
			List<OaJwbGrade> list=receiveConsultSer.findshowGrade();
			request.setAttribute("gradelist", list);
		}else{
			List<OaJwbGrade> list=receiveConsultSer.findselectGrade(loginUser.getEmp_id());
			request.setAttribute("gradelist", list);
		}
		return "teach_nature_department/jzb/student_info";
	}
	@RequestMapping(value="oaJzb/ReceiveConsultlist",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object selectConsult(@RequestParam String name,@RequestParam String sex,
			@RequestParam String currentPage,HttpServletRequest request,HttpSession session){
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		int pageSize=10;
		List<OaScbConsulter> list=receiveConsultSer.findselectConsultNameAndSex(name,Integer.parseInt(sex),loginUser.getEmp_id(),Integer.parseInt(currentPage),pageSize);
		int Count=receiveConsultSer.selectConsultNameAndSexCount(name,Integer.parseInt(sex),loginUser.getEmp_id());//记录总数
		int pageCount=Count%pageSize==0?Count/pageSize:Count/pageSize+1;//总页数
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("receivelist", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", Integer.parseInt(currentPage));
		return JSONArray.toJSONString(map);	
	}
	
	
	@RequestMapping(value="/consultgrade.html")
	public String updateConsult(@RequestParam String[] id,@RequestParam String gradeId,
			@RequestParam String[] name,
			@RequestParam int[] age,
			@RequestParam(required=false) int[] sex,
			@RequestParam String[] telphone1,
			@RequestParam String[] ungenTelphone,
			@RequestParam String[] consultTeacher,
			@RequestParam(required=false) String[] educationId,
				HttpServletRequest request){
		//获取班级名称
		OaJwbGrade grade=receiveConsultSer.findselectGradeId(Integer.parseInt(gradeId));
		//截取字符
		String str=grade.getName();
		CharSequence char1=str.subSequence(0, 1);
		//拼接学号
		String stuNumber="";
		String[] stuNum=new String[id.length];
		for (int i = 0; i < id.length; i++) {
				//批量修改
				receiveConsultSer.findedit(Integer.parseInt(gradeId),Integer.parseInt(id[i]));
				if(char1.equals("C")){
					//获取学生个数
					List<OaJzbStudent> list=receiveConsultSer.findstudentCount(Integer.parseInt(gradeId));
					int stuNo=list.size();
					//拼接C班学号
					if(stuNo>=0 &&stuNo<9){
						stuNumber=str+"00"+(stuNo+i+1);
					}else{
						stuNumber=str+"0"+(stuNo+i+1);
					}
				}else{
					//A班学生学号
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
					String dqsj=df.format(new Date());// new Date()为获取当前系统时间
					//截取
					CharSequence char2=dqsj.subSequence(3, 4);
					CharSequence char3=dqsj.subSequence(5, 7);
					CharSequence char4=dqsj.subSequence(8, 10);
					//学生个数
					List<OaJzbStudent> list=receiveConsultSer.findstudentCount(Integer.parseInt(gradeId));
					int stuNo=list.size();
					//拼接A班学号
					if(stuNo>=0 &&stuNo<9){
						stuNumber="594"+char2+char3+char4+"00"+(stuNo+i+1);
					}else{
						stuNumber="594"+char2+char3+char4+"0"+(stuNo+i+1);
					}
				}
				stuNum[i]=stuNumber;//学号放入数组
		}
	
		//批量添加
		for (int i = 0; i < stuNum.length; i++) {
			//循环查询单个人信息
			List<OaScbConsulter> consulter=receiveConsultSer.findselectOne(Integer.parseInt(id[i]));
			//批量插入学生表
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dqsj=df.format(new Date());// new Date()为获取当前系统时间
			Date date=null;
			try {
				date = df.parse(dqsj);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("添加学生表之前");
			receiveConsultSer.addStudentPL(Integer.parseInt(consultTeacher[i]),stuNum[i], consulter.get(0).getName(),consulter.get(0).getAge(),consulter.get(0).getTelphone1(), consulter.get(0).getUngenTelphone(),Integer.parseInt(gradeId),date);
			/*System.out.println("*********"+consulter.get(0).getName());
			System.out.println("*********"+consulter.get(0).getSex());
			System.out.println("*********"+ consulter.get(0).getAge());
			System.out.println("***********"+Integer.parseInt(educationId[i]));
			System.out.println("添加学生表之后");
			System.out.println("添加开班表之前");
			receiveConsultSer.findaddOpenClass(consulter.get(0).getName(), consulter.get(0).getSex(), consulter.get(0).getAge(),Integer.parseInt(educationId[i]),Integer.parseInt(gradeId));
			System.out.println("添加成功");*/
		}
		return "redirect:/oaJzbReceiveConsultlist.html";
	}
}
