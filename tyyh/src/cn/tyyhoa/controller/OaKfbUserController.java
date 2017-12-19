package cn.tyyhoa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.Msg;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaKfbGroup;
import cn.tyyhoa.pojo.OaKfbJob;
import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.service.OaRlzybUserService;
import cn.tyyhoa.service.impl.OaKfbJobServiceimpl;
import cn.tyyhoa.service.impl.OaKfbUserServiceimpl;
import cn.tyyhoa.service.impl.OaKfb_GroupMapperServiceImpl;
import cn.tyyhoa.service.impl.OaRlzybUserServiceImpl;

/**
 * 处理员工内容
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/KfbUser")
public class OaKfbUserController {

	@Autowired
	OaKfbUserServiceimpl userService;
	@Autowired
	OaKfb_GroupMapperServiceImpl groupService;	
	@Autowired
	OaKfbJobServiceimpl jobService;
	@Autowired
	OaRlzybUserService oaRlzybUserService;
	@Autowired
	OaRlzybUserServiceImpl oaRlzybUserServiceImpl;
	
	
	
	/**
	 * 修改小组时获得信息
	 * @param groupid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="update_group/{groupid}",method=RequestMethod.POST)
	public Msg update_group(@PathVariable("groupid") Integer groupid) {
		OaKfbGroup group = groupService.selectGroupById(groupid);
		List<OaKfbJob> jobs = jobService.selectAllJob();
		List<OaKfbUser> users = userService.getUserByGroup(groupid);
		return Msg.success().add("jobs", jobs).add("group", group).add("users", users);
	}
	
	
	
	/**
	 * 删除小组时验证小组下是否有员工
	 * @param groupid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/findGroup/{groupid}",method=RequestMethod.POST)
	public Msg findGroup(@PathVariable("groupid") Integer groupid) {
			List<OaKfbUser> users = userService.getUserByGroup(groupid);
			return Msg.success().add("size", users.size()).add("groupid", groupid);
		}
	
	
	
	/**
	 * 移出小组人员
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/remove/{id}/{stuid}",method=RequestMethod.POST)
	public Msg Remove(@PathVariable("id") Integer id,@PathVariable("stuid") String stuid) {
		int row=userService.remove(id);	
		oaRlzybUserServiceImpl.updateUserJob33(stuid);
		return Msg.success().add("row", row);
	}
	
	/**
	 * 显示组内信息
	 * @param groupid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/InsertUserFromStu/{groupid}",method=RequestMethod.POST)
	public Msg SelectGroup(@PathVariable("groupid") Integer groupid) {
		List<OaKfbUser> users = userService.getUserByGroup(groupid);
		OaKfbGroup Group = groupService.selectGroupById(groupid);
		return Msg.success().add("users", users).add("Group", Group);
	}
	
	
	
	/**
	 * 将实训班级名单添加到开发部
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/InsertUserFromStu")
	public Msg InsertUserFromStu() {
		int row=userService.insertuser();
		oaRlzybUserService.deleteUserNotKfbStu();
		oaRlzybUserService.InsertUserFromStu();
		if(row>0) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	/**
	 * 查看历史学生消息
	 * @param stu_id
	 * @param stu_name
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/gethistorystu",method=RequestMethod.POST)
	public  Msg gethistorystu(
			@RequestParam(value = "stu_id",required=false) String stu_id,
			@RequestParam(value = "stu_name",required=false) String stu_name,
			@RequestParam(value = "gradeid",required=false) Integer gradeid,
			@RequestParam(value = "groupid",required=false) Integer groupid) {
		if(stu_id!=null &&stu_id.length()==0){
			stu_id=null;
		}
		if(stu_name!=null&&stu_name.length()==0){
			stu_name=null;
		}
		if(gradeid!=null&&gradeid==0){
			gradeid=null;
		}
		if(groupid!=null&&groupid==0){
			groupid=null;
		}
		System.out.println(stu_id);
		System.out.println(stu_name);
		System.out.println(gradeid);
		System.out.println(groupid);
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("stu_id", stu_id);
		paramMap.put("stu_name", stu_name);
		paramMap.put("gradeid", gradeid);
		paramMap.put("groupid", groupid);
		List<OaKfbUser> stus=userService.gethistoryStu(paramMap);
		return Msg.success().add("stus", stus);
	}
	
	
	@ResponseBody
	@RequestMapping("/getGrade")
	public Msg getGrade() {
		List<OaJwbGrade> grades=userService.getgrade();
		Map<Integer,String> Grades=new HashMap<Integer, String>();
		for (OaJwbGrade oaJwbGrade : grades) {
			Grades.put(oaJwbGrade.getId(), oaJwbGrade.getName());
		}
		return Msg.success().add("grades", Grades);
	}
	
	/**
	 * 查看学生信息
	 * @param stu_id
	 * @param stu_name
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getstu",method=RequestMethod.POST)
	public  Msg getstu(@RequestParam(value = "stu_id",required=false) String stu_id,@RequestParam(value = "stu_name",required=false) String stu_name,@RequestParam(value="pn",defaultValue="1") Integer pn) {	
		OaKfbUser student=new OaKfbUser();
		student.setStu_id(stu_id);
		student.setStu_name(stu_name);
		List<OaKfbUser> stus=userService.getStuinfo(student);
		return Msg.success().add("stus", stus);
	}
	
	/**
	 * 接收员工信息
	 * @param groupid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getUserNoGroup")
	public Msg getUserNoGroup() {
		List<OaKfbUser> users=userService.selectUserNoGroup();
		return Msg.success().add("users", users);
	}
	
	/**
	 * 单条/批量分组
	 * @param groupid
	 * @param users
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/GroupUser")
	public Msg addUser(@RequestParam(value = "groupid") Integer groupid,@RequestParam(value = "users") String users) {
		if(users.contains("-")) {
			List<Integer> userids=new ArrayList<>();
			String[] str_ids = users.split("-");
			//组装id集合
			for ( String string: str_ids) {
				userids.add(Integer.parseInt(string));
			}
		userService.UserUpdateGroups(userids,groupid);	
		}else {
			Integer id=Integer.parseInt(users); 
			userService.UserUpdateGroup(id,groupid);
		}
			return Msg.success();
	}
	
}