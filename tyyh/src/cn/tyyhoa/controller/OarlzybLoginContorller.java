// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   LoginContorller.java

package cn.tyyhoa.controller;

import cn.tyyhoa.pojo.*;
import cn.tyyhoa.service.OaKfbUserService;
import cn.tyyhoa.service.OaRlzybAccountLoginService;
import cn.tyyhoa.service.impl.*;
import cn.tyyhoa.util.GetDate;
import cn.tyyhoa.util.GetIP;
import cn.tyyhoa.util.MD5;

import java.io.PrintStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nl.bitwalker.useragentutils.Browser;
import nl.bitwalker.useragentutils.Version;
import nl.bitwalker.useragentutils.UserAgent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@SuppressWarnings("unused")
@Controller
@RequestMapping("/login")
public class OarlzybLoginContorller
{
	@Autowired
	private OaRlzybUserServiceImpl oaRlzybUserServiceImpl;
	@Autowired
	private OaRlzybEmployeeServiceImpl oaRlzybEmployeeServiceImpl;
	@Autowired
	private OaRlzybPositionServiceImpl oaRlzybPositionServiceImpl;
	@Autowired
	private OaRlzybSubfieldServiceImpl oaRlzybSubfieldServiceImpl;
	@Autowired
	private OaRlzybFunctionServiceImpl oaRlzybFunctionServiceImpl;
	@Autowired
	private OaKfbUserService oaKfbUserService;
	@Autowired
	private OaRlzybAccountLoginService oaRlzybAccountLoginService;
	
	@RequestMapping("/testing")
	public String testing(OaRlzybUser oauser, HttpServletRequest request){
		oaRlzybUserServiceImpl.delStudentDuoyu();
		Browser browser = UserAgent.parseUserAgentString(request.getHeader("User-Agent")).getBrowser();
		System.out.println(browser.getName());
		if(!browser.getName().equals("Chrome")){
			return "human_resource_department/prohibit";
		}
		
		//获取浏览器版本号
		Version version = browser.getVersion(request.getHeader("User-Agent"));
		System.out.println("浏览器版本："+version.getVersion());
		
		return "human_resource_department/login";
	}

	/**
	 * 用户登陆
	 * @param user
	 * @param request
	 * @param session
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping("/userLogin")
	public String login(OaRlzybUser oauser, HttpServletRequest request, HttpSession session)
	{	
		
		//实现自定义MD5加密
		MD5 md5 = new MD5();
		//删除F5刷新再次运行时的session对象
		if (session.getAttribute("nameerror") != null) {
			session.removeAttribute("nameerror");
		}
		if (session.getAttribute("pwderror") != null) {
			session.removeAttribute("pwderror");
		}
		if (session.getAttribute("randserror") != null) {
			session.removeAttribute("randserror");
		}
		/*if (session.getAttribute("lastLoginInfo") !=null) {
			session.removeAttribute("lastLoginInfo");
		}*/
		if (session.getAttribute("Userpwd") !=null) {
			session.removeAttribute("Userpwd");
		}
		//获取验证码值
		String rands = (String) session.getAttribute("rands");
		if(oauser.getRands()==null){
			return "human_resource_department/login";
		}
		if(oauser==null){
			return "human_resource_department/login";
		}
		if(oauser.getUser_name()==null){
			return "human_resource_department/login";
		}
		if(oauser.getUser_pwd()==null){
			return "human_resource_department/login";
		}
		//判断验证码输入是否正确
		if (rands.equals(oauser.getRands())) {
			OaRlzybUser loginUser = oaRlzybUserServiceImpl.login(oauser);
			
			//判断是否用户是否存在，如果存在则判断密码是否正确
			if(loginUser == null){
				//System.out.println("找不到");
				session.setAttribute("nameerror", "用户名不存在");
				return "human_resource_department/login";
			}else if(md5.MD5Encode(oauser.getUser_pwd()).equals(loginUser.getUser_pwd())){
	
				Browser browser = UserAgent.parseUserAgentString(request.getHeader("User-Agent")).getBrowser();
				System.out.println(browser.getName());
				if(!browser.getName().equals("Chrome")){
					return "human_resource_department/prohibit";
				}
				
				//获取浏览器版本号
				Version version = browser.getVersion(request.getHeader("User-Agent"));
				System.out.println("浏览器版本："+version.getVersion());
				
				
				
				//判断用户类型1.员工2.开发部学生并获得角色姓名
				OaRlzybUser userName = new OaRlzybUser();
				if(loginUser.getLogin_type()!=null){
						if (loginUser.getLogin_type() == 1) {
							userName = oaRlzybUserServiceImpl.getEmpName(loginUser);
						}else{
							userName = oaRlzybUserServiceImpl.getStuName(loginUser);
						}
						//补充用户信息
						loginUser.setName(userName.getName());
						//查询用户职位信息
						OaRlzybPosition oaRlzybPosition = oaRlzybPositionServiceImpl.selectByUserId(loginUser.getUser_id());
						//查询出用户职位下的功能组
						List<OaRlzybSubfield> subfields = oaRlzybSubfieldServiceImpl.selectByPositionId(oaRlzybPosition.getPosition_id());
						oaRlzybPosition.setSubfields(subfields);
						loginUser.setPosition(oaRlzybPosition);
						int i = 0;
						for (Iterator<OaRlzybSubfield> iterator = subfields.iterator(); iterator.hasNext();)
						{
							OaRlzybSubfield oaRlzybSubfield = iterator.next();
							//查询出功能组下的功能，并放入功能组集合中
							List<OaRlzybFunction> oaRlzybFunctions = oaRlzybFunctionServiceImpl.selectBySubfieldId(oaRlzybSubfield.getSubfield_id());
							oaRlzybSubfield.setFunctions(oaRlzybFunctions);
							OaRlzybFunction oaRlzybFunction;
							for (Iterator<OaRlzybFunction> iterator2 = oaRlzybFunctions.iterator(); iterator2.hasNext(); System.out.println(oaRlzybFunction.getFunction_name()))
								oaRlzybFunction = iterator2.next();
							subfields.set(i, oaRlzybSubfield);
							i++;
						}
						//查询用户特殊功能组
						List<OaRlzybFunction> userFunctions = oaRlzybFunctionServiceImpl.selectByUserId(loginUser.getUser_id());
						session.setAttribute("subfieldsindex", subfields);
						session.setAttribute("userFunctionsindex", userFunctions);
				}
			//	System.out.println("用户名称"+loginUser.getEmp_name());
				if(session.getAttribute("lastLoginInfo")==null){
					Integer logincont = loginUser.getLogincont();
					//获取用户登陆次数并加一
					loginUser.setLogincont(logincont+1);
					oaRlzybUserServiceImpl.recordlogincont(loginUser);
				}
			
				/**
				 * 判断如果是开发部组长和组员的话查询是否分配小组
				 */
				if (loginUser.getPosition().getPosition_id() == 32 || loginUser.getPosition().getPosition_id() == 33) {
					OaKfbUser user = oaKfbUserService.selectUser(loginUser.getStu_id());
					if (user.getGroupid() == null) {
						session.setAttribute("error", "暂未开通");
						return "error";
					}
					session.setAttribute("user", user);
					Integer uid = user.getId();
					System.out.println("开发部userid："+uid);
					session.setAttribute("uid", uid);
					request.setAttribute("uid", uid);
					request.setAttribute("did", user.getGroupid());
					request.setAttribute("user_id", user.getGroupid());
				}
				//前台数据存入session
				
				session.setAttribute("loginUser", loginUser);
				
				if (oauser.getUser_pwd().equals("888888")) {
					return "admin/userpwd_reset";
				}else{
					if(session.getAttribute("lastLoginInfo")==null){
							
							//记录登陆信息
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
						
							OaRlzybAccountLogin oaRlzybAccountLogin = new OaRlzybAccountLogin();
							System.out.println("login_id:"+loginUser.getUser_id());
							oaRlzybAccountLogin.setAccount_login_id(loginUser.getUser_id());
							System.out.println("login_name:"+loginUser.getName());
							oaRlzybAccountLogin.setAccount_login_name(loginUser.getName());
							
							InetAddress address;
							try {
								address = InetAddress.getLocalHost();
								System.out.println(address.getHostAddress());
								//存入当前ip地址
								oaRlzybAccountLogin.setAccount_login_ipaddress(address.getHostAddress());
							} catch (UnknownHostException e) {
								e.printStackTrace();
							}
							//记录信息前查询上次登陆信息
							List<OaRlzybAccountLogin> lastLoginInfos = oaRlzybAccountLoginService.lastLoginInfo(oaRlzybAccountLogin);
							
							if (lastLoginInfos.size() != 0) {
								for (OaRlzybAccountLogin oaRlzybAccountLogin2 : lastLoginInfos) {
									if(oaRlzybAccountLogin2.getAccount_login_time()!=null){
										
										oaRlzybAccountLogin2.setAccount_login_times(sdf.format(oaRlzybAccountLogin2.getAccount_login_time()));
										
									}else{
										oaRlzybAccountLogin2.setAccount_login_times("首次登录");
									}
								}
								//存放上次登陆信息
								session.setAttribute("lastLoginInfo", lastLoginInfos.get(0));
							}else{
								System.out.println("lastLoginInfos为空");
							}
							oaRlzybAccountLoginService.insert(oaRlzybAccountLogin);
					}
					if(session.getAttribute("OrLogin")==null){
						session.setAttribute("OrLogin", "Login");
					}else if(session.getAttribute("OrLogin").equals("Login")){
						session.setAttribute("OrLogin", "aleradyLogin");
					}
					
					if(loginUser.getPosition().getPosition_id()==7 || loginUser.getPosition().getPosition_id()==9|| loginUser.getPosition().getPosition_id()==10  || loginUser.getPosition().getPosition_id()==39){
						System.out.println("市场部渠道登录----");
						return "marketDepartment/market";
					}else if(loginUser.getPosition().getPosition_id()==16 || loginUser.getPosition().getPosition_id()==17 || loginUser.getPosition().getPosition_id()==18|| loginUser.getPosition().getPosition_id()==40){
						System.out.println("网络部登录---");
						return "marketDepartment/network";
					}else if(loginUser.getPosition().getPosition_id()==11){
						System.out.println("咨询主管登录");
						return "marketDepartment/consultDirector";
					}else if(loginUser.getPosition().getPosition_id()==13){
						System.out.println("咨询助理登录");
						return "marketDepartment/consultAssistant";
					}else if(loginUser.getPosition().getPosition_id()==12){
						System.out.println("咨询师登录");
						return "marketDepartment/consultTeacher";
					}else if(loginUser.getPosition().getPosition_id()==24){
						System.out.println("教务登录");
						return "/academic_affairs_department/jwb_educational";
					}else if(loginUser.getPosition().getPosition_id()==21||loginUser.getPosition().getPosition_id()==20){
						System.out.println("学术部登录");
						return "/academic_department/xsb_index";
					}else if(loginUser.getPosition().getPosition_id()==1){
						return "headmaster_department/headmaster";
					}else if(loginUser.getPosition().getPosition_id()==6){
							System.out.println("市场经理登录");
							return "marketDepartment/marketManager";
					}else if(loginUser.getPosition().getPosition_id()==2||loginUser.getPosition().getPosition_id()==3){
						System.out.println("人力资源部登录");
						return "human_resource_department/human_resource_department_employee_index1";
				   }
					
					return "human_resource_department/human_resource_department_employee_index";
				}
			}else{
				session.setAttribute("pwderror", "密码不正确");
				session.setAttribute("username", oauser.getUser_name());
				return "human_resource_department/login";
			}
		}else{
			session.setAttribute("randserror", "验证码不正确");
			session.setAttribute("username", oauser.getUser_name());
			session.setAttribute("Userpwd", oauser.getUser_pwd());
			return "human_resource_department/login";
		}
	}
	/**
	 * 校长切换账号
	 * @param user
	 * @param request
	 * @param session
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping("/xz")
	public String xz(HttpServletRequest request, HttpSession session,String name,String pwd)
	{	
		OaRlzybUser oauser = new OaRlzybUser();
		oauser.setUser_name(name);
		oauser.setUser_pwd(pwd);
		//删除F5刷新再次运行时的session对象
		if (session.getAttribute("nameerror") != null) {
			session.removeAttribute("nameerror");
		}
		if (session.getAttribute("pwderror") != null) {
			session.removeAttribute("pwderror");
		}
		if (session.getAttribute("randserror") != null) {
			session.removeAttribute("randserror");
		}
		/*if (session.getAttribute("lastLoginInfo") !=null) {
			session.removeAttribute("lastLoginInfo");
		}*/
		if (session.getAttribute("Userpwd") !=null) {
			session.removeAttribute("Userpwd");
		}
		if(oauser==null){
			return "human_resource_department/login";
		}
		if(oauser.getUser_name()==null){
			return "human_resource_department/login";
		}
		if(oauser.getUser_pwd()==null){
			return "human_resource_department/login";
		}
	
			OaRlzybUser loginUser = oaRlzybUserServiceImpl.login(oauser);
			
			//判断是否用户是否存在，如果存在则判断密码是否正确
			if(loginUser == null){
				//System.out.println("找不到");
				session.setAttribute("nameerror", "用户名不存在");
				return "human_resource_department/login";
			}else if(oauser.getUser_pwd().equals(loginUser.getUser_pwd())){
	
				session.setAttribute("xz", "1");
				
				//判断用户类型1.员工2.开发部学生并获得角色姓名
				OaRlzybUser userName = new OaRlzybUser();
				if(loginUser.getLogin_type()!=null){
						if (loginUser.getLogin_type() == 1) {
							userName = oaRlzybUserServiceImpl.getEmpName(loginUser);
						}else{
							userName = oaRlzybUserServiceImpl.getStuName(loginUser);
						}
						//补充用户信息
						loginUser.setName(userName.getName());
						//查询用户职位信息
						OaRlzybPosition oaRlzybPosition = oaRlzybPositionServiceImpl.selectByUserId(loginUser.getUser_id());
						//查询出用户职位下的功能组
						List<OaRlzybSubfield> subfields = oaRlzybSubfieldServiceImpl.selectByPositionId(oaRlzybPosition.getPosition_id());
						
						oaRlzybPosition.setSubfields(subfields);
						loginUser.setPosition(oaRlzybPosition);
						int i = 0;
						for (Iterator<OaRlzybSubfield> iterator = subfields.iterator(); iterator.hasNext();)
						{
							OaRlzybSubfield oaRlzybSubfield = iterator.next();
							//查询出功能组下的功能，并放入功能组集合中
							List<OaRlzybFunction> oaRlzybFunctions = oaRlzybFunctionServiceImpl.selectBySubfieldId(oaRlzybSubfield.getSubfield_id());
							oaRlzybSubfield.setFunctions(oaRlzybFunctions);
							OaRlzybFunction oaRlzybFunction;
							for (Iterator<OaRlzybFunction> iterator2 = oaRlzybFunctions.iterator(); iterator2.hasNext(); System.out.println(oaRlzybFunction.getFunction_name()))
								oaRlzybFunction = iterator2.next();
							subfields.set(i, oaRlzybSubfield);
							i++;
						}
						//查询用户特殊功能组
						List<OaRlzybFunction> userFunctions = oaRlzybFunctionServiceImpl.selectByUserId(loginUser.getUser_id());
						session.setAttribute("subfieldsindex", subfields);
						session.setAttribute("userFunctionsindex", userFunctions);
				}
			//	System.out.println("用户名称"+loginUser.getEmp_name());
				if(session.getAttribute("lastLoginInfo")==null){
					Integer logincont = loginUser.getLogincont();
					//获取用户登陆次数并加一
					loginUser.setLogincont(logincont+1);
					oaRlzybUserServiceImpl.recordlogincont(loginUser);
				}
			
				/**
				 * 判断如果是开发部组长和组员的话查询是否分配小组
				 */
				if (loginUser.getPosition().getPosition_id() == 32 || loginUser.getPosition().getPosition_id() == 33) {
					OaKfbUser user = oaKfbUserService.selectUser(loginUser.getStu_id());
					if (user.getGroupid() == null) {
						session.setAttribute("error", "暂未开通");
						return "error";
					}
					session.setAttribute("user", user);
					Integer uid = user.getId();
					System.out.println("开发部userid："+uid);
					session.setAttribute("uid", uid);
					request.setAttribute("uid", uid);
					request.setAttribute("did", user.getGroupid());
					request.setAttribute("user_id", user.getGroupid());
				}
				//前台数据存入session
				
				session.setAttribute("loginUser", loginUser);
				
				if (oauser.getUser_pwd().equals("888888")) {
					return "admin/userpwd_reset";
				}else{
					if(session.getAttribute("lastLoginInfo")==null){
							
							//记录登陆信息
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
						
							OaRlzybAccountLogin oaRlzybAccountLogin = new OaRlzybAccountLogin();
							System.out.println("login_id:"+loginUser.getUser_id());
							oaRlzybAccountLogin.setAccount_login_id(loginUser.getUser_id());
							System.out.println("login_name:"+loginUser.getName());
							oaRlzybAccountLogin.setAccount_login_name(loginUser.getName());
							
							InetAddress address;
							try {
								address = InetAddress.getLocalHost();
								System.out.println(address.getHostAddress());
								//存入当前ip地址
								oaRlzybAccountLogin.setAccount_login_ipaddress(address.getHostAddress());
							} catch (UnknownHostException e) {
								e.printStackTrace();
							}
							//记录信息前查询上次登陆信息
							List<OaRlzybAccountLogin> lastLoginInfos = oaRlzybAccountLoginService.lastLoginInfo(oaRlzybAccountLogin);
							
							if (lastLoginInfos.size() != 0) {
								for (OaRlzybAccountLogin oaRlzybAccountLogin2 : lastLoginInfos) {
									if(oaRlzybAccountLogin2.getAccount_login_time()!=null){
										
										oaRlzybAccountLogin2.setAccount_login_times(sdf.format(oaRlzybAccountLogin2.getAccount_login_time()));
										
									}else{
										oaRlzybAccountLogin2.setAccount_login_times("首次登录");
									}
								}
								//存放上次登陆信息
								session.setAttribute("lastLoginInfo", lastLoginInfos.get(0));
							}else{
								System.out.println("lastLoginInfos为空");
							}
							oaRlzybAccountLoginService.insert(oaRlzybAccountLogin);
					}
					if(session.getAttribute("OrLogin")==null){
						session.setAttribute("OrLogin", "Login");
					}else if(session.getAttribute("OrLogin").equals("Login")){
						session.setAttribute("OrLogin", "aleradyLogin");
					}
					
					if(loginUser.getPosition().getPosition_id()==7 || loginUser.getPosition().getPosition_id()==9|| loginUser.getPosition().getPosition_id()==10  || loginUser.getPosition().getPosition_id()==39){
						System.out.println("市场部渠道登录----");
						return "marketDepartment/market";
					}else if(loginUser.getPosition().getPosition_id()==16 || loginUser.getPosition().getPosition_id()==17 || loginUser.getPosition().getPosition_id()==18|| loginUser.getPosition().getPosition_id()==40){
						System.out.println("网络部登录---");
						return "marketDepartment/network";
					}else if(loginUser.getPosition().getPosition_id()==11){
						System.out.println("咨询主管登录");
						return "marketDepartment/consultDirector";
					}else if(loginUser.getPosition().getPosition_id()==13){
						System.out.println("咨询助理登录");
						return "marketDepartment/consultAssistant";
					}else if(loginUser.getPosition().getPosition_id()==12){
						System.out.println("咨询师登录");
						return "marketDepartment/consultTeacher";
					}else if(loginUser.getPosition().getPosition_id()==24){
						System.out.println("教务登录");
						return "/academic_affairs_department/jwb_educational";
					}else if(loginUser.getPosition().getPosition_id()==21||loginUser.getPosition().getPosition_id()==20){
						System.out.println("学术部登录");
						return "/academic_department/xsb_index";
					}else if(loginUser.getPosition().getPosition_id()==1){
						return "headmaster_department/headmaster";
					}else if(loginUser.getPosition().getPosition_id()==6){
							System.out.println("市场经理登录");
							return "marketDepartment/marketManager";
					}else if(loginUser.getPosition().getPosition_id()==2||loginUser.getPosition().getPosition_id()==3){
						System.out.println("人力资源部登录");
						return "human_resource_department/human_resource_department_employee_index1";
				   }
					
					return "human_resource_department/human_resource_department_employee_index";
				}
			}else{
				session.setAttribute("pwderror", "密码不正确");
				session.setAttribute("username", oauser.getUser_name());
				return "human_resource_department/login";
			}
	}
	/**
	 * 注销
	 * @param session
	 * @return
	 */
	@RequestMapping("/Logout")
	public String backendLogin(HttpSession session)
	{
		session.removeAttribute("employee");
		session.removeAttribute("lastLoginInfo");
		session.removeAttribute("loginUser");
		session.removeAttribute("LoginTime");
		session.removeAttribute("OrLogin");
		return "human_resource_department/login";
	}
}
