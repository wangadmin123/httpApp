// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   UsernameController.java

package cn.tyyhoa.controller;

import cn.tyyhoa.pojo.*;
import cn.tyyhoa.service.impl.*;
import java.io.PrintStream;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/select")
public class OarlzybUsernameController
{

	@Autowired
	private  OaRlzybPositionServiceImpl oaRlzybPositionServiceImpl;
	@Autowired
	private  OaRlzybUserServiceImpl oaRlzybUserServiceImpl;
	@Autowired
	private  OaRlzybEmployeeServiceImpl oaRlzybEmployeeServiceImpl;

	public OarlzybUsernameController()
	{
	}
	
	@RequestMapping("/username")
	public String selectUserName(HttpServletRequest request, HttpSession session)
	{
		OaRlzybUser loginUser = (OaRlzybUser)session.getAttribute("loginUser");
		OaRlzybPosition position = loginUser.getPosition();
		position.setJurisdiction_id(Integer.valueOf(4));
		List<OaRlzybPosition> positions = oaRlzybPositionServiceImpl.selectByDepartmentid(position);
		int i = 0;
		for (Iterator<OaRlzybPosition> iterator = positions.iterator(); iterator.hasNext();)
		{
			OaRlzybPosition oaRlzybPosition = iterator.next();
			System.out.println((new StringBuilder(String.valueOf(oaRlzybPosition.getPosition_name()))).append("-----------").toString());
			List<OaRlzybUser> users = oaRlzybUserServiceImpl.selectByPositionid(oaRlzybPosition.getPosition_id());
			int j = 0;
			for (Iterator<OaRlzybUser> iterator2 = users.iterator(); iterator2.hasNext();)
			{
				OaRlzybUser oaRlzybUser = iterator2.next();
				OaRlzybEmployee employee = oaRlzybEmployeeServiceImpl.selectByPrimaryKey(oaRlzybUser.getEmp_id());
				System.out.println(employee.getEmp_name());
				oaRlzybUser.setEmp(employee);
				users.set(j, oaRlzybUser);
				j++;
			}
			oaRlzybPosition.setUsers(users);
			positions.set(i, oaRlzybPosition);
			i++;
		}
		System.out.println("---------------------数据测试---------------------");
		OaRlzybPosition oaRlzybPosition;
		for (Iterator<OaRlzybPosition> iterator = positions.iterator(); iterator.hasNext(); oaRlzybPosition.getUsers())
			oaRlzybPosition = iterator.next();

		session.setAttribute("positions", positions);
		return "human_resource_department/config";
	}
}
