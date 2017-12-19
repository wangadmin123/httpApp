package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbDailyworkcontent {
    private Integer dailyworkcontent_id;//日报表工作内容id

    private Date entrytime;//录入时间

    private Integer teacher_id;//班主任ID

    private String theContentOfThework;//当日工作内容

    private String morningwork;//上午工作内容

    private String afternoonjobcontent;//下午工作内容

    private String remarks;//备注

    private Integer deleteStatus;//删除状态
    
    private Integer emp_id;//员工编号
    
    private String emp_name;//员工名字
    
    private String emp_name_simple;//姓名简写
    
    private String depart_name;//员工所属部门
    
    private String  position_name;//员工所属职位
    
    

    public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_name_simple() {
		return emp_name_simple;
	}

	public void setEmp_name_simple(String emp_name_simple) {
		this.emp_name_simple = emp_name_simple;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Integer getDailyworkcontent_id() {
        return dailyworkcontent_id;
    }

    public void setDailyworkcontent_id(Integer dailyworkcontent_id) {
        this.dailyworkcontent_id = dailyworkcontent_id;
    }

    public Date getEntrytime() {
        return entrytime;
    }

    public void setEntrytime(Date entrytime) {
        this.entrytime = entrytime;
    }

    public Integer getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(Integer teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTheContentOfThework() {
        return theContentOfThework;
    }

    public void setTheContentOfThework(String theContentOfThework) {
        this.theContentOfThework = theContentOfThework == null ? null : theContentOfThework.trim();
    }

    public String getMorningwork() {
        return morningwork;
    }

    public void setMorningwork(String morningwork) {
        this.morningwork = morningwork == null ? null : morningwork.trim();
    }

    public String getAfternoonjobcontent() {
        return afternoonjobcontent;
    }

    public void setAfternoonjobcontent(String afternoonjobcontent) {
        this.afternoonjobcontent = afternoonjobcontent == null ? null : afternoonjobcontent.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }
}