package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybChronicle {
	private int record_id;//记录表ID
	private int student_id;//学生ID
	private Date event_time;//事件时间
	private String event_name;//事件名
	private String inputUser;//录入人
	private Date input_time;//录入时间
	private String describe;//事件描述
	private int isNormal;//是否正常数据，默认为0，非正常为1
	private String stuname;//学员姓名
	private String gradename;//班级名称
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public int getRecord_id() {
		return record_id;
	}
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public Date getEvent_time() {
		return event_time;
	}
	public void setEvent_time(Date event_time) {
		this.event_time = event_time;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getInputUser() {
		return inputUser;
	}
	public void setInputUser(String inputUser) {
		this.inputUser = inputUser;
	}
	public Date getInput_time() {
		return input_time;
	}
	public void setInput_time(Date input_time) {
		this.input_time = input_time;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public int getIsNormal() {
		return isNormal;
	}
	public void setIsNormal(int isNormal) {
		this.isNormal = isNormal;
	}
	
	

}
