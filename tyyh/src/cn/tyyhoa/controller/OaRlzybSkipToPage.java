package cn.tyyhoa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/skiptopage")
public class OaRlzybSkipToPage {

	@RequestMapping("/topage/{site}")
	public String toPage(@PathVariable String site){
		
		
		return "human_resource_department/"+site;
		
	}
}
