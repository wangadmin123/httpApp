package cn.tyyhoa.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.OaRlzybHatCity;
import cn.tyyhoa.pojo.OaRlzybHatProvince;
import cn.tyyhoa.service.OaJybCityService;

@RequestMapping("/employment_department")
@Controller
public class OaJybCitysController {
	@Autowired
	OaJybCityService oaJybCityService;
	 @RequestMapping(value = "/GetProvinceList", produces = "text/html;charset=UTF-8;")
		@ResponseBody
		public String GetProvinceList() {
			List<OaRlzybHatProvince> oaRlzybHatProvinceList = oaJybCityService.selectAllOaRlzybHatProvince();
					
			String optionStr = "";
			optionStr += "<option value=''>请选择</option>";
			for (Iterator<OaRlzybHatProvince> iterator = oaRlzybHatProvinceList.iterator(); iterator
					.hasNext();) {
				OaRlzybHatProvince oaRlzybHatProvince = iterator
						.next();
				
				optionStr += "<option value='" + oaRlzybHatProvince.getProvinceID()
						+ "' >" + oaRlzybHatProvince.getProvince() + "</option>";
			}
			return optionStr;
		}
		@RequestMapping(value = "/GetCityList", produces = "text/html;charset=UTF-8;")
		@ResponseBody
		public String GetProvinceList(@RequestParam("ProvinceId") String ProvinceId) {
			List<OaRlzybHatCity> oaRlzybHatCityList = oaJybCityService.selectSomeOaRlzybHatCityByfather(ProvinceId);
					
			String optionStr = "";
			if(ProvinceId.equals("110000")||ProvinceId.equals("120000")||ProvinceId.equals("310000")||
					ProvinceId.equals("500000")||ProvinceId.equals("810000")||ProvinceId.equals("820000")
					){
				
				
				/*if(ProvinceId.equals("110000")){optionStr += "<option value='北京市'>北京市</option>";}
				if(ProvinceId.equals("120000")){optionStr += "<option value='天津市'>天津市</option>";}
				if(ProvinceId.equals("310000")){optionStr += "<option value='上海市'>上海市</option>";}
				if(ProvinceId.equals("500000")){optionStr += "<option value='重庆市'>重庆市</option>";}
				if(ProvinceId.equals("810000")){optionStr += "<option value='香港'>香港</option>";}
				if(ProvinceId.equals("820000")){optionStr += "<option value='澳门'>澳门</option>";}*/
				
				
				if(ProvinceId.equals("110000")){optionStr += " <td class='tdWidth'>城市：</td><td> <input type='radio' value='北京市' name='company_city' checked='checked' class='radioStyle' />北京市</td>";}
				if(ProvinceId.equals("120000")){optionStr += " <td class='tdWidth'>城市：</td><td> <input type='radio' value='天津市' name='company_city' checked='checked' class='radioStyle' />天津市</td>";}
				if(ProvinceId.equals("310000")){optionStr += " <td class='tdWidth'>城市：</td><td> <input type='radio' value='上海市' name='company_city' checked='checked' class='radioStyle' />上海市</td>";}
				if(ProvinceId.equals("500000")){optionStr += " <td class='tdWidth'>城市：</td><td> <input type='radio' value='重庆市' name='company_city' checked='checked' class='radioStyle' />重庆市</td>";}
				if(ProvinceId.equals("810000")){optionStr += " <td class='tdWidth'>城市：</td><td> <input type='radio' value='香港' name='company_city' checked='checked' class='radioStyle' />香港</td>";}
				if(ProvinceId.equals("820000")){optionStr += " <td class='tdWidth'>城市：</td><td> <input type='radio' value='澳门' name='company_city' checked='checked' class='radioStyle' />澳门</td>";}
				
				
				
				return optionStr;
			}
			
			else{optionStr += "<td class='tdWidth'>城市：</td><td>";
			for (Iterator<OaRlzybHatCity> iterator = oaRlzybHatCityList.iterator(); iterator
					.hasNext();) {
				
				OaRlzybHatCity oaRlzybHatCity = iterator.next();
				optionStr += "  <input type='radio' value='" + oaRlzybHatCity.getCity() + "' name='company_city'  class='radioStyle' />"+oaRlzybHatCity.getCity();
				/*optionStr += "<option value='" + oaRlzybHatCity.getCity() + "' >"
						+ oaRlzybHatCity.getCity() + "</option>";*/}
			optionStr +="</td>";
			}
			
			return optionStr;
		}	
}
