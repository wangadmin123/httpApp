package cn.tyyhoa.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbPraise;
import cn.tyyhoa.pojo.OaJzbStudentstatus;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbPaystatus;
import cn.tyyhoa.pojo.OaScbPaytype;
import cn.tyyhoa.service.OaJzbOpenClassService;
import cn.tyyhoa.service.OaJzbPraiseService;

@Controller
public class OaJzbPraiseController {

	@Autowired
	OaJzbPraiseService oajzbpraiseservice;
	@Autowired
    OaJzbOpenClassService openclassSer;
	//添加跳转页面
	@RequestMapping(value="/addTzPersonal.html")
	public String addTzPris(HttpServletRequest request,HttpSession session){
		//查询咨询者状态
		List<OaScbConsultstatus> statuslist=oajzbpraiseservice.findShowZxStatus();
		/*查询学历下拉*/
		List<OaScbEducation> edulist= openclassSer.findShowEducation();
		//班级下拉
		//获取职位编号；
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		if(loginUser.getPosition().getPosition_id()==22){
			/*主管查看所有班级*/
			List<OaJwbGrade> gradelist=oajzbpraiseservice.findShowGrade();
			request.setAttribute("gradelist", gradelist);
		}else{
			/*接收班主任id
			班主任所带班级*/
			List<OaJwbGrade> gradelist=oajzbpraiseservice.findshowTeachId(loginUser.getEmp_id());//员工id
			request.setAttribute("gradelist", gradelist);
		}
		//班主任所带班级
		//查询班主任
		List<OaRlzybEmployee> emplist=oajzbpraiseservice.findEmpNameShow();
		request.setAttribute("statuslist", statuslist);
		request.setAttribute("edulist", edulist);
		
		request.setAttribute("emplist", emplist);
		return "teach_nature_department/jzb/addpraisein";
	}
	//添加口碑
	@RequestMapping(value="/addOaJzbPraise.html",method=RequestMethod.POST)
	public String addOaJzbPrais(HttpSession session,OaJzbPraise oaJzbPraise,@RequestParam(required=false)String consultant_name,
			@RequestParam(required=false)String consultant_age,@RequestParam(required=false)String sex,
			@RequestParam(required=false)String status,@RequestParam(required=false)String contact_way,
			@RequestParam(required=false)String contacts,@RequestParam(required=false)String Record_id,
			@RequestParam(required=false)String follow,@RequestParam(required=false)String Consultant_remarks,
			HttpServletRequest request) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式,jsp页面设置和实体不一致的属性，然后set写入实体
		String str1=sdf.format(new Date());
		Date date=null;
		try {
			date=sdf.parse(str1.toString());//转换为默认Date格式
		} catch (ParseException e) {
			e.printStackTrace();
		}
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		oaJzbPraise.setRegister_time(date);
		oaJzbPraise.setTeacher_id(loginUser.getEmp_id());//获取员工id,直接写入员工id
		boolean flag=oajzbpraiseservice.inOaJzbPraise(oaJzbPraise);//添加口碑
		if(flag){
			if(sex.equals("男")){
				sex="1";
			}else{
				sex="2";
			}
			/*再添加口碑的同时给咨询量表插入基本数据*/
			oajzbpraiseservice.findaddConsult(consultant_name, Integer.parseInt(consultant_age), Integer.parseInt(sex), Integer.parseInt(status), contact_way, contacts,Integer.parseInt(Record_id), date, follow,Consultant_remarks);
			//修改口碑表中咨询量id
			oajzbpraiseservice.findEditConsultId(date, consultant_name, contact_way, Integer.parseInt(consultant_age));
			return "redirect:/publicPraise.html";
		}else{
			return "redirect:/addOaJzbPraise.html";
		}
	}
	//跳转查看个人口碑
	@RequestMapping(value="/publicPraise.html")
	public String selectOne(HttpServletRequest request){
		List<OaScbPaystatus> typelist=oajzbpraiseservice.selectpaytype();
		request.setAttribute("typelist", typelist);
		return "teach_nature_department/jzb/publicPraise";
	}
	//查看个人口碑
	@RequestMapping(value="personal/kb")
	@ResponseBody
	public Object selectpraiselist(@RequestParam String currentPage,HttpSession session, OaJzbPraise oajzbpraise,HttpServletRequest request){
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		//String positions=(String)session.getAttribute("positions");
		//每页显示10条记录
		int pageSize=10;
		//为登录人ID
		//7  是部门ID
		List<OaJzbPraise> list=oajzbpraiseservice.selectpraiselist(loginUser.getPosition().getDepart_id(),loginUser.getEmp_id(), oajzbpraise.getConsultant_name(), oajzbpraise.getPayStauts(),Integer.parseInt(currentPage),pageSize);
		//根据条件查询记录数
		int count=oajzbpraiseservice.selectpraiseCount(loginUser.getPosition().getDepart_id(),loginUser.getEmp_id(), oajzbpraise.getConsultant_name(), oajzbpraise.getPayStauts());
		//总页数
		int pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("publicPraiselist", list);
		map.put("currentPage", Integer.parseInt(currentPage));
		map.put("pageCount", pageCount);
		map.put("totalCount", count);
		return JSONArray.toJSONString(map);
		
	}
	//员工根据编号查看详细口碑
	@RequestMapping(value="/praiseinfo.html")
	public String selectpraiseinfo(String id,HttpServletRequest request){
		OaJzbPraise obj=oajzbpraiseservice.selectpariseinfo(Integer.parseInt(id));
		OaJzbPraise obj2s=oajzbpraiseservice.selectpariseinfo2s(Integer.parseInt(id));
		request.setAttribute("praiseinfo", obj);
		request.setAttribute("sponsor", obj2s);
		return "teach_nature_department/jzb/praiseinfo";
	}
	//跳转员工口碑
	@RequestMapping(value="/personal")
	public String tzYGshow(HttpServletRequest request){
		List<OaScbPaystatus> typelist=oajzbpraiseservice.selectpaytype();
		request.setAttribute("typelist", typelist);
		return "teach_nature_department/jzb/personal";
	}
	//主管查看员工口碑
	@RequestMapping(value="/personal/ygkb")
	@ResponseBody
	public Object selectpersonallist(OaJzbPraise oajzbpraise,@RequestParam String currentPage,HttpServletRequest request,HttpSession session){	
		//String positions=(String)session.getAttribute("positions");
		//主管查看部门所有员工口碑
		String Teacher_id="0";
		//每页显示条数
		int pageSize=10;
		//根据分页条件查询
		List<OaJzbPraise> list=oajzbpraiseservice.selectpraiselist(7,Integer.parseInt(Teacher_id),oajzbpraise.getConsultant_name(), oajzbpraise.getPayStauts(),Integer.parseInt(currentPage),pageSize);
		
		//根据条件查询记录数
		int count=oajzbpraiseservice.selectpraiseCount(7,Integer.parseInt(Teacher_id), oajzbpraise.getConsultant_name(), oajzbpraise.getPayStauts());
		//总页数
		int pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("praiselist", list);
		map.put("currentPage", Integer.parseInt(currentPage));
		map.put("pageCount", pageCount);
		map.put("totalCount", count);
		return JSONArray.toJSONString(map);
	}
	//主管根据编号查看详细口碑
	@RequestMapping(value="/personalinfo.html")
	public String selectpersonalinfo(String id,HttpServletRequest request){
			OaJzbPraise obj=oajzbpraiseservice.selectpariseinfo(Integer.parseInt(id));
			OaJzbPraise obj2s=oajzbpraiseservice.selectpariseinfo2s(Integer.parseInt(id));
			request.setAttribute("praiseinfo", obj);
			request.setAttribute("sponsor", obj2s);
			return "teach_nature_department/jzb/personalinfo";
		}
}
