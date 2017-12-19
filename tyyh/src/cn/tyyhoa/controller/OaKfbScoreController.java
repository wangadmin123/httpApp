package cn.tyyhoa.controller;

import java.util.Date;
import java.util.List;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.Msg;
import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.pojo.OakfbScore;
import cn.tyyhoa.pojo.OakfbScoreExample;
import cn.tyyhoa.service.OaKfbScoreService;

@Controller
@RequestMapping("/KfbScore")
public class OaKfbScoreController {

	@Autowired
	OaKfbScoreService scoreService;
	
	
	@ResponseBody
	@RequestMapping(value="IsClick/{userid}",method=RequestMethod.POST)
	public Msg IsClick(@PathVariable Integer userid) throws ParseException{
		OakfbScore score=ClickUser(userid);
		Integer flag;
		if(score==null) {
			flag=0;
		}else {
			if (score.getOuttiam()==null) {
				flag=1;
			}
			else {
				flag=2;	
			}
		}
		return Msg.success().add("flag", flag);	
	}
	
	
	/**
	 * 计算签到/签退的状态
	 * @param date1
	 * @param date2
	 * @return
	 * @throws ParseException
	 */
	public Integer Status(String date1,String date2) throws ParseException {
		Integer status;
		SimpleDateFormat df=new SimpleDateFormat("HH:mm:ss"); 
		 Date Time1 = df.parse(date1);
		 Date Time2=  df.parse(date2);
		 long diff = Time1.getTime() - Time2.getTime();
		 diff = diff / (1000 * 60);   
		  if(diff<=0) {
			  status=0;
		  }else{
			  if(diff<30) {
				 status=1;
			  }else if (diff>=30&&diff<=60) {
				 status=2;
			}else {
				status=3;
			}
		  }
		return status;
	}	
	/**
	 * 获取签到数据的id
	 * @return
	 * @throws ParseException
	 */
	public OakfbScore ClickUser(Integer userid) throws ParseException {
		OakfbScoreExample example=new OakfbScoreExample();
		cn.tyyhoa.pojo.OakfbScoreExample.Criteria create = example.createCriteria();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		 Date Time2=new Date();
		 String nowtime=df.format(Time2);
		 String click=nowtime.substring(0,nowtime.lastIndexOf(" ")+1);
		 Date Time1 = df.parse(click+"0:00:00");
		create.andClocktimeBetween(Time1, Time2);
		create.andUser_idEqualTo(userid);
		List<OakfbScore>list=scoreService.ClickIsExis(example);
		OakfbScore score=null;
		if (list.size()!=0) {
			score=list.get(0);
		}
		return score;
	}
	/**
	 * 计算分值
	 * @param status
	 * @return
	 */
	public Integer DayScore(Integer status) {
		Integer score=0;
		if(status==1) {
			score=10;
		}else if(status==2) {
			score=15;
		}else if(status==3){
			score=30;
		}
		return score;	
	}	
	/**
	 * 签到
	 * @param nowtime
	 * @param session
	 * @return
	 * @throws ParseException
	 */
	@ResponseBody
	@RequestMapping(value="clickTime/{nowtime}",method=RequestMethod.POST)
	public Msg clickTime(@PathVariable String nowtime,HttpSession session) throws ParseException{
		  SimpleDateFormat datef=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		  Date clickwork=datef.parse(nowtime);
		  String click=nowtime.substring(nowtime.lastIndexOf(" ") + 1);
		  Integer clockstatus=Status(click, "9:00:00");
		  OaKfbUser user = (OaKfbUser) session.getAttribute("user");
		  Integer id = user.getId();
		  OakfbScore score=new OakfbScore();
		  score.setUser_id(id);
		  score.setClocktime(clickwork);
		  score.setClockstatus(clockstatus);	  
		  scoreService.addscore_click(score);
		return Msg.success();	
	}
	/**
	 * 签退
	 * @param nowtime
	 * @param session
	 * @return
	 * @throws ParseException
	 */
	@ResponseBody
	@RequestMapping(value="outTime/{nowtime}",method=RequestMethod.POST)
	public Msg outTime(@PathVariable String nowtime,HttpSession session) throws ParseException{
		  SimpleDateFormat datef=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		  Date clickwork=datef.parse(nowtime);
		  String click=nowtime.substring(nowtime.lastIndexOf(" ") + 1);
		  Integer outstatus=Status("17:30:00",click);
		  OaKfbUser user = (OaKfbUser) session.getAttribute("user");
		  OakfbScore score=ClickUser(user.getId());
		  Integer clockstatus = score.getClockstatus();
		  Integer dayscores=DayScore(clockstatus)+DayScore(outstatus);
		  if (dayscores>=30) {
			  score.setScore(0);
		}else {
			  score.setScore(30-dayscores);
		} 
		  score.setOuttiam(clickwork);
		  score.setOutstatus(outstatus);
		  scoreService.updatescore_out(score);
		return Msg.success();	
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	public static void main(String[] args) {
//		OaKfbScoreExample scoreExample=new OaKfbScoreExample();
//		Criteria create = scoreExample.createCriteria();
//		//Clocktime签到时间
//		create.andClocktimeIsNotNull();//签到次数（不为空）
//		//create.andClocktimeBetween(Date1, Date2) 签到时间在9点到5点半的算迟到
//		create.andClocktimeIsNull();//未签到次数（为空）
//		
//		//andOuttiam签退时间
//		create.andOuttiamIsNotNull();//签退次数（不为空）
//		//create.andOuttiamBetween(Date1, Date2) 签退时间在9点到5点半的算早退
//		create.andOuttiamIsNull();//未签退次数（为空）
//		
//		//假设1代表请假
//		create.andRemarkEqualTo(1);//请假次数（备注状态是1）
//		//写到一起表示同时满足条件
//		
//		// long countByExample(OaKfbScoreExample example);
//
//		
//		
	}
	
