package cn.tyyhoa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value = "/Tabindex")
@Controller
public class Tabindex {
	@ResponseBody
	@RequestMapping(value = "/saveIndex")
	public Object saveIndex(HttpServletRequest req,HttpSession session){
		Integer index=Integer.parseInt(req.getParameter("index"));
		
		session.setAttribute("index", index);
		return index;
	}

}
