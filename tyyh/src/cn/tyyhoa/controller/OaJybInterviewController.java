package cn.tyyhoa.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJybInterview;
import cn.tyyhoa.pojo.OaJybInterviewScore;
import cn.tyyhoa.pojo.OaJybVisit;
import cn.tyyhoa.pojo.OaRlzybPosition;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaJybChronicleService;
import cn.tyyhoa.service.OaJybHuifangService;
import cn.tyyhoa.service.OaJybInterService;
import cn.tyyhoa.service.OaJybInterviewService;

@RequestMapping("/employment_department")
@Controller
public class OaJybInterviewController {
	@Autowired
	OaJybInterviewService oaJybInterviewService;
	@Autowired
	OaJybInterService oaJybInterService;
	@Autowired
	OaJybHuifangService oaJybHuifangService;
	@Autowired
	OaJybChronicleService oaJybChronicleService;
	public OaJybChronicleService getOaJybChronicleService() {
		return oaJybChronicleService;
	}


	public void setOaJybChronicleService(OaJybChronicleService oaJybChronicleService) {
		this.oaJybChronicleService = oaJybChronicleService;
	}


	public OaJybHuifangService getOaJybHuifangService() {
		return oaJybHuifangService;
	}


	public void setOaJybHuifangService(OaJybHuifangService oaJybHuifangService) {
		this.oaJybHuifangService = oaJybHuifangService;
	}


	public OaJybInterService getOaJybInterService() {
		return oaJybInterService;
	}


	public void setOaJybInterService(OaJybInterService oaJybInterService) {
		this.oaJybInterService = oaJybInterService;
	}


	public OaJybInterviewService getOaJybInterviewService() {
		return oaJybInterviewService;
	}


	public void setOaJybInterviewService(OaJybInterviewService oaJybInterviewService) {
		this.oaJybInterviewService = oaJybInterviewService;
	}


	@RequestMapping(value="/mianshi")
	public String dhd(HttpServletRequest request,HttpSession session){
		OaRlzybUser user =(OaRlzybUser) session.getAttribute("loginUser"); 
		OaRlzybPosition posutio = user.getPosition();
		
		List<OaJybVisit> fff=oaJybHuifangService.GetGrades(posutio.getPosition_id(),user.getEmp_id());
		request.setAttribute("gradess", fff);
		
		return "employment_department/monimianshi";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/moni",produces="application/json;charset=utf-8",method=RequestMethod.POST)
 	@ResponseBody
 	public String ggf(String studentname,String gradename,Integer index, Integer pageSize,HttpSession session){
		HashMap<String, Object>	result = new HashMap<String, Object>();
		OaRlzybUser user =(OaRlzybUser) session.getAttribute("loginUser"); 
		OaRlzybPosition posutio = user.getPosition();
		int count = oaJybInterviewService.GetAllCounts(studentname, gradename, index, 10,posutio.getPosition_id(),user.getEmp_id());
		 int counts=count%10==0?count/10:count/10+1;
		 List<OaJybInterviewScore> lists = oaJybInterviewService.GetAllIntervie(studentname, gradename, index,10,posutio.getPosition_id(),user.getEmp_id());
		 result.put("index", index);
		 result.put("count", counts);
		 result.put("lists", lists);
		 return JSONArray.toJSONStringWithDateFormat(result, "yyyy-MM-dd HH:mm");
		
		
		
	}
	
	@RequestMapping(value="/mianshii")
	public String dhd(int id,String name,String gname,HttpServletRequest request){
		Date date = new Date();
		DateFormat  df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String shijian=df.format(date);
		String sname;
		try {
			 sname=new String(name);
			 request.setAttribute("stuname", sname);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("shijian", shijian);
		request.setAttribute("gname", gname);
		request.setAttribute("id", id);		
		return "employment_department/addmianshi";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/monimoni",produces="application/json;charset=utf-8",method=RequestMethod.POST)
 	@ResponseBody
 	public String dhfdd(String[] jibenliyi,String[] yizhuo,String[] yibiao,String[] chengwaibiaoxian,
			String[] jibenjiqiao,String[] ziwojieshao,String[] yaodiankaocha,String zonghexingkaocha,
			String[] waiguan,String[] neirong ,String zhengzhuang,String limao,String zhunbei,String chaoxi
			){
		int liyi=0;
		if(jibenliyi != null ){
			for (int i = 0; i < jibenliyi.length; i++) {
				String string = jibenliyi[i];
				if(string != "")liyi=Integer.parseInt(string)+liyi;
			}
			
		}
		else liyi=0;
		
		//礼仪部分 liyi
		int yz=0;
		int tj=0;
		if(zhengzhuang != ""){
			tj=Integer.parseInt(zhengzhuang);
		}
		if(yizhuo!= null && tj !=0 || zhengzhuang==""){
			for (int i = 0; i < yizhuo.length; i++) {
				String string = yizhuo[i];
				if(string != "")yz+=Integer.parseInt(string);
			}
			if(zhengzhuang !=""){yz+=Integer.parseInt(zhengzhuang);}
		}
		else yz=0;
		
		//衣着部分 yz
		int yb=0;
		if(jibenliyi != null ){
			for (int i = 0; i < yibiao.length; i++) {
				String string = yibiao[i];
				if(string != "")yb=Integer.parseInt(string)+yb;
			}
			
		}
		else yb=0;
		//仪表部分   yb
		int bx=0;
		int ii=0;
		if(limao!=""){ii=Integer.parseInt(limao);}
		if(yizhuo!= null && ii !=0 || limao==""){
			for (int i = 0; i < chengwaibiaoxian.length; i++) {
				String string = chengwaibiaoxian[i];
				if(string != "")bx+=Integer.parseInt(string);
			}
		 if(limao != ""){	bx+=Integer.parseInt(limao);}
		}
		else bx=0;
		//场外表现部分 bx
		int jbjq=0;
		if(jibenjiqiao != null ){
			for (int i = 0; i < jibenjiqiao.length; i++) {
				String string = jibenjiqiao[i];
				if(string != "")jbjq+=Integer.parseInt(string);
			}
			
		}
		else jbjq=0;
		//基本技巧部分 jbjq
		int zwjs=0;
		int ggf=0;
		if(zhunbei != ""){ggf=Integer.parseInt(zhunbei);}
		if(ziwojieshao!= null && ggf !=0 || zhunbei==""){
			for (int i = 0; i < ziwojieshao.length; i++) {
				String string = ziwojieshao[i];
				if(string != "")zwjs+=Integer.parseInt(string);
			}
			if(zhunbei != "")zwjs+=Integer.parseInt(zhunbei);
		}
		else zwjs=0;
		//自我介绍   zwjs
		int ydkc=0;
		if(yaodiankaocha != null ){
			for (int i = 0; i < yaodiankaocha.length; i++) {
				String string = yaodiankaocha[i];
				if(string != "")ydkc+=Integer.parseInt(string);
			}
			
		}
		else ydkc=0;
		//要点考察ydkc
		int zhxkc=0;
		if(zonghexingkaocha!="")zhxkc=Integer.parseInt(zonghexingkaocha);
		//综合性考察  zhxkc
		int wg=0;
		if(waiguan != null ){
			for (int i = 0; i < waiguan.length; i++) {
				String string = waiguan[i];
				if(string != "")wg+=Integer.parseInt(string);
			}
			
		}
		else wg=0;
		//外观 wg
		
		int nr=0;
		int df=0;
		if(chaoxi != ""){df=Integer.parseInt(chaoxi);}
		if(neirong!= null && df !=0 || chaoxi==""){
			for (int i = 0; i < neirong.length; i++) {
				String string = neirong[i];
				if(string != "")nr+=Integer.parseInt(string);
			}
			if(chaoxi != ""){nr+=Integer.parseInt(chaoxi);};
		}
		else nr=0;
		
	  int	zongfen=liyi+yz+yb+bx+jbjq+zwjs+ydkc+zhxkc+wg+nr;
	  Map<String, Integer> result= new HashMap<String, Integer>();
	  result.put("zongfen", zongfen);
	  return JSONArray.toJSONString(result);
	  
	  
		
		
	}
	
	
	
	@RequestMapping(value="/jiamianshii")
	public String dhdd(String[] jibenliyi,String[] yizhuo,String[] yibiao,String[] chengwaibiaoxian,
			String[] jibenjiqiao,String[] ziwojieshao,String[] yaodiankaocha,String zonghexingkaocha,
			String[] waiguan,String[] neirong ,String zhengzhuang,String limao,String zhunbei,String chaoxi
			,String studentid,String mianshiriqi,OaJybInterview oaJybInterview,HttpSession session){
		 //插入老师表
		/*DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			oaJybInterview.setInterview_time(df.parse(mianshiriqi));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		Date date = new Date();
		OaRlzybUser user =(OaRlzybUser) session.getAttribute("loginUser"); 
		oaJybInterview.setInterview_time(date);
		oaJybInterview.setMianshibiao_id(Integer.parseInt(studentid));
		oaJybInterview.setInterview_staff(user.getEmp_name());
		int updateNum=oaJybInterService.updateByPrimaryKeySelective(oaJybInterview);
		if(updateNum==0){
			oaJybInterService.insertByPrimaryKeySelective(oaJybInterview);
		}
		OaJybChronicle oaJybChronicle = new OaJybChronicle();
		oaJybChronicle.setStudent_id(Integer.parseInt(studentid));
		oaJybChronicle.setEvent_time(date);
		/*try {
			oaJybChronicle.setEvent_time(df.parse(mianshiriqi));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		
		
		
		
		
		
		
		int liyi=0;
		if(jibenliyi != null ){
			for (int i = 0; i < jibenliyi.length; i++) {
				String string = jibenliyi[i];
				if(string != "")liyi=Integer.parseInt(string)+liyi;
			}
			
		}
		else liyi=0;
		
		//礼仪部分 liyi
		int yz=0;
		int tj=0;
		if(zhengzhuang != ""){
			tj=Integer.parseInt(zhengzhuang);
		}
		if(yizhuo!= null && tj !=0 || zhengzhuang==""){
			for (int i = 0; i < yizhuo.length; i++) {
				String string = yizhuo[i];
				if(string != "")yz+=Integer.parseInt(string);
			}
			if(zhengzhuang !=""){yz+=Integer.parseInt(zhengzhuang);}
		}
		else yz=0;
		
		//衣着部分 yz
		int yb=0;
		if(jibenliyi != null ){
			for (int i = 0; i < yibiao.length; i++) {
				String string = yibiao[i];
				if(string != "")yb=Integer.parseInt(string)+yb;
			}
			
		}
		else yb=0;
		//仪表部分   yb
		int bx=0;
		int ii=0;
		if(limao!=""){ii=Integer.parseInt(limao);}
		if(yizhuo!= null && ii !=0 || limao==""){
			for (int i = 0; i < chengwaibiaoxian.length; i++) {
				String string = chengwaibiaoxian[i];
				if(string != "")bx+=Integer.parseInt(string);
			}
		 if(limao != ""){	bx+=Integer.parseInt(limao);}
		}
		else bx=0;
		//场外表现部分 bx
		int jbjq=0;
		if(jibenjiqiao != null ){
			for (int i = 0; i < jibenjiqiao.length; i++) {
				String string = jibenjiqiao[i];
				if(string != "")jbjq+=Integer.parseInt(string);
			}
			
		}
		else jbjq=0;
		//基本技巧部分 jbjq
		int zwjs=0;
		int ggf=0;
		if(zhunbei != ""){ggf=Integer.parseInt(zhunbei);}
		if(ziwojieshao!= null && ggf !=0 || zhunbei==""){
			for (int i = 0; i < ziwojieshao.length; i++) {
				String string = ziwojieshao[i];
				if(string != "")zwjs+=Integer.parseInt(string);
			}
			if(zhunbei != "")zwjs+=Integer.parseInt(zhunbei);
		}
		else zwjs=0;
		//自我介绍   zwjs
		int ydkc=0;
		if(yaodiankaocha != null ){
			for (int i = 0; i < yaodiankaocha.length; i++) {
				String string = yaodiankaocha[i];
				if(string != "")ydkc+=Integer.parseInt(string);
			}
			
		}
		else ydkc=0;
		//要点考察ydkc
		int zhxkc=0;
		if(zonghexingkaocha!="")zhxkc=Integer.parseInt(zonghexingkaocha);
		//综合性考察  zhxkc
		int wg=0;
		if(waiguan != null ){
			for (int i = 0; i < waiguan.length; i++) {
				String string = waiguan[i];
				if(string != "")wg+=Integer.parseInt(string);
			}
			
		}
		else wg=0;
		//外观 wg
		
		int nr=0;
		int dff=0;
		if(chaoxi != ""){dff=Integer.parseInt(chaoxi);}
		if(neirong!= null && dff !=0 || chaoxi==""){
			for (int i = 0; i < neirong.length; i++) {
				String string = neirong[i];
				if(string != "")nr+=Integer.parseInt(string);
			}
			if(chaoxi != ""){nr+=Integer.parseInt(chaoxi);};
		}
		else nr=0;

		OaJybInterviewScore oaJybInterviewScore = new OaJybInterviewScore();
		oaJybInterviewScore.setInterview_score_studentId(Integer.parseInt(studentid));
		oaJybInterviewScore.setInterview_score_basic_etiquette(liyi);
		oaJybInterviewScore.setInterview_score_clothing(yz);
		oaJybInterviewScore.setInterview_score_appearance(yb);
		oaJybInterviewScore.setInterview_score_expression(bx);
		oaJybInterviewScore.setInterview_score_skill(jbjq);
		oaJybInterviewScore.setInterview_score_self_introduction(zwjs);
		oaJybInterviewScore.setInterview_score_skill_main(ydkc);
		oaJybInterviewScore.setInterview_score_synthesize(zhxkc);
		oaJybInterviewScore.setInterview_score_surface(wg);
		oaJybInterviewScore.setInterview_score_content(nr);
		oaJybInterviewScore.setInterview_score_totalscore(liyi+yz+yb+bx+jbjq+zwjs+ydkc+zhxkc+wg+nr);
		updateNum= oaJybInterviewService.updateByPrimaryKeySelective(oaJybInterviewScore);
		if(updateNum==0){
			oaJybInterviewService.insertByPrimaryKeySelective(oaJybInterviewScore);
		}
		oaJybChronicle.setEvent_name("模拟面试成绩为："+(liyi+yz+yb+bx+jbjq+zwjs+ydkc+zhxkc+wg+nr));
		oaJybChronicleService.insertSelective(oaJybChronicle);
		return "employment_department/monimianshi";
		
		
	}
	
	@RequestMapping(value="/dange")
	public String khkl(int id,HttpServletRequest request){
		List<OaJybInterviewScore> interews = oaJybInterviewService.GetBanjiInterview(id);
		request.setAttribute("interviews", interews);
		return "employment_department/chakanmoni";
	}
	

}
