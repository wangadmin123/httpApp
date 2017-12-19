package cn.tyyhoa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaRlzybDepartmentService;

@Controller
public class OaXzChoosepositionController {
	@Resource(name="oaRlzybDepartmentService")
	OaRlzybDepartmentService oa;
	
	@RequestMapping(value="chooseposition")
	public String chooseposition(HttpSession session){
		List<OaRlzybDepartment> li = new ArrayList<OaRlzybDepartment>();
		
		li=oa.chooseposition();
		session.setAttribute("li", li);
		
		for(OaRlzybDepartment it:li){
			System.out.println("\n============================================");
			System.out.println(it.getDepart_name());
			
			for(OaRlzybUser it2:it.getLi()){
				System.out.print(it2.getUser_name()+"-"+it2.getEmp().getEmp_name()+"-"+it2.getPosition().getPosition_name()+"==");
			}
		}
		return "headmaster_department/chooseposition";
	}
}
