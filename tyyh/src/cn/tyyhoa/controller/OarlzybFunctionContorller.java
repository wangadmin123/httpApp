// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FunctionContorller.java

package cn.tyyhoa.controller;

import cn.tyyhoa.pojo.OaRlzybFunction;
import cn.tyyhoa.pojo.OaRlzybSubfield;
import cn.tyyhoa.service.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/function")
public class OarlzybFunctionContorller
{

	@Autowired
	private  OaRlzybDepartmentService oaRlzybDepartmentService;
	@Autowired
	private  OaRlzybSubfieldService oaRlzybSubfieldService;
	@Autowired
	private  OaRlzybFunctionService oaRlzybFunctionService;

	public OarlzybFunctionContorller()
	{
	}
	/**
	 * 新增功能页面跳转
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/addfunctionPage")
	public String addfunctionPage(HttpServletRequest request, HttpSession session)
	{
		return "admin/function_info_add";
	}
	/**
	 * 
	 * 添加功能
	 * @param function
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/addfunction")
	public String addFunction(OaRlzybFunction function, HttpServletRequest request, HttpSession session)
	{
		System.out.println(function.getFunction_name());
		System.out.println(function.getFunction_url());
		if (function.getFunction_name().equals("") && function.getFunction_url().equals(""))
		{
			System.out.println("失败");
			session.setAttribute("error", "数据保存失败");
			return "admin/error";
		}
		int row = oaRlzybFunctionService.insert(function);
		if (row == 0)
		{
			System.out.println("失败");
			session.setAttribute("error", "数据保存失败");
			return "admin/error";
		} else
		{
			System.out.println("成功");
			session.setAttribute("success", "添加功能信息成功！！！");
			return "admin/success";
		}
	}
	/**
	 * 跳转功能分配页面
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request, HttpSession session)
	{
		List<OaRlzybSubfield> subfields = oaRlzybSubfieldService.selectAllSubfield();
		session.setAttribute("subfields", subfields);
		List<OaRlzybFunction> functions = oaRlzybFunctionService.selectAddFunction();
		session.setAttribute("functions", functions);
		return "admin/function_to_subfield";
	}
	/**
	 * 功能分配
	 * @param function
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/function_to_subfield")
	public String function_to_subfield(OaRlzybFunction function, HttpServletRequest request, HttpSession session)
	{
		System.out.println((new StringBuilder("删除功能组编号为")).append(function.getSubfield_id()).append("中的编号为").append(function.getFunction_id()).append("的功能").toString());
		int row = oaRlzybFunctionService.function_to_subfield(function);
		if (row == 0)
		{
			System.out.println("失败");
			session.setAttribute("error", "数据保存失败");
			return "admin/error";
		} else
		{
			System.out.println("成功");
			session.setAttribute("success", "功能添加到功能组成功！！！");
			return "admin/success";
		}
	}
	/**
	 * 功能移除功能组
	 * @param function
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/function_out_search")
	public String function_out_search(OaRlzybFunction function, HttpServletRequest request, HttpSession session)
	{
		int row = oaRlzybFunctionService.function_out_subfield(function);
		if (row == 0)
		{
			System.out.println("失败");
			session.setAttribute("error", "数据保存失败");
			return "admin/error";
		} else
		{
			System.out.println("成功");
			session.setAttribute("success", "功能移除功能组成功！！！");
			return "admin/success";
		}
	}
	/**
	 * 跳转功能移出功能组页面
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/delPage")
	public String delPage(HttpServletRequest request, HttpSession session)
	{
		List<OaRlzybSubfield> subfields = oaRlzybSubfieldService.selectAllSubfield();
		session.setAttribute("subfields", subfields);
		return "admin/function_out_subfield";
	}
	/**
	 * 跳转删除功能页面
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/delfunctionPage")
	public String delFunctionPage(HttpServletRequest request, HttpSession session)
	{
		List<OaRlzybFunction> functions = oaRlzybFunctionService.selectCanDelFunction();
		session.setAttribute("functions", functions);
		return "admin/function_info_del";
	}
	/**
	 * 删除功能
	 * @param function
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/delFunction")
	public String delFunction(OaRlzybFunction function, HttpServletRequest request, HttpSession session)
	{
		int row = oaRlzybFunctionService.deleteByFunctionid(function.getFunction_id());
		if (row == 0)
		{
			System.out.println("失败");
			session.setAttribute("error", "数据保存失败");
			return "admin/error";
		} else
		{
			System.out.println("成功");
			session.setAttribute("success", "功能删除信息成功！！！");
			return "admin/success";
		}
	}
}
