package cn.tyyhoa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.service.OaJzbSpecialtyService;

@Controller
public class OaJzbSpecialtyController {

	@Autowired
	OaJzbSpecialtyService specialtySer;
	//添加跳转
	@RequestMapping(value="/addSpecialty.html")
	public String addTzSpecialty(){
		
		return "teach_nature_department/jzb/addcourse";
	}
	@RequestMapping(value="/addDataSpecialty")
	public String addDataSpecialty(@ModelAttribute OaJzbSpecialty record){
		boolean flag=specialtySer.findinsert(record);
		if(flag){
			return "redirect:/oaJwbGradeslist.html";
		}else{
			return "redirect:/addSpecialty.html";
		}
	}
	
	@RequestMapping(value="addquestionlipeng")
	public String addquestion(){
		return "teach_nature_department/jzb/addquestion";
	}
}
