package cn.tyyhoa.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OaJzbPatrolgrade {
    private Integer id;//编号

    private Integer teacher_id;//班主任ID(--)

    private Integer grade_id;//班级ID(--)

    private Integer studentName_id;//学生姓名ID(--)



    private Date enteringTime;//录入时间（自动生成）

    private Integer problem;//问题/结果
    
    private Integer deleteStatus;//删除状态 默认0

    private String stu_name;//学生姓名
    
    private String emp_name;//老师名字
    
    private String name;//班级姓名
    
    private String question;//问题
    
    private boolean flas;
    
    

	public boolean isFlas() {
		return flas;
	}

	public void setFlas(boolean flas) {
		this.flas = flas;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public Integer getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(Integer teacher_id) {
        this.teacher_id = teacher_id;
    }

    public Integer getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(Integer grade_id) {
        this.grade_id = grade_id;
    }

    public Integer getStudentName_id() {
        return studentName_id;
    }

    public void setStudentName_id(Integer studentName_id) {
        this.studentName_id = studentName_id;
    }

    public Date getEnteringTime() {
        return enteringTime;
    }

    public void setEnteringTime(Date enteringTime) {
        this.enteringTime = enteringTime;
    }

    public Integer getProblem() {
        return problem;
    }

    public void setProblem(Integer problem) {
        this.problem = problem;
    }
}