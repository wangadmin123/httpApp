package cn.tyyhoa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*import javax.ws.rs.PathParam;*/

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.Msg;
import cn.tyyhoa.pojo.OaKfbMetting;
import cn.tyyhoa.service.impl.OaKfbMettingServiceImpl;

@Controller
@RequestMapping("/KfbMetting")
public class OaKfbMettingController {

	@Autowired
	OaKfbMettingServiceImpl mettingServiceImpl;
	
	@ResponseBody
	@RequestMapping(value="/getmetting",method=RequestMethod.POST)
	public  Msg gethistorystu(
			@RequestParam(value = "gradeid",required=false) Integer gradeid,
			@RequestParam(value = "groupid",required=false) Integer groupid) {
		if(gradeid!=null&&gradeid==0){
			gradeid=null;
		}
		if(groupid!=null&&groupid==0){
			groupid=null;
		}
		System.out.println(gradeid);
		System.out.println(groupid);
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("gradeid", gradeid);
		paramMap.put("groupid", groupid);
		List<OaKfbMetting> mettings=mettingServiceImpl.gethistoryMet(paramMap);
		return Msg.success().add("mettings", mettings);
	}
	
}
