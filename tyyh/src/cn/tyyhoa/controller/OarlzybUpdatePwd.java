package cn.tyyhoa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaRlzybUserService;
import cn.tyyhoa.util.MD5;





@Controller
@RequestMapping("/pwdupdata")
public class OarlzybUpdatePwd {
	
	@Autowired
	private OaRlzybUserService oaRlzybUserService;
	
	@RequestMapping("/pwdreset")
	public void pwdreset(HttpServletResponse response,OaRlzybUser oaRlzybUser,HttpServletRequest request,HttpSession session) throws IOException{
			OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
			oaRlzybUser.setUser_id(user.getUser_id());
			System.out.println(oaRlzybUser.getNew_pwd());
			oaRlzybUserService.updataPwdByPrimaryKey(oaRlzybUser);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print("<script type='text/javascript'>alert('修改成功');location.href='http:'+'//'+'localhost:8080'+'/'+'tyyh'+'/'+'login'+'/'+'userLogin'</script>");
			out.flush();
			out.close();
			
			
	}
	
	
	
	@RequestMapping("/pwdUpdataPage")
	public String pwdUpdataPage(){
		
		return "admin/userpwd_updata";
	}
	

	@RequestMapping("/pwdUpdata")
	public String pwdUpdata(OaRlzybUser oaRlzybUser,HttpServletRequest request,HttpSession session){
		MD5 md5 =new MD5();
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		
		if (user.getUser_pwd().equals(md5.MD5Encode(oaRlzybUser.getOld_pwd()))) {
			oaRlzybUser.setUser_id(user.getUser_id());
			oaRlzybUserService.updataPwdByPrimaryKey(oaRlzybUser);
			return "human_resource_department/welcome";
		}else{
			session.setAttribute("oldpwderror", "旧密码错误请重新输入！！！");
			return "admin/userpwd_updata";
		}
		
	}
	
}
