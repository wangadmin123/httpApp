package cn.tyyhoa.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OaJzbIndividualinterview {
    private Integer id;//编号

    private String stu_name;//学员姓名
    
    private Integer stage_id;//学期ID

    private String interviewContent;//访谈内容

    private Integer writerTest;//笔试目标

    private Integer engineTest;//机试目标

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date interviewTime;//访谈时间

    private String classTeacherName;//班主任

    private String monthPunish;//本月惩罚

    private String remark;//备注
    
    private int grade_id;//班级id
    
    private Integer deleteStatus;//删除状态
    
    private String teacherName;//教员
    
    private String stage;//学期
    
    private Integer month;//月份
   
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public String getInterviewContent() {
        return interviewContent;
    }

    public void setInterviewContent(String interviewContent) {
        this.interviewContent = interviewContent == null ? null : interviewContent.trim();
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

    public Date getInterviewTime() {
		return interviewTime;
	}

	public void setInterviewTime(Date interviewTime) {
		this.interviewTime = interviewTime;
	}

	public String getMonthPunish() {
		return monthPunish;
	}

	public void setMonthPunish(String monthPunish) {
		this.monthPunish = monthPunish;
	}

	public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	



	public Integer getStage_id() {
		return stage_id;
	}

	public void setStage_id(Integer stage_id) {
		this.stage_id = stage_id;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public int getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(int grade_id) {
		this.grade_id = grade_id;
	}

	public Integer getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public String getClassTeacherName() {
		return classTeacherName;
	}

	public void setClassTeacherName(String classTeacherName) {
		this.classTeacherName = classTeacherName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}
	
	
	
	
    
	
    
}