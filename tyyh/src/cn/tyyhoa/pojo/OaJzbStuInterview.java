package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbStuInterview {
    private Integer id;//编号

    private Integer studentName_id;//访谈对象学员ID

    private Integer interviewName_id;//访谈人ID

    private Integer Term_id;//学期

    private Date interviewTime;//访谈时间

    private Date enteringTime;//录入时间（自动当前时间）

    private Integer interviewMode_id;//访谈方式ID

    private String interviewContent;//访谈内容

    private String remark;//备注

    private Integer writerTest;//笔试
    
    private Integer engineTest;//机试
    
    private String teacherScene;//教员是否在场
    
    private String emp_name;//员工姓名
    
    private String interviewType;//访谈类型
    
    private String stage;//学期
    
    private Integer month;//月份
    
    private String stu_name;//学生姓名
    
    private boolean flas;
    
    
    
	public boolean isFlas() {
		return flas;
	}

	public void setFlas(boolean flas) {
		this.flas = flas;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getInterviewType() {
		return interviewType;
	}

	public void setInterviewType(String interviewType) {
		this.interviewType = interviewType;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudentName_id() {
        return studentName_id;
    }

    public void setStudentName_id(Integer studentName_id) {
        this.studentName_id = studentName_id;
    }

    

    public Integer getInterviewName_id() {
		return interviewName_id;
	}

	public void setInterviewName_id(Integer interviewName_id) {
		this.interviewName_id = interviewName_id;
	}

	public Integer getTerm_id() {
		return Term_id;
	}

	public void setTerm_id(Integer term_id) {
		Term_id = term_id;
	}

	public Date getInterviewTime() {
        return interviewTime;
    }

    public void setInterviewTime(Date interviewTime) {
        this.interviewTime = interviewTime;
    }

    public Date getEnteringTime() {
        return enteringTime;
    }

    public void setEnteringTime(Date enteringTime) {
        this.enteringTime = enteringTime;
    }

    public Integer getInterviewMode_id() {
        return interviewMode_id;
    }

    public void setInterviewMode_id(Integer interviewMode_id) {
        this.interviewMode_id = interviewMode_id;
    }

    public String getInterviewContent() {
        return interviewContent;
    }

    public void setInterviewContent(String interviewContent) {
        this.interviewContent = interviewContent == null ? null : interviewContent.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }


	public Integer getWriterTest() {
		return writerTest;
	}

	public void setWriterTest(Integer writerTest) {
		this.writerTest = writerTest;
	}

	public Integer getEngineTest() {
		return engineTest;
	}

	public void setEngineTest(Integer engineTest) {
		this.engineTest = engineTest;
	}

	public String getTeacherScene() {
		return teacherScene;
	}

	public void setTeacherScene(String teacherScene) {
		this.teacherScene = teacherScene;
	}

	
    
}