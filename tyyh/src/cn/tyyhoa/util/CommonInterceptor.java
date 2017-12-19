package cn.tyyhoa.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.tyyhoa.pojo.OaRlzybUser;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		if (loginUser == null) {
			return false;
		}
		return true;
	}
	
}
