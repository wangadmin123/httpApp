package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaKfbGroup;
import cn.tyyhoa.pojo.OaKfbLeave;
import cn.tyyhoa.pojo.OaKfbMetting;
import cn.tyyhoa.pojo.OaKfbProject;
import cn.tyyhoa.pojo.OaKfbStage;
import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OakfbScore;
import cn.tyyhoa.service.OaKfbLeaveService;
import cn.tyyhoa.service.OaKfbMettingService;
import cn.tyyhoa.service.OaKfbProjectservice;
import cn.tyyhoa.service.OaKfbScoreService;
import cn.tyyhoa.service.OaKfbStageService;
import cn.tyyhoa.service.OaKfbUserService;
import cn.tyyhoa.service.OaKfb_GroupMapperService;
import cn.tyyhoa.util.OaJzbRevoke;

@RequestMapping(value = "/develop")
@Controller
public class develop_zzwork {

	@Autowired
	OaKfbMettingService oaKfbMettingService;
	@Autowired
	OaKfbProjectservice OaKfbProjectservice;

	@Autowired
	OaKfbStageService OaKfbStageService;

	@Autowired
	OaKfbLeaveService oaKfbLeaveService;

	@Autowired
	OaKfbScoreService oaKfbScoreService;

	@Autowired
	OaKfbUserService oaKfbUserService;

	
	@Autowired
	OaKfb_GroupMapperService OaKfb_GroupMapperService;

	private Logger logger = Logger.getLogger(develop_zzwork.class);
	
	@RequestMapping(value = "/jl_history_hy.html")
	public String jl_history_hy(HttpServletRequest request) {
		return "/develop_department/jl_history_hy";
	}
	
	@RequestMapping(value = "/jl_history_xmjd.html")
	public String jl_history_xmjd(HttpServletRequest request) {
		List<OaKfbProject> list8 = OaKfbProjectservice.selectBygrouphistory();
		request.setAttribute("jllist", list8);
		return "/develop_department/jl_history_xmjd";
	}
	
	
	@RequestMapping(value = "/jl_history_stu.html")
	public String jl_history_stu() {
		
		return "/develop_department/jl_history_stu";
	}
	//签到
	@RequestMapping("/kfbwelcome")
	public String kfbwelcome(){
		return "human_resource_department/kfbwelcome";
	}
	
	// 组长登陆首页
	@RequestMapping(value = "/zz_index.html")
	public String zz_index(HttpSession session, HttpServletRequest request,
			@RequestParam(required = false) Integer user_id) {
		
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		OaKfbUser user = oaKfbUserService.selectUser(loginUser.getStu_id());	
		request.setAttribute("did", user.getGroupid());	
		request.setAttribute("uid", user.getId());
		session.setAttribute("user", user);
		return "/develop_department/zz_index";
	}
	// 经理登陆首页
	@RequestMapping(value = "/jl_index.html")
	public String jl_index(HttpSession session,
			@RequestParam(required = false) Integer user_id) {
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		OaKfbUser user = oaKfbUserService.selectUser(loginUser.getStu_id());
		session.setAttribute("user", user);
		return "/develop_department/jl_index";
	}
	// 组员登陆首页
	@RequestMapping(value = "/zy_index.html")
	public String zy_index(HttpSession session, HttpServletRequest request,
			@RequestParam(required = false) String uid) {
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		OaKfbUser user = oaKfbUserService.selectUser(loginUser.getStu_id());
		session.setAttribute("user", user);
		request.setAttribute("uid", user.getId());
		return "/develop_department/zy_index";
	}
	// 经理查看请假页面
	@RequestMapping(value = "/jl_qj.html")
	public String jl_qj(HttpServletRequest request,
			@RequestParam(required = false) String stuname,
			@RequestParam(required = false) String groupid) {
		if (groupid == null || groupid.equals("")) {
			groupid = "0";
		}
		if (stuname == null || stuname.equals("")) {
			stuname = null;
		}
		List<OaKfbGroup> gs = OaKfb_GroupMapperService.selectsxGroup();
		request.setAttribute("selectxz", gs);

		OaKfbLeave oaKfbLeave = new OaKfbLeave();
		oaKfbLeave.setStuname(stuname);
		oaKfbLeave.setCid(Integer.parseInt(groupid));
		List<OaKfbLeave> jlKfbLeave = oaKfbLeaveService.JlLeavelist(oaKfbLeave);
		request.setAttribute("jlleacelist", jlKfbLeave);
		return "/develop_department/jl_qj";
	}

	// 根据请假单id查看个人请假详情
		@RequestMapping(value = "/Qxiangqing.html")
		public String xq(HttpServletRequest request,
				@RequestParam(required = false) Integer id) {

			OaKfbLeave oaKfbLeave = new OaKfbLeave();
			oaKfbLeave.setId(id);
			OaKfbLeave leavelist = oaKfbLeaveService.Leavelist(oaKfbLeave);
			request.setAttribute("zzleacelist", leavelist);
			return "/develop_department/Qxiangqing";
		}

		// 组员查看个人请假记录（白瑞卿）
		@RequestMapping(value = "zy_leavelist.html")
		public String zy_leave(HttpServletRequest request, HttpSession session,
				@RequestParam(required = false) Integer type) {
			/*Integer uid = (Integer) session.getAttribute("uid");*/
			OaKfbUser user = (OaKfbUser) session.getAttribute("user");
			OaKfbLeave ol = new OaKfbLeave();
			ol.setType(type);
			ol.setUser_id(user.getId());
			List<OaKfbLeave> zyleavelist = oaKfbLeaveService.ZyselectByType(ol);
			request.setAttribute("zyqingjia", zyleavelist);
			request.setAttribute("uid", user.getId());
			return "/develop_department/zy_leavelist";
		}
		
	// 组长查看请假记录
	@RequestMapping(value = "zz_leavelist.html")
	public String zz_leave(HttpServletRequest request,HttpSession session,
			@RequestParam(required = false) String stuname,@RequestParam(required = false) Integer groupid) {
		OaKfbUser user= (OaKfbUser) session.getAttribute("user");
		 groupid=user.getGroupid();
		List<OaKfbLeave> zzleavelist = oaKfbLeaveService.ZzselectByName(stuname,groupid);
		request.setAttribute("zzqingjia", zzleavelist);
		return "/develop_department/zz_leavelist";
	}

	// 组长添加请假表
	@RequestMapping(value = "/zz_leaveygadd.html")
	public String zz_leaveygadd(HttpServletRequest request,
			@RequestParam(required = false) String uid) {
		
		OaKfbUser Leave = oaKfbLeaveService.selectByUid(Integer.parseInt(uid));
		request.setAttribute("stu", Leave);
		request.setAttribute("uid", uid);
		return "/develop_department/zz_leaveygadd";

	}

	// 组长保存添加请假表
	@RequestMapping(value = "/zz_saveleaveygadd.html")
	public String zz_saveleaveygadd(HttpServletRequest request,
			@RequestParam(required = false) String uid,
			@RequestParam(required = false) String phone,
			@RequestParam(required = false) String startime,
			@RequestParam(required = false) String endtime,
			@RequestParam(required = false) String days,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String reason)
			throws ParseException {

		request.setAttribute("uid", uid);
		OaKfbLeave oaKfbLeave = new OaKfbLeave();
		oaKfbLeave.setUser_id(Integer.parseInt(uid));

		oaKfbLeave.setPhone(phone);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = sdf.parse(startime);
		Date date1 = sdf.parse(endtime);

		oaKfbLeave.setStartime(date);

		oaKfbLeave.setEndtime(date1);
		oaKfbLeave.setDays(Integer.parseInt(days));
		oaKfbLeave.setType(Integer.parseInt(type));
		oaKfbLeave.setReason(reason);
		if (oaKfbLeaveService.addleave(oaKfbLeave)) {
			return "redirect:/develop/zy_leavelist.html?uid=" + uid;
		}

		return "redirect:/develop/zy_leaveygadd.html";

	}

	// 组员添加请假表
		@RequestMapping(value = "/zy_leaveygadd.html")
		public String zy_leaveygadd(HttpServletRequest request,
				@RequestParam(required = false) String uid) {

			OaKfbUser Leave = oaKfbLeaveService.selectByUid(Integer.parseInt(uid));
			request.setAttribute("stu", Leave);
			request.setAttribute("uid", uid);
			return "/develop_department/zy_leaveygadd";

		}

		// 组员保存添加请假表（
		@RequestMapping(value = "/zy_saveleaveygadd.html")
		public String zy_saveleaveygadd(HttpServletRequest request,
				@RequestParam(required = false) String uid,
				@RequestParam(required = false) String phone,
				@RequestParam(required = false) String startime,
				@RequestParam(required = false) String endtime,
				@RequestParam(required = false) String days,
				@RequestParam(required = false) String type,
				@RequestParam(required = false) String reason)
				throws ParseException {

			/* String uid=(String) request.getAttribute("uid"); */
			OaKfbLeave oaKfbLeave = new OaKfbLeave();
			oaKfbLeave.setUser_id(Integer.parseInt(uid));

			oaKfbLeave.setPhone(phone);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			/* if(startime!=null ){ */

			Date date = sdf.parse(startime);
			Date date1 = sdf.parse(endtime);
			/* } */

			oaKfbLeave.setStartime(date);

			oaKfbLeave.setEndtime(date1);
			oaKfbLeave.setDays(Integer.parseInt(days));
			oaKfbLeave.setType(Integer.parseInt(type));
			oaKfbLeave.setReason(reason);
			if (oaKfbLeaveService.addleave(oaKfbLeave)) {
				return "redirect:/develop/zy_leavelist.html?uid=" + uid;
			}

			return "redirect:/develop/zy_leaveygadd.html";

		}

	// 组长添加考勤操作
	@RequestMapping(value = "/zz_kqaddsave.html", method = RequestMethod.POST)
	public String zz_kqaddasve(HttpServletRequest request,
			@RequestParam(required = false) Integer user_id,
			@RequestParam(required = false) Integer score,
			@RequestParam(required = false) Integer groupid,
			@RequestParam(required = false) String remark,
			@RequestParam(required = false) String time) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date times = sdf.parse(time.toString());
		OakfbScore record = new OakfbScore();
		record.setUser_id(user_id);
		record.setScore(score);
		record.setRemark(remark);
		record.setTime(times);
		if (oaKfbScoreService.insert(record)) {
			return "redirect:/develop/ZZKQxiang.html?userid=" + user_id
					+ "&&groupid=" + groupid;
		}
		return "/develop_department/zz_kqadd";
	}

	// 组长添加考勤页面
	@RequestMapping(value = "/zz_kqadd.html")
	public String zz_kqadd(@RequestParam(required = false) Integer userid,
			@RequestParam(required = false) Integer groupid,
			HttpServletRequest request) {
		OaKfbUser oakfbuser = oaKfbUserService.selectUse(userid);
		request.setAttribute("oaKfbScore", oakfbuser);
		request.setAttribute("groupid", groupid);
		request.setAttribute("userid", userid);

		return "/develop_department/zz_kqadd";
	}

	// 组长修改考勤操作
	@RequestMapping(value = "/zz_kqeditsave.html", method = RequestMethod.POST)
	public String zz_kqeditsave(@RequestParam(required = false) Integer id,
			@RequestParam(required = false) Integer userid,
			@RequestParam(required = false) Integer groupid,
			@RequestParam(required = false) Integer score,
			@RequestParam(required = false) String remark,
			HttpServletRequest request) {
		OakfbScore oakfbScore = new OakfbScore();
		oakfbScore.setId(id);
		oakfbScore.setScore(score);
		oakfbScore.setRemark(remark);
		if (oaKfbScoreService.editbyuserid(oakfbScore)) {
			return "redirect:/develop/ZZKQxiang.html?userid=" + userid
					+ "&&groupid=" + groupid;
		}
		return "/develop_department/zz_kqedit";
	}

	// 组长修改考勤页面
	@RequestMapping(value = "/zz_kqedit.html")
	public String zz_kqedit(@RequestParam(required = false) Integer userid,
			@RequestParam(required = false) Integer id,
			@RequestParam(required = false) Integer groupid,
			HttpServletRequest request) {
		OakfbScore oaKfbScore = oaKfbScoreService.selectByid(id);
		request.setAttribute("editscore", oaKfbScore);
		request.setAttribute("id", id);
		request.setAttribute("userid", userid);
		request.setAttribute("groupid", groupid);

		return "/develop_department/zz_kqedit";
	}

	// 经理查看组员考勤详情
	@RequestMapping(value = "/jl_kqxiang.html")
	public String jlKQxiang(HttpServletRequest request,
			@RequestParam(required = false) Integer userid) {

		List<OakfbScore> list05 = oaKfbScoreService.Byuserid(userid);
		request.setAttribute("kqxianglist", list05);
		request.setAttribute("userid", userid);
		return "/develop_department/jl_kqxiang";
	}

	// 组长查看组员考勤详情
	@RequestMapping(value = "/ZZKQxiang.html")
	public String ZZKQxiang(HttpServletRequest request,
			@RequestParam(required = false) Integer userid,

			@RequestParam(required = false) Integer groupid) {
		List<OakfbScore> list05 = oaKfbScoreService.Byuserid(userid);
		request.setAttribute("kqxianglist", list05);
		request.setAttribute("userid", userid);
		request.setAttribute("groupid", groupid);
		return "/develop_department/zz_KQxiang";
	}

	// 经理查看考勤
	@RequestMapping(value = "/jl_kq.html")
	public String jl_kq(HttpServletRequest request,
			@RequestParam(required = false) String stu_name) {
		OaKfbUser oaKfbUse = new OaKfbUser();
		oaKfbUse.setStu_name(stu_name);
		List<OaKfbUser> list06 = oaKfbUserService.selectjlAllkq(oaKfbUse);
		if (list06 != null)
			for (int i = 0; i < list06.size(); i++) {
				OaKfbUser oaKfbUser = new OaKfbUser();
				oaKfbUser = oaKfbUserService.selectallscore(list06.get(i)
						.getId());
				if (oaKfbUser != null)
					list06.get(i).setSumscore(oaKfbUser.getSumscore());
			}
		request.setAttribute("jlkqlist", list06);
		return "/develop_department/jl_kq";
	}

	// 组长查看考勤
	@RequestMapping(value = "/zz_kq.html")
	public String zz_kq(HttpServletRequest request,HttpSession session) {
		OaKfbUser user = (OaKfbUser) session.getAttribute("user");
		List<OaKfbUser> list04 = oaKfbUserService.selectAllkq(user.getGroupid());
		
		
		request.setAttribute("gid", user.getGroupid());
		OaKfbUser oaKfbUser = new OaKfbUser();
		if (list04 != null)
			for (int i = 0; i < list04.size(); i++) {
				oaKfbUser = oaKfbUserService.selectallscore(list04.get(i)
						.getId());
				if (oaKfbUser != null)
					list04.get(i).setSumscore(oaKfbUser.getSumscore());
			}
		request.setAttribute("zzkqlist", list04);
		return "/develop_department/zz_kq";
	}

	// 经理查看学员
	@RequestMapping(value = "/jl_stulist.html")
	public String jl_stu() {

		return "/develop_department/jl_stulist";
	}

	/**
	 * 经理查看会议记录 ,@RequestParam(required = false) String groupid,
	 * @RequestParam(required = false) Date starttime
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/jl_xzhy.html")
	public String jl_xzhy(HttpServletRequest request, HttpSession session,
			@RequestParam(required = false) String groupid) {
		if (groupid == null || groupid.equals("")) {
			groupid = "0";
		}

		List<OaKfbGroup> groupList = OaKfb_GroupMapperService.selectsxGroup();
		session.setAttribute("groupList", groupList);

		List<OaKfbMetting> meList = oaKfbMettingService.selectJlHyByid(Integer
				.parseInt(groupid));

		session.setAttribute("mList", meList);
		return "/develop_department/jl_xzhy";
	}

	// 组长会议记录页面
	@RequestMapping(value = "/zz_hyshowlist.html")
	public String zz_hyshowlist(HttpSession session,
			HttpServletRequest request,
			@RequestParam(required = false) String starttime) {
		OaKfbUser user = (OaKfbUser) session.getAttribute("user");
		Integer uid = user.getId();
		Integer groupid = user.getGroupid();
		request.setAttribute("uid", uid);
		List<OaKfbMetting> mettingList = oaKfbMettingService.selectHy(groupid, starttime);
		request.setAttribute("mettingList", mettingList);

		return "/develop_department/zz_hyshowlist";
	}

	// 组长添加会议记录页面
	@RequestMapping(value = "/zz_addhyshowlist.html")
	public String zz_addhyshowlist(HttpSession session,
			HttpServletRequest request,
			@RequestParam(required = false) String uid) {
		OaKfbUser user = (OaKfbUser) session.getAttribute("user");
		Integer did = user.getGroupid();
		List<OaKfbUser> list3 =oaKfbUserService.getUserByGroup(did);
		request.setAttribute("UserList", list3);
		request.setAttribute("uid", uid);
		session.setAttribute("groupid", 1);
			
	/*	
		OaKfbUser oaKfbUser = oaKfbUserService
				.selectUser(uid);
			session.setAttribute("groupname", oaKfbUser.getGroupname());
		session.setAttribute("leader", oaKfbUser.getStu_name());
		session.setAttribute("groupid", oaKfbUser.getGroupid());*/
		return "/develop_department/zz_addhuiyi";
	}

	// 组长保存添加会议记录
	@RequestMapping(value = "/savehyshowlist.html")
	public String savehyshowlist(HttpSession session,
			HttpServletRequest request,
			@RequestParam(required = false) String uid,
			@RequestParam(required = false) String content,
			@RequestParam(required = false) String witer,
			@RequestParam(required = false) Integer groupid,
			@RequestParam(required = false) String leader,
			@RequestParam(required = false) String starttime,

			@RequestParam(required = false) Integer type,
			@RequestParam(required = false) String usersname)
			throws ParseException {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = format.parse(starttime);

		OaKfbMetting oaKfbMetting = new OaKfbMetting();
		oaKfbMetting.setContent(content);
		oaKfbMetting.setWiter(Integer.parseInt(witer));
		oaKfbMetting.setType(type);
		oaKfbMetting.setUsersname(usersname);
		oaKfbMetting.setStarttime(date);
		oaKfbMetting.setLeader(leader);
		oaKfbMetting.setGroupid(groupid);
		if (oaKfbMettingService.insertSelective(oaKfbMetting)) {
			return "redirect:/develop/zz_hyshowlist.html?uid=" + uid;
		}
		return "redirect:/develop/zz_addhyshowlist.html";

	}

	// 组长编辑会议记录页面
	@RequestMapping(value = "/zz_edithyshowlist.html")
	public String zz_edithyshowlist(HttpSession session,
			HttpServletRequest request,
			@RequestParam(required = false) Integer id,
			@RequestParam(required = false) String uid) {
		request.setAttribute("uid", uid);
		OaKfbMetting oaKfbMetting = oaKfbMettingService.selectHyByIdAndUId(id);
		request.setAttribute("met", oaKfbMetting);

		return "/develop_department/zz_edithuiyi";
	}

	// 组长保存修改后的会议记录
	@RequestMapping(value = "/saveZzhyshowlist.html")
	public String saveZzhyshowlist(HttpServletRequest request,
			@RequestParam(required = false) String content,
			@RequestParam(required = false) Integer id,
			@RequestParam(required = false) String uid) {

		OaKfbMetting oaKfbMetting = new OaKfbMetting();
		oaKfbMetting.setContent(content);
		oaKfbMetting.setId(id);
		if (oaKfbMettingService.updateByGroupid(oaKfbMetting)) {
			return "redirect:/develop/zz_hyshowlist.html?uid=" + uid;
		}
		return "redirect:/develop/zz_edithyshowlist.html";

	}

	// 组长查看小组员工
	@RequestMapping(value = "/zz_yuangong.html")
	public String zz_yuangong(HttpServletRequest request,HttpSession session,
			@RequestParam(required = false) String stu_name) {
		OaKfbUser user = (OaKfbUser) session.getAttribute("user");
		OaKfbUser us=new OaKfbUser();
		us.setStu_name(stu_name);
		us.setGroupid(user.getGroupid());
		List<OaKfbUser> stuList = oaKfbUserService.selectYgByUid(us);
		request.setAttribute("stuList", stuList);
		request.setAttribute("stu_name",stu_name);
		return "/develop_department/zz_yuangong";
	}

	/**
	 * 组员个人信息页面
	 * 
	 * @param session
	 * @param model
	 * @param request
	 * @param pageIndex
	 * @param stuId
	 *            ,Integer.parseInt(pageIndex),Constants.PAGE_SIZE
	 * @RequestParam(required=false) String pageIndex,
	 * 
	 * @return
	 */
	@RequestMapping(value = "/zy_info.html")
	public String zy_info(HttpSession session, HttpServletRequest request) {
		OaKfbUser kfbuser=(OaKfbUser) session.getAttribute("user");
		Integer uid = kfbuser.getId();
		OaKfbUser user= oaKfbUserService.selectByUid(uid);
		
		

			List<OaKfbProject> ps = OaKfbProjectservice.selectByStu_Id(uid);


			if (ps != null || ps.size() != 0) {

				request.setAttribute("projectList", ps);
				/*for (OaKfbProject oaKfbProject : ps) {
					session.setAttribute("groupName",
							oaKfbProject.getGroupname());
					session.setAttribute("jobName", oaKfbProject.getJobname());
					session.setAttribute("userName", oaKfbProject.getUsername());

				}*/

			}
			/* 请假次数 */
			int leaveCount = oaKfbLeaveService.selectCountByUid(uid);

			if (leaveCount == 0) {
				request.setAttribute("LeaveCount", 0);
			}
			request.setAttribute("LeaveCount", leaveCount);
			/* 请假时间 */
			List<OaKfbLeave> leaveTimeList = oaKfbLeaveService
					.selectTimeByUid(uid);
			request.setAttribute("LeaveTimeList", leaveTimeList);

			/* 未签到次数 */
			OakfbScore oakfbScore = new OakfbScore();
			oakfbScore.setUser_id(uid);

			int scoreCount = oaKfbScoreService
					.selectScoreCountByUid(oakfbScore);
			if (scoreCount == 0) {
				request.setAttribute("scoreCount", 0);
			}

			request.setAttribute("scoreCount", scoreCount);
			/* 未签到日期 */
			List<OakfbScore> scoreTimeList = oaKfbScoreService
					.selectScoreTimeByUid(oakfbScore);
			request.setAttribute("scoreTimeList", scoreTimeList);
			/* 近期总分 */
			Integer fsCount = oaKfbScoreService.selectScoreFsCount(oakfbScore);

			if (fsCount == null) {
				request.setAttribute("fsCount", 0);
			}

			request.setAttribute("fsCount", fsCount);
			/* 迟到次数 */
			int cdCount = oaKfbScoreService.selectCdCountByUid(oakfbScore);

			if (cdCount == 0) {
				request.setAttribute("cdCount", 0);
			}

			request.setAttribute("cdCount", cdCount);

			/* 迟到日期 */
			List<OakfbScore> cdTimeList = oaKfbScoreService
					.selectCdTimeByUid(oakfbScore);
			request.setAttribute("cdTimeList", cdTimeList);

			/* 早退次数 */
			int ztCount = oaKfbScoreService.selectZtCountByUid(oakfbScore);

			if (ztCount == 0) {
				request.setAttribute("ztCount", 0);
			}

			request.setAttribute("ztCount", ztCount);

			/* 早退日期 */
			List<OakfbScore> ztTimeList = oaKfbScoreService
					.selectZtTimeByUid(oakfbScore);
			request.setAttribute("ztTimeList", ztTimeList);
		

		return "/develop_department/zy_info";

	}

	// 组员根据任务id提交任务，显示任务信息
	@RequestMapping(value = "/projectsave.html")
	public String projectsave(HttpServletRequest request,
			@RequestParam(required = false) Integer id,
			@RequestParam(required = false) String uid) {
		request.setAttribute("uid", uid);
		OaKfbProject op = null;

		op = OaKfbProjectservice.selectByPId(id);

		request.setAttribute("project", op);
		return "/develop_department/zy_wancheng";
	}

	// 组员提交任务
	@RequestMapping(value = "/zy_updaterenwu.html")
	public String zy_updaterenwu(@RequestParam(required = false) Integer id,
			@RequestParam(required = false) String uid,
			@RequestParam(required = false) String isfinish,
			@RequestParam(required = false) String remark) {
		OaKfbProject obj = new OaKfbProject();
		obj.setId(id);
		obj.setIsfinish(Integer.parseInt(isfinish));
		obj.setRemark(remark);
		if (OaKfbProjectservice.tjrenwu(obj)) {
			return "redirect:/develop/zy_info.html?uid=" + uid;
		}
		return "/develop_department/zy_wancheng";
	}

	// 经理小组管理页面
	@RequestMapping(value = "/	/jl_xzgl.html")
	public String jl_guanli() {
		return "/develop_department/jl_xzgl";
	}

	// 经理通过进度id查看
	@ResponseBody
	@RequestMapping(value = "/showlistbysid")
	public Object jl_xiangqingbyid(
			@RequestParam(required = false) Integer groupid,
			@RequestParam(required = false) Integer eid) {
		List<OaKfbProject> list9 = OaKfbProjectservice.selectBystageid(groupid,
				eid);
		if (list9.size() != 0) {
			return JSONArray.toJSONStringWithDateFormat(list9, "yyyy-MM-dd");
		}
		return JSONArray.toJSONString(null);

	}

	// 经理查看项目详情
	@ResponseBody
	@RequestMapping(value = "/showprolist")
	public Object jl_xiangqing() {

		List<OaKfbStage> list8 = OaKfbStageService.selectByExample();
		return JSONArray.toJSONString(list8);
	}

	// 组长删除进度
	@RequestMapping(value = "/zz_deljindu.html")
	public String zz_deljindu(@RequestParam(required = false) Integer did,
			@RequestParam(required = false) Integer id) {
		if(OaKfbProjectservice.delbyid(id)){
			return "redirect:/develop/zz_guanlijindu.html?did=" + did;
			
		}
		return "/develop_department/zz_guanlijindu.html?did=" + did;
		
	}

	// 组长项目进度页面
		@RequestMapping(value = "/zz_guanlijindu.html")
		public String zz_renwu(HttpServletRequest request, HttpSession session,
				@RequestParam(required = false) String content,
				@RequestParam(required = false) Integer isfinish,
				@RequestParam(required = false) String username) {
			OaKfbUser user = (OaKfbUser) session.getAttribute("user");
			request.setAttribute("content", content);
			request.setAttribute("isfinish", isfinish);
			request.setAttribute("username", username);

			Integer did = user.getGroupid();
			OaKfbProject objpro = new OaKfbProject();
			objpro.setContent(content);
			objpro.setUsername(username);
			objpro.setGroupid(did);
			objpro.setIsfinish(isfinish);
			List<OaKfbProject> list3 = OaKfbProjectservice.selectByExample(objpro);
			OaJzbRevoke objjzb=new OaJzbRevoke();
			for (int i = 0; i < list3.size(); i++) {
				list3.get(i).setOverstruts(objjzb.Revoke(list3.get(i).getCreatetime()));
			}
			OaKfbStage list6 = OaKfbStageService.selectBygroup(did);
			if (list6 != null)
				request.setAttribute("stageList", list6);
			request.setAttribute("did", did);
			// int total = OaKfbProjectservice.selectcount();
			request.setAttribute("guanli", list3);

			return "/develop_department/zz_guanlijindu";
		}

	// 经理项目进度页面
	@RequestMapping(value = "/jl_xmjd.html")
	public String jl_renwu(HttpServletRequest request) {
		List<OaKfbProject> list7 = OaKfbProjectservice.selectBygroup();
		request.setAttribute("jllist", list7);
		return "/develop_department/jl_xmjd";
	}

	// 经理项目进度详情页面
	@RequestMapping(value = "/jl_Krate.html")
	public String jl_xiangmu(HttpServletRequest request,
			@RequestParam(required = false) Integer groupid) {
		OaKfbGroup oaKfbGroup = OaKfb_GroupMapperService
				.selectnameByid(groupid);
		OaKfbStage list6 = OaKfbStageService.selectBygroup(groupid);
		request.setAttribute("jieduanlist", list6);
		request.setAttribute("group", oaKfbGroup);
		request.setAttribute("grouid", groupid);
		return "/develop_department/jl_Krate";
	}

	// 组长发布任务页面
	@RequestMapping(value = "/zz_jindu.html")
	public String zz_fabu(HttpServletRequest request,
			@RequestParam(required = false) Integer did) {
		List<OaKfbStage> list1 = OaKfbStageService.selectByExample();
		List<OaKfbGroup> list2 = OaKfb_GroupMapperService.selectByAll();
		List<OaKfbUser> list3 =oaKfbUserService.getUserByGroup(did);
		request.setAttribute("UserList", list3);
		request.setAttribute("stageList", list1);
		request.setAttribute("groupList", list2);
		request.setAttribute("did", did);
		return "/develop_department/zz_jindu";
	}



	// 发布任务
	@RequestMapping(value = "/faburenwu.html")
	public String zz_faburenwu(@RequestParam(required = false) String content,
			@RequestParam(required = false) String stageid,
			@RequestParam(required = false) String startime,
			@RequestParam(required = false) String endtime,
			@RequestParam(required = false) Integer user_id,
			@RequestParam(required = false) Integer isfinish,
			@RequestParam(required = false) String remark,
			@RequestParam(required = false) Integer did) throws ParseException {
		OaKfbProject Project = new OaKfbProject();
		Project.setContent(content);
		isfinish=0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse(startime);
		Date date2 = sdf.parse(endtime);
		Project.setEndtime(date2);
		Project.setStartime(date1);
		Project.setRemark(remark);
		Project.setIsfinish(isfinish);
		Project.setStageid(Integer.parseInt(stageid));
		Project.setUser_id(user_id);
		Project.setCreatetime(new Date(System.currentTimeMillis()));
		if (OaKfbProjectservice.addrenwu(Project)) {
			return "redirect:/develop/zz_guanlijindu.html?did=" + did;
		}
		return "redirect:/develop/zz_jindu.html";

	}


	// 组长审核进度页面
	@RequestMapping(value = "/zz_editjindu.html")
	public String zz_editjindu(@RequestParam(required = false) Integer id,
			@RequestParam(required = false) Integer did,
			HttpServletRequest request) {
		OaKfbProject list4 = OaKfbProjectservice.selecteditrenwu(id);
		request.setAttribute("list4", list4);
		request.setAttribute("did", did);
		request.setAttribute("id", id);

		return "/develop_department/zz_editjindu";
	}

	// 组长审核操作
	@RequestMapping(value = "/zz_updatejindu.html")
	public String zz_updatejindu(@RequestParam(required = false) Integer id,
			@RequestParam(required = false) String isfinish,
			@RequestParam(required = false) String remark,
			@RequestParam(required = false) Integer did) {
		OaKfbProject obj = new OaKfbProject();
		obj.setId(id);
		obj.setIsfinish(Integer.parseInt(isfinish));
		obj.setRemark(remark);
		obj.setFinallytime(new Date());
		if (OaKfbProjectservice.editrenwu(obj)) {
			return "redirect:/develop/zz_guanlijindu.html?did=" + did;
		}
		return "/develop_department/zz_editjindu";
	}

}
