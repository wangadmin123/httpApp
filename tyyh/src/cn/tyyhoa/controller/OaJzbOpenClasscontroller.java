package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;


import cn.tyyhoa.pojo.OaJzbOpenClass;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.service.OaJzbOpenClassService;
import cn.tyyhoa.util.OaJzbRevoke;

@Controller
public class OaJzbOpenClasscontroller {
	@Autowired
    OaJzbOpenClassService openclassSer;
	
	/*根据姓名查询*/
	@RequestMapping(value="openclass/kb")
	@ResponseBody
	public Object getSelectName(@RequestParam(required=false) String name,@RequestParam String currentPage,HttpServletRequest request,HttpSession session){
		String id = (String) session.getAttribute("gradeid");
		//根据姓名查询
		int pageSize=10;//每页显示10条
		List<OaJzbOpenClass> list=openclassSer.findNameSelect(name,Integer.parseInt(id),Integer.parseInt(currentPage),pageSize);
		List<Object> fals = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(list.get(i).getEnteringTime());
			fals.add(a);
		}
		int count=openclassSer.findNameSelectCount(name, Integer.parseInt(id));//获取总记录数
		int pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;//总页数
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("fals", fals);
		map.put("currentPage", Integer.parseInt(currentPage));
		map.put("pageCount", pageCount);
		map.put("totalCount", count);
		map.put("openclasslist", list);
		return JSONArray.toJSONString(map);
	}
	/*开班情况分析添加跳转页面*/
	@RequestMapping(value="/addtiaozhuan.html")
	public String addTzOpenClass(HttpServletRequest request,HttpSession session){
		//查询学历
		List<OaScbEducation> list=openclassSer.findShowEducation();
		request.setAttribute("educationlist", list);
		return "teach_nature_department/jzb/addkbqk";
	}
	/*添加*/
	@RequestMapping(value="/addopenclass.html")
	public String addOpenClass(@ModelAttribute OaJzbOpenClass openclass,
			HttpServletRequest request,HttpSession session){
		String gradeid = (String) session.getAttribute("gradeid");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date1 = df.format(new Date());// new Date()为获取当前系统时间
		Date date2 = null; 
		try {
			date2=df.parse(date1.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//转换为默认Date格式
		openclass.setEnteringTime(date2);
		int id = Integer.parseInt(gradeid);
		openclass.setGradeId(id);
		openclass.setDeleteStatus(0);
		boolean flag=openclassSer.getAddOpenClass(openclass);
		if(flag){
			return "redirect:/gradeShowListLink/"+Integer.parseInt(gradeid);
		}else{
			return "redirect:/addtiaozhuan.html";
		}
	}
	/*修改跳转页面*/
	@RequestMapping(value="/modifykbqk/{id}")
	public String editOpenClass(@PathVariable String id,HttpServletRequest request){
		OaJzbOpenClass openclass=openclassSer.findOpenClass(Integer.parseInt(id));
		List<OaScbEducation> list=openclassSer.findShowEducation();
		request.setAttribute("educationlist", list);
		request.setAttribute("openclass", openclass);
		return "teach_nature_department/jzb/editkbqk";
	}
	/*修改数据*/
	@RequestMapping(value="/editkbqk",method=RequestMethod.POST)
	public String updataOpenClass(@ModelAttribute OaJzbOpenClass openclass,HttpSession session){
		boolean flag=openclassSer.updataOpenclass(openclass);
		String gradeid = (String) session.getAttribute("gradeid");
		if(flag){
			return "redirect:/gradeShowListLink/"+Integer.parseInt(gradeid);
		}else{
			return "redirect:/modifykbqk";
		}
	}
	/*删除*/
	@RequestMapping(value="/delkbqk/{id}")
	public String delOpenClass(@PathVariable String id,HttpSession session){
		int row=openclassSer.deleOpenClass(Integer.parseInt(id));
		String gradeid = (String) session.getAttribute("gradeid");
		if(row!=0){
			return "redirect:/gradeShowListLink/"+Integer.parseInt(gradeid);
		}else{
			return "redirect:/gradeShowListLink/"+Integer.parseInt(gradeid);
		}
		
		
	}
}
