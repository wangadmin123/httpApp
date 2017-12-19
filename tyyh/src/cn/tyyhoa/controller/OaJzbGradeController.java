package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbGroup;
import cn.tyyhoa.pojo.OaJzbProject;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.service.OaJzbClassplanService;
import cn.tyyhoa.service.OaJzbGroupService;
import cn.tyyhoa.service.OaJzbHebanService;
import cn.tyyhoa.service.OaJzbProjectService;
import cn.tyyhoa.util.Constants;
import cn.tyyhoa.util.OaJzbRevoke;

@Controller
public class OaJzbGradeController {
	@Autowired
	OaJzbProjectService oaJzbProjectService;
	@Autowired
	OaJzbGroupService oaJzbGroupService;
	@Resource(name="OaJzbHebanService")
	private OaJzbHebanService ojhs;

	public OaJzbHebanService getOjhs() {
		return ojhs;
	}
	public void setOjhs(OaJzbHebanService ojhs) {
		this.ojhs = ojhs;
	}
	//根据班级ID 查询所有的学生
	@RequestMapping(value="getStudentsByGriade_ID")
	public String getStudentsByGriade_ID(HttpSession session,HttpServletRequest request,String gradeid,Integer stageId){
		session.setAttribute("gradeid", gradeid);
		List<OaJzbStudent> OaJzbStudents = oaJzbGroupService.getStudentsByGriade_ID(Integer.parseInt(gradeid),stageId);
		request.setAttribute("OaJzbStudents", OaJzbStudents);
		return "teach_nature_department/jzb/addGroup";
	}
	//给学生分组
	@RequestMapping(value="StudentInGroup",method=RequestMethod.POST)
	public String StudentInGroup(String grades,String[]stu_id,HttpSession session,Integer gradeid) throws ParseException{

		OaJwbGrade oaJwbGrade = ojhs.selectGradeId(gradeid);

		System.out.println(oaJwbGrade);
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//当前系统时间
		String time=dateFormat.format(new Date());
		Date dqTime=dateFormat.parse(time);

		int row = 0;
		if(grades!=null&&grades!=""){
			row = oaJzbProjectService.addGrupus(grades,gradeid);
		}

		if (stu_id.length!=0) {
			if (row == 1) {
				OaJzbGroup OaJzbGroupid = oaJzbProjectService.getGroupID();
				for (int i = 0; i < stu_id.length; i++) {
					if (stu_id[i] != "" && stu_id[i] != null) {
						oaJzbProjectService.addProject(Integer.parseInt(stu_id[i]),OaJzbGroupid.getId(),dqTime,oaJwbGrade.getStage());
					}
				}
				/*"redirect:/gradeShowListLink/" + gradeid*/
				/*jsp/teach_nature_department/jzb/gradeShowList.jsp*/
				return "redirect:/oaJwbGradeslist.html";
			} else {
				return "redirect:/getStudentsByGriade_ID";
			}
		}else{
			return "redirect:/getStudentsByGriade_ID";
		}

	};
	//修改页面跳转
	@RequestMapping("showOaJzbProject/{id}")
	public String showOaJzbProject(@PathVariable String id,HttpServletRequest request){
		OaJzbProject oaJzbProject  = oaJzbProjectService.getProjectByID(Integer.parseInt(id));
		request.setAttribute("oaJzbProject", oaJzbProject);
		return "teach_nature_department/jzb/editXmdbScore";
	}
	//修改成功
	@RequestMapping("updateOaJzbProject/{id}")
	public String updateOaJzbProject(@PathVariable String id,String score,String group_score,String group_expression
			,String remarks,HttpSession session){
		String gradeid = (String) session.getAttribute("gradeid");
		if(score.length()==0){
			score="0.0";
		}
		if(group_score.length()==0){
			group_score="0.0";
		}
		int row = oaJzbProjectService.updateProjectByID(Double.parseDouble(score), Double.parseDouble(group_score), group_expression, remarks, Integer.parseInt(id));
		if(row==0){
			return "redirect:/showOaJzbProject"+id;
		}else{
			return "redirect:/gradeShowListLink/"+gradeid;
		}
	}
	//删除
	@RequestMapping("deleteOaJzbProject/{id}")
	public String deleteOaJzbProject(@PathVariable String id,HttpSession session){
		String gradeid = (String) session.getAttribute("gradeid");
		oaJzbProjectService.deleteProjectById(Integer.parseInt(id));
		return "redirect:/gradeShowListLink/"+gradeid;
	}
}
