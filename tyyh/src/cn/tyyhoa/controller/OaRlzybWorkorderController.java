package cn.tyyhoa.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.tyyhoa.pojo.Msg;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybWodetails;
import cn.tyyhoa.pojo.OaRlzybWodetailsExample;
import cn.tyyhoa.pojo.OaRlzybWodetailsExample.Criteria;
import cn.tyyhoa.pojo.OaRlzybWorkorder;
import cn.tyyhoa.service.OaRlzybEmployeeService;
import cn.tyyhoa.service.impl.OaRlzybEmployeeServiceImpl;
import cn.tyyhoa.service.impl.OaRlzybWodetailsServiceImpl;
import cn.tyyhoa.service.impl.OaRlzybWorkorderServiceImpl;

@Controller
@RequestMapping("/workorder")
public class OaRlzybWorkorderController {
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	@Autowired
	OaRlzybWorkorderServiceImpl workorderServiceImpl;
	@Autowired
	OaRlzybWodetailsServiceImpl wodetailsServiceImpl;
	
	/**
	 * 工单打分操作
	 * @param oaRlzybWorkorder
	 * @param wodetails_id
	 * @param wodetails_points
	 * @return 工单打分页面
	 */
	@RequestMapping(value="submit_mark",method=RequestMethod.POST)
	public String submit_mark(OaRlzybWorkorder oaRlzybWorkorder,	
			@RequestParam("wodetails_id")Integer[] wodetails_id,
			@RequestParam("wodetails_points")Integer[] wodetails_points	){
		System.out.println(oaRlzybWorkorder);
		workorderServiceImpl.workorderupdate(oaRlzybWorkorder);		
		for (int i = 0; i < wodetails_id.length; i++) {
			OaRlzybWodetails wodetails=new OaRlzybWodetails();
			wodetails.setWodetails_id(wodetails_id[i]);
			wodetails.setWodetails_points(wodetails_points[i]);
			wodetailsServiceImpl.wodetailsupdate(wodetails);
		}		
		return "human_resource_department/workorder_selectall";
	}
	
	/**
	 * 工单打分页面
	 * @param workorder_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/marking/{workorder_id}",method=RequestMethod.POST)
	public Msg marking(@PathVariable("workorder_id")Integer workorder_id){
		System.out.println(workorder_id);
		OaRlzybWorkorder workorders=workorderServiceImpl.selectById(workorder_id);
		System.out.println(workorders);
		OaRlzybWodetailsExample wodetailsExample=new OaRlzybWodetailsExample();
		Criteria createCriteria = wodetailsExample.createCriteria();
		createCriteria.andWorkOrder_idEqualTo(workorder_id);
		List<OaRlzybWodetails> wodetails= wodetailsServiceImpl.selectByWorkorderId(wodetailsExample);
		for (OaRlzybWodetails oaRlzybWodetails : wodetails) {
			System.out.println(oaRlzybWodetails);
		}
		return Msg.success().add("workorders", workorders).add("wodetails", wodetails);
		
	}
	
	/**
	 * 查看下发的工单
	 * @param emp_id
	 * @return
	 */	
	@ResponseBody
	@RequestMapping(value="/selectAll/{emp_id}",method=RequestMethod.POST)
	public Msg selectAll(@PathVariable("emp_id")Integer emp_id){
		List<OaRlzybWorkorder> workorders=workorderServiceImpl.selectAll(emp_id);
		return Msg.success().add("workorders", workorders);
		
	}
	
	/**
	 * 查看自己的工单
	 * @param emp_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selectmyself/{emp_id}",method=RequestMethod.POST)
	public Msg selectmyself(@PathVariable("emp_id")Integer emp_id){
		System.out.println("ok"+emp_id);
		List<OaRlzybWodetails> wodetails= wodetailsServiceImpl.SelectWoByThisMonth(emp_id);
		return Msg.success().add("wodetails", wodetails);
	}
	/**
	 * 下发工单
	 * @param pointer
	 * @param empid
	 * @param percentage
	 * @param json
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addworkorder",method=RequestMethod.POST)
	public Msg addworkorder(@RequestParam ("pointer")Integer pointer,@RequestParam ("empid")Integer empid,@RequestParam ("percentage")Integer percentage,@RequestParam ("json") String json){
		long count=workorderServiceImpl.countByEmp_id(empid);
		System.out.println(count+"======="+empid);
		//限制每月工单下发次数
		if(count==0){
			OaRlzybWorkorder Workorder=new OaRlzybWorkorder();
			Workorder.setEmp_id(empid);
			Workorder.setWorkOrder_percentage(percentage);
			Workorder.setWorkOrder_pointer(pointer);
			Workorder.setWorkOrder_IssuedDate(new Date());
			int row=workorderServiceImpl.addWorkorder(Workorder);
			OaRlzybWodetails wodetails=new OaRlzybWodetails();
			Integer wodetailsid=Workorder.getWorkOrder_id();
			List<OaRlzybWodetails> wodes=JSON.parseArray(json,OaRlzybWodetails.class);
			for (OaRlzybWodetails oaRlzybWodetails : wodes) {
				oaRlzybWodetails.setWorkOrder_id(wodetailsid);
				wodetailsServiceImpl.insertwodetails(oaRlzybWodetails);
			}
			return Msg.success().add("remind", "下发成功");
		}else{
			return Msg.fail().add("remind", "一个月只能给一个人下发一次工单");
		}
		
	}
	
	/**
	 * 获取同部门员工
	 * @param deptid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getemp/{deptid}",method=RequestMethod.POST)
	public Msg getemp(@PathVariable("deptid")Integer deptid){
		List<OaRlzybEmployee>emps= oaRlzybEmployeeService.getEmpByDept(deptid);
		return Msg.success().add("emps", emps);
	}
	/**
	 * 跳转到查看工单页面
	 * @return
	 */
	@RequestMapping("/workorder_select")
	public String selectworkorder()
	{
		return "human_resource_department/workorder_select";
	}
	
	/**
	 * 跳转到下发工单页面
	 * @return
	 */
	@RequestMapping("/workorder_add")
	public String addworkorder()
	{
		return "human_resource_department/workorder_add";
	}
	
	/**
	 * 跳转到查看下发工单页面
	 * @return
	 */
	@RequestMapping("/workorder_selectall")
	public String selectall()
	{
		return "human_resource_department/workorder_selectall";
	}
	/**
	 * 跳转到工单打分页面
	 * @return
	 */
	@RequestMapping("/workorder_update/{workorder_id}")
	public String workorder_update(@PathVariable("workorder_id") Integer workorder_id,HttpServletRequest request)
	{
		request.setAttribute("workorder_id", workorder_id);
		return "human_resource_department/workorder_update";
	}
}
