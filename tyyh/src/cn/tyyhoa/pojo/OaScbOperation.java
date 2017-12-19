package cn.tyyhoa.pojo;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

public class OaScbOperation {
	private Integer id;				//编号
	private Integer employee_id;	//操作人ID
	private Integer consulter_id;	//咨询量ID
	private Integer emp_id;			//被操作人ID

	private Date Time;				//操作时间
	private String Times;
	public String getTimes() {
		return Times;
	}
	public void setTimes(String times) {
		Times = times;
	}
	private String content;			//操作内容
	private String employee_name;	//操作人
	private String consulter_name;	//咨询量
	private String emp_name;		//被操作人
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getConsulter_name() {
		return consulter_name;
	}
	public void setConsulter_name(String consulter_name) {
		this.consulter_name = consulter_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
	public Integer getConsulter_id() {
		return consulter_id;
	}
	public void setConsulter_id(Integer consulter_id) {
		this.consulter_id = consulter_id;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public Date getTime() {
		return Time;
	}
	public void setTime(Date time) {
		Time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
