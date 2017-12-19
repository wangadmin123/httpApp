// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   SubfieldContorller.java

package cn.tyyhoa.controller;



import java.util.List;

import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.pojo.OaRlzybSubfield;
import cn.tyyhoa.service.OaRlzybDepartmentService;
import cn.tyyhoa.service.OaRlzybSubfieldService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/subfield")
public class OarlzybSubfieldContorller
{

	@Autowired
	private  OaRlzybSubfieldService oaRlzybSubfieldService;
	@Autowired
	private  OaRlzybDepartmentService oaRlzybDepartmentService;

	public OarlzybSubfieldContorller()
	{
	}
	
	/**
	 * 跳转新增功能组页面
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/addsubfieldPage")
	public String addsubfieldPage(HttpServletRequest request, HttpSession session)
	{
		return "admin/subfield_info_add";
	}
	/**
	 * 新增功能组
	 * @param subfield
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/addSubfield")
	public String addSubfield(OaRlzybSubfield subfield, HttpServletRequest request, HttpSession session)
	{
		System.out.println(subfield.getSubfield_name());
		System.out.println(subfield.getShow_name());
		if (subfield.getSubfield_name().equals("") && subfield.getShow_name().equals(""))
		{
			System.out.println("失败");
			session.setAttribute("error", "功能组信息不完整，数据保存失败");
			return "admin/error";
		}
		int row = oaRlzybSubfieldService.insert(subfield);
		if (row == 0)
		{
			System.out.println("失败");
			session.setAttribute("error", "数据保存失败");
			return "admin/error";
		} else
		{
			System.out.println("成功");
			session.setAttribute("success", "添加功能组信息成功！！！");
			return "admin/success";
		}
	}
	/**
	 * 跳转分配功能组到职位页面
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request, HttpSession session)
	{
		List<OaRlzybDepartment> departments = oaRlzybDepartmentService.selectAllDepartment();
		session.setAttribute("departments", departments);
		List<OaRlzybSubfield> subfields = oaRlzybSubfieldService.selectAllSubfield();
		session.setAttribute("subfields", subfields);
		return "admin/subfield_to_position";
	}
	/**
	 * 分配功能组到职位页面
	 * @param subfield
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/subfield_to_position")
	public String subfield_to_position(OaRlzybSubfield subfield, HttpServletRequest request, HttpSession session)
	{
		System.out.println((new StringBuilder()).append(subfield.getSubfield_id()).append("---").append(subfield.getPosition_id()).toString());
		int row = oaRlzybSubfieldService.subfield_to_position(subfield);
		if (row == 0)
		{
			System.out.println("失败");
			session.setAttribute("error", "功能组中已经存在该功能,功能组分配失败");
			return "admin/error";
		} else
		{
			session.setAttribute("success", "功能组分配成功！！！");
			return "admin/success";
		}
	}
	/**
	 * 跳转功能组移出职位页面
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("delPage")
	public String delPage(HttpServletRequest request, HttpSession session)
	{
		List<OaRlzybDepartment> departments = oaRlzybDepartmentService.selectAllDepartment();
		session.setAttribute("departments", departments);
		List<OaRlzybSubfield> subfields = oaRlzybSubfieldService.selectAllSubfield();
		session.setAttribute("subfields", subfields);
		return "admin/subfield_out_position";
	}
	/**
	 * 功能组移出职位
	 * @param subfield
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/subfield_out_position")
	public String subfield_out_position(OaRlzybSubfield subfield, HttpServletRequest request, HttpSession session)
	{
		System.out.println((new StringBuilder()).append(subfield.getSubfield_id()).append("---").append(subfield.getPosition_id()).toString());
		int row = oaRlzybSubfieldService.subfield_out_position(subfield);
		if (row == 0)
		{
			System.out.println("失败");
			session.setAttribute("error", "数据保存失败");
			return "admin/error";
		} else
		{
			System.out.println("成功");
			session.setAttribute("success", "功能组移出成功！！！");
			return "admin/success";
		}
	}
	/**
	 * 跳转删除功能组页面
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/delsubfieldPage")
	public String delsubfieldPage(HttpServletRequest request, HttpSession session)
	{
		List<OaRlzybSubfield> subfields = oaRlzybSubfieldService.selectCanDelSubfield();
		session.setAttribute("subfields", subfields);
		return "admin/subfield_info_del";
	}
	/**
	 * 删除功能组页面
	 * @param subfield
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/delSubfield")
	public String delSubfield(OaRlzybSubfield subfield, HttpServletRequest request, HttpSession session)
	{
		System.out.println(subfield.getSubfield_id());
		int row = oaRlzybSubfieldService.deleteByPrimaryKey(subfield.getSubfield_id());
		if (row == 0)
		{
			System.out.println("失败");
			session.setAttribute("error", "功能组信息删除失败");
			return "admin/error";
		} else
		{
			System.out.println("成功");
			session.setAttribute("success", "功能组信息删除成功！！！");
			return "admin/success";
		}
	}
}
