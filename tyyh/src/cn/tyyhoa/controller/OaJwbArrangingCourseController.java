package cn.tyyhoa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJwbArrangingCourse;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.service.OaJwbArrangingCourseService;

@Controller
public class OaJwbArrangingCourseController {
	@Resource(name="oaJwbArrangingCourseService")
	private OaJwbArrangingCourseService ojacs;

	public OaJwbArrangingCourseService getOjacs() {
		return ojacs;
	}

	public void setOjacs(OaJwbArrangingCourseService ojacs) {
		this.ojacs = ojacs;
	}
	
	@RequestMapping("/arrangCourse.html")
	public String arrangingCourse(){
		return "academic_affairs_department/arrangingCourse";
	}
	
	@RequestMapping("/getArrangCourse.html")
	public String getArrangingCourse(){
		return "academic_affairs_department/getArrangingCourse";
	}
	
	@ResponseBody
	@RequestMapping("/getUnArranging")
	public Object getUnArranging(String index,String pageSizes){
		if(index==null||index.equals("")){
			index="1";
		}
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}
		Integer pageSize=Integer.valueOf(pageSizes);
		Integer pageno=Integer.valueOf(index);
		List<OaJwbGrade> list=ojacs.getUnArranging((pageno-1)*pageSize,pageSize);
		Integer count=ojacs.getUnArrangingcount();
		Integer pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
		Map<String,Object> resultMap=new HashMap<String,Object>();
		resultMap.put("index", index);
		resultMap.put("pageCount", pageCount);
		resultMap.put("consulterList", list);
		resultMap.put("totalCount", count);
		resultMap.put("pageSize", pageSize);
		return JSONArray.toJSONString(resultMap);
	}
	
	@RequestMapping(value="/addArrange")
	@ResponseBody
	public Object addArrange(
			@RequestParam(required=false) String consultTeacherid,
			@RequestParam(required=false) String[] s,
			String employee_id,
			HttpServletRequest request
			){
		Integer h=0;
		if(consultTeacherid!=null&&consultTeacherid.equals("0")){
			return "0";
		}else if(s!=null && consultTeacherid!=null){/*批量分发*/
			for (int i = 0; i < s.length; i++) {
				Integer id=Integer.valueOf(s[i]);
				OaJwbGrade ojg=new OaJwbGrade();
				ojg.setId(id);
				OaJwbArrangingCourse oja=new OaJwbArrangingCourse();
				oja.setClassId(ojg);
				oja.setCourse(Integer.valueOf(consultTeacherid));
				Integer j=ojacs.addArrange(oja);
				if (j>0) {
					h++;
				}
			}
		}
		if (h>0) {
			return "true";
		}else{
			return "false";	
		}
			
	}
	
	@RequestMapping(value="/delArrange")
	@ResponseBody
	public Object delArrange(
			@RequestParam(required=false) String[] s,
			String employee_id,
			HttpServletRequest request
			){
		Integer h=0;
		 if(s!=null){/*批量分发*/
			for (int i = 0; i < s.length; i++) {
				Integer id=Integer.valueOf(s[i]);
				Integer j=ojacs.delArrange(id);
				if (j>0) {
					h++;
				}
			}
		}
		if (h>0) {
			return "true";
		}else{
			return "false";	
		}
			
	}
	
	@RequestMapping(value="/updArrange")
	@ResponseBody
	public Object updArrange(
			@RequestParam(required=false) String consultTeacherid,
			@RequestParam(required=false) String[] s,
			String employee_id,
			HttpServletRequest request
			){
		Integer h=0;
		if(consultTeacherid!=null&&consultTeacherid.equals("0")){
			return "0";
		}else if(s!=null && consultTeacherid!=null){/*批量分发*/
			for (int i = 0; i < s.length; i++) {
				Integer id=Integer.valueOf(s[i]);
				Integer course=Integer.valueOf(consultTeacherid);
				Integer j=ojacs.updateArrange(id, course);
				if (j>0) {
					h++;
				}
			}
		}
		if (h>0) {
			return "true";
		}else{
			return "false";	
		}
			
	}
	
	@RequestMapping(value="/getAllArrange")
	@ResponseBody
	public Object getAllArrange(OaJwbArrangingCourse course,
			String index,
			String pageSizes  /*每页显示的条数*/){
		if(index==null||index.equals("")){
			index="1";
		}
		if(pageSizes==null||pageSizes.equals("")){
			pageSizes="10";
		}
		Integer pageSize=Integer.valueOf(pageSizes);
		Integer pageno=(Integer.valueOf(index)-1)*pageSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("Arrange", course);
		map.put("pon", pageno);
		map.put("psize", pageSize);
		List<OaJwbArrangingCourse> list=ojacs.getArrange(map);
		Integer count=ojacs.getArrangecount(map);
		Integer pageCount=count%pageSize==0?count/pageSize:count/pageSize+1;
		Map<String,Object> resultMap=new HashMap<String,Object>();
		resultMap.put("index", index);
		resultMap.put("pageCount", pageCount);
		resultMap.put("consulterList", list);
		resultMap.put("totalCount", count);
		resultMap.put("pageSize", pageSize);
		return JSONArray.toJSONString(resultMap);
	}
}
