package cn.tyyhoa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.OaRlzybNotice;
import cn.tyyhoa.pojo.OaRlzybNotifiedParty;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaRlzybEmployeeService;

@Controller
@RequestMapping("/Employee")
public class OaRlzybNoticeController {
	@Autowired
	private OaRlzybEmployeeService oaRlzybEmployeeService;
	
	
	/**
	 * 发送通知
	 * 
	 * @param session
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value = "/notice_add.html")
	public String getUserList(HttpSession session
	) {
		OaRlzybUser oaRlzybUser =(OaRlzybUser)session.getAttribute("loginUser");
		List<OaRlzybUser> uList = oaRlzybEmployeeService.selectUserByUid(oaRlzybUser.getEmp_id());
		OaRlzybUser user = oaRlzybEmployeeService.selectUserNameByUid(oaRlzybUser.getEmp_id());
		String name = user.getName();
		String position_name = user.getPosition_name();
		session.setAttribute("name", name);
		session.setAttribute("position_name", position_name);
		System.out.println("-----------------");

		session.setAttribute("userList", uList);

		session.setAttribute("user_id", oaRlzybUser.getEmp_id());

		return "/human_resource_department/notice_add";
	}

	/**
	 * 发送通知
	 * 
	 * @param session
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value = "/addNotice_add.html")
	public String addNotice(HttpSession session, HttpServletRequest request,
			@RequestParam(required = false) String user_id,
			@RequestParam(required = false) String title,
			@RequestParam(required = false) String content) {
		
		session.setAttribute("user_id", user_id);
		OaRlzybNotice oaRlzybNotice = new OaRlzybNotice();
		oaRlzybNotice.setSendid(Integer.parseInt(user_id));
		oaRlzybNotice.setTitle(title);
		oaRlzybNotice.setContent(content);
		if (oaRlzybEmployeeService.addNotice(oaRlzybNotice)) {
			/*System.out.println(oaRlzybNotice.getId());*/
			OaRlzybNotifiedParty oaRlzybNotifiedParty = null;
			String[] str = request.getParameterValues("checkbox");
			for (int i = 0; i < str.length; i++) {
				oaRlzybNotifiedParty = new OaRlzybNotifiedParty();
				oaRlzybNotifiedParty.setNotice_uid(Integer.parseInt(str[i]));
				oaRlzybNotifiedParty.setNid(oaRlzybNotice.getId());
				oaRlzybNotifiedParty.setStatus(1);
				if (oaRlzybEmployeeService.addNotified_party(oaRlzybNotifiedParty)) {
					
				}
			}
			return "/human_resource_department/welcome";
			
		} 
			return "/human_resource_department/notice_add";
	}
	/**
	 * 查询未读通知
	 * @param session
	 * @param request
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value = "/wdNotice_add.html")
	public String wdNotice(HttpSession session, HttpServletRequest request
			) {
		OaRlzybUser oaRlzybUser =(OaRlzybUser)session.getAttribute("loginUser");
		List<OaRlzybNotice> noticeList=oaRlzybEmployeeService.selectWdNoticeByUid(oaRlzybUser.getEmp_id());
		System.out.println(noticeList.size());
		session.setAttribute("noticeList", noticeList);
	return "/human_resource_department/notice_list";
	}
	/**
	 * 查询已读通知
	 * @param session
	 * @param request
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value = "/ydNotice_add.html")
	public String ydNotice(HttpSession session, HttpServletRequest request,
			@RequestParam(required = false) String user_id
			) {
		OaRlzybUser oaRlzybUser =(OaRlzybUser)session.getAttribute("loginUser");
		List<OaRlzybNotice> noticeList=oaRlzybEmployeeService.selectYdNoticeByUid(oaRlzybUser.getEmp_id());
		request.setAttribute("noticeList", noticeList);
		
	return "/human_resource_department/notice_list";
		

	}
	/**
	 * 查询通知详情
	 * @param session
	 * @param request
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value = "/xqNotice.html")
	public String xqNotice(HttpSession session, HttpServletRequest request,
			@RequestParam(required = false) String user_id,
			@RequestParam(required = false) String id,
			@RequestParam(required = false) String npid,
			@RequestParam(required = false) String wd
			) {
		OaRlzybUser oaRlzybUser =(OaRlzybUser)session.getAttribute("loginUser");
		OaRlzybNotice notices=oaRlzybEmployeeService.selectXqNotice(Integer.parseInt(id),oaRlzybUser.getEmp_id());
		request.setAttribute("ee", notices);
		request.setAttribute("wd", notices.getStatus());
		session.setAttribute("npid", notices.getNpid());
		System.out.println("notices.getNpid():"+notices.getNpid());
	return "/human_resource_department/notice_xqlist";
		

	}

	
	/**
	 * 修改通知状态
	 * @param session
	 * @param request
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value = "/uqNotice.html")
	public String uqNotice(HttpSession session, HttpServletRequest request,
			@RequestParam(required = false) String user_id,
			@RequestParam(required = false) String npid
			
			) {
		
		session.setAttribute("user_id", user_id);
		Integer pid=(Integer) session.getAttribute("npid");
		System.out.println("npid:"+npid);
		int row=oaRlzybEmployeeService.updateNoticeById(pid);
		if(row==1){
			return "redirect:/Employee/wdNotice_add.html?user_id="+user_id;
		}
	return "redirect:/Employee/ydNotice_add.html?user_id="+user_id;
		

	}
	
	/**
	 * 查询未读通知数量
	 * @param session
	 * @param request
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value = "/wdNoticeCount.html",method = RequestMethod.POST)
	@ResponseBody
	public String wdNoticeCount(HttpSession session, HttpServletRequest request
			) {
		OaRlzybUser oaRlzybUser =(OaRlzybUser)session.getAttribute("loginUser");
		int count=oaRlzybEmployeeService.selectWdCountByUid(oaRlzybUser.getEmp_id());
		return count+"";

	}
	
}
