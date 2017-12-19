package cn.tyyhoa.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OaJzbClassplan {
    private Integer id;//编号

    private Integer emp_id;//老师ID(--)

    private String question;//可能发生的问题

    private String work;//主要工作
    
    private Integer deleteStatus;//删除状态
    
    private Integer grade_id;//班级ID
    
    private Integer Stage_id;//阶段ID
    
    private String coursecontent;//课程内容
    
    private Date enteringTime;//录入时间

    private String emp_name;//老师姓名
    
    private String termStage_name;//阶段名字
    
    private String name;//班级名字
    
    private boolean flas;//超时判断结果
    
    

	public boolean isFlas() {
		return flas;
	}

	public void setFlas(boolean flas) {
		this.flas = flas;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public Integer getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public Integer getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(Integer grade_id) {
		this.grade_id = grade_id;
	}

	public Integer getStage_id() {
		return Stage_id;
	}

	public void setStage_id(Integer stage_id) {
		Stage_id = stage_id;
	}

	public String getCoursecontent() {
		return coursecontent;
	}

	public void setCoursecontent(String coursecontent) {
		this.coursecontent = coursecontent;
	}

	public Date getEnteringTime() {
		return enteringTime;
	}

	public void setEnteringTime(Date enteringTime) {
		this.enteringTime = enteringTime;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getTermStage_name() {
		return termStage_name;
	}

	public void setTermStage_name(String termStage_name) {
		this.termStage_name = termStage_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
}