package cn.tyyhoa.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.Msg;
import cn.tyyhoa.pojo.OaKfbGroup;
import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.impl.OaKfbUserServiceimpl;
import cn.tyyhoa.service.impl.OaKfb_GroupMapperServiceImpl;
import cn.tyyhoa.service.impl.OaRlzybUserServiceImpl;


/**
 * 处理小组内容
 * @author Administrator
 *
 */

@Controller
@RequestMapping("/KfbGroup")
public class OaKfbGroupController {
	
	@Autowired
	OaKfb_GroupMapperServiceImpl groupService;	
	@Autowired
	OaKfbUserServiceimpl userService;
	@Autowired
	OaRlzybUserServiceImpl oaRlzybUserServiceImpl;
	
	/**
	 * 二级联动
	 * @param gid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/ByGrade/{gid}",method=RequestMethod.POST)
	public Msg ByGrade(@PathVariable("gid") Integer gid) {
		List<OaKfbGroup> groups=groupService.selectsxedGroup(gid);
			return Msg.success().add("groups", groups);
		}
	
	/**
	 * 修改组内信息
	 * @param group
	 * @param userid
	 * @param job
	 * @return
	 */
	@RequestMapping(value="/updateGroup",method=RequestMethod.POST)
	@ResponseBody
	public  Msg updateGroup(OaKfbGroup group,@RequestParam(required=false)Integer[]userid,
			@RequestParam(required=false)Integer[]job,@RequestParam(required=false)String[]stu_id) {
		//修改开发部员工
		for (int i = 0; i < job.length; i++) {
			OaKfbUser user=new OaKfbUser();
			user.setId(userid[i]);
			user.setJobid(job[i]);
			userService.UserUpdateJob(user);
		}
		groupService.updateGroup(group);
		//修改人力资源部员工
		for (int i = 0; i < job.length; i++) {
			
			String stuid=stu_id[i];
			System.out.println(stuid);
			if(job[i]==1||job[i]==2){
				System.out.println("12"+stuid);
				oaRlzybUserServiceImpl.updateUserJob32(stuid);
			}else if(job[i]==3||job[i]==0){
				System.out.println("03"+stuid);
				oaRlzybUserServiceImpl.updateUserJob33(stuid);
			}
		}
		return Msg.success().add("groupid", group.getId());
	}
	
	/**
	 * 添加小组
	 * @return
	 */
	@RequestMapping(value="/addGroup",method=RequestMethod.POST)
	@ResponseBody
	public Msg addGroup(OaKfbGroup group) {
		groupService.addgroup(group);
		return Msg.success();
	}
	/**
	 * 获取实训的小组
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getsxgroup")
	public Msg getGroup() {
		List<OaKfbGroup> groups=groupService.selectsxGroup();
		return Msg.success().add("groups", groups);
	}
	
	/**
	 * 删除小组
	 * @param gid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteGroup/{gid}",method=RequestMethod.POST)
	public Msg deleteGroup(@PathVariable("gid") Integer gid) {
			groupService.deleteGroup(gid);
			return Msg.success();
		}
	
	
	
	
}