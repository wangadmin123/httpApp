package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJwbCurriculum {
	private  int recordID;//记录表的id
	private String classdate;//日期
	private  int classhour;//课时
	private String motor;//机房
	private int grade;//班级id
	private String name;//班级名称
	private String cycle;//上课周期
	
	private String lecturer;//授课人
	private String course;//课程
	
	
	private OaJwbChapter chapter_name;
	
	
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	public OaJwbChapter getChapter_name() {
		return chapter_name;
	}
	public void setChapter_name(OaJwbChapter chapter_name) {
		this.chapter_name = chapter_name;
	}
	public int getClasshour() {
		return classhour;
	}
	public void setClasshour(int classhour) {
		this.classhour = classhour;
	}
	public int getRecordID() {
		return recordID;
	}
	public void setRecordID(int recordID) {
		this.recordID = recordID;
	}
	public String getClassdate() {
		return classdate;
	}
	public void setClassdate(String classdate) {
		this.classdate = classdate;
	}
	public String getMotor() {
		return motor;
	}
	public void setMotor(String motor) {
		this.motor = motor;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getCycle() {
		return cycle;
	}
	public void setCycle(String cycle) {
		this.cycle = cycle;
	}
	public String getLecturer() {
		return lecturer;
	}
	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}


}
