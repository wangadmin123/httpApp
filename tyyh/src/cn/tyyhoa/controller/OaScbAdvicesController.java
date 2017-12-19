package cn.tyyhoa.controller;


import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;


import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbAdvices;
import cn.tyyhoa.service.OaScbAdvicesService;
import cn.tyyhoa.util.MessageUtil;

@Controller
public class OaScbAdvicesController {
	@Resource(name="oaScbAdvicesService")
	OaScbAdvicesService osas;

	public OaScbAdvicesService getOsas() {
		return osas;
	}

	public void setOsas(OaScbAdvicesService osas) {
		this.osas = osas;
	}
	
	@ResponseBody
	@RequestMapping("/adviceadd")
	public Object add(MessageUtil mu){
		Integer i= osas.add(mu);
		return i;
		
	}
	
	@ResponseBody
	@RequestMapping("/getalladvice")
	public Object getall(Integer id){
		List<OaScbAdvices> list=osas.getById(id);
		return JSON.toJSONString(list);
	}
	
	@ResponseBody
	@RequestMapping("/shan")
	public Object shan(Integer id){
		
		return osas.del(id);
	}
	
	@ResponseBody
	@RequestMapping("/chazhiwei")
	public Object cha(String name){
		List<OaRlzybUser> zlID= osas.getByPnaem(name);
	
		return JSON.toJSONString(zlID);
	}
	
	@ResponseBody
	@RequestMapping("/weidu")
	public Object weidu(Integer id){
		Integer i=osas.weidu(id);
		System.out.println(i);
		return osas.weidu(id);
	}
	
	@ResponseBody
	@RequestMapping("/yidu")
	public Object yidu(Integer id){
		Integer i=osas.yidu(id);
		System.out.println(i);
		return i;
	}
}
