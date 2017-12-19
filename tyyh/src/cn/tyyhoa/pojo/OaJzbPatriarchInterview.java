package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbPatriarchInterview {
    private Integer id;//编号

    private String interview_name;//访谈对象学员ID(--)

    private Integer interview_id;//访谈人ID(--)

    private Integer term;//学期(--)

    private Date interview_time;//访谈时间

    private Date entering_time;//录入时间自动当前时间

    private Integer interview_way;//访谈方式ID(--)

    private String interview_content;//访谈内容

    private String remarks;//备注
    
    private Integer deleteStatus;//删除状态
    
    private String emp_name;//访谈老师的姓名
    
    private String stage;//学期
    
    private String Interview;//访谈方式
    
    private String stu_name;//学生名字
    
    private Integer stu_id;
    
    private boolean flas;
    
    

    public boolean isFlas() {
		return flas;
	}

	public void setFlas(boolean flas) {
		this.flas = flas;
	}

	public Integer getStu_id() {
		return stu_id;
	}

	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	

	

	public String getInterview() {
		return Interview;
	}

	public void setInterview(String interview) {
		Interview = interview;
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
  
	public String getInterview_name() {
		return interview_name;
	}

	public void setInterview_name(String interview_name) {
		this.interview_name = interview_name;
	}

	public Integer getInterview_id() {
        return interview_id;
    }

    public void setInterview_id(Integer interview_id) {
        this.interview_id = interview_id;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Date getInterview_time() {
        return interview_time;
    }

    public void setInterview_time(Date interview_time) {
        this.interview_time = interview_time;
    }

    public Date getEntering_time() {
        return entering_time;
    }

    public void setEntering_time(Date entering_time) {
        this.entering_time = entering_time;
    }

    public Integer getInterview_way() {
        return interview_way;
    }

    public void setInterview_way(Integer interview_way) {
        this.interview_way = interview_way;
    }

    public String getInterview_content() {
        return interview_content;
    }

    public void setInterview_content(String interview_content) {
        this.interview_content = interview_content == null ? null : interview_content.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}