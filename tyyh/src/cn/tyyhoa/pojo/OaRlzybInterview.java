package cn.tyyhoa.pojo;

import java.util.Date;

/**
 * @author zl
 *
 */
public class OaRlzybInterview {
    private Integer interview_id;//访谈编号

    private String interview_person;//访谈人

    private Integer emp_id;//员工编号

    private Date interview_date;//访谈时间

    private String interview_reason;//访谈原因

    private String interview_content;//访谈内容

    private String interview_recorder;//记录人

    private Integer interview_delectStatus;//删除状态
    
    private String emp_name;
    
    private Integer emp_department;
    
    private Integer depart_id;
    
    private String depart_name;
    
    private Integer emp_position;
    
    private Integer position_id;

	private String position_name;
	
	 private Date create_time;
	 
    
    public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public Integer getEmp_department() {
		return emp_department;
	}

	public void setEmp_department(Integer emp_department) {
		this.emp_department = emp_department;
	}

	public Integer getDepart_id() {
		return depart_id;
	}

	public void setDepart_id(Integer depart_id) {
		this.depart_id = depart_id;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	public Integer getEmp_position() {
		return emp_position;
	}

	public void setEmp_position(Integer emp_position) {
		this.emp_position = emp_position;
	}

	public Integer getPosition_id() {
		return position_id;
	}

	public void setPosition_id(Integer position_id) {
		this.position_id = position_id;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

    public Integer getInterview_id() {
        return interview_id;
    }

    public void setInterview_id(Integer interview_id) {
        this.interview_id = interview_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }


	public String getInterview_person() {
		return interview_person;
	}

	public void setInterview_person(String interview_person) {
		this.interview_person = interview_person;
	}

	public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Date getInterview_date() {
        return interview_date;
    }

    public void setInterview_date(Date interview_date) {
        this.interview_date = interview_date;
    }

    public String getInterview_reason() {
        return interview_reason;
    }

    public void setInterview_reason(String interview_reason) {
        this.interview_reason = interview_reason == null ? null : interview_reason.trim();
    }

    public String getInterview_content() {
        return interview_content;
    }

    public void setInterview_content(String interview_content) {
        this.interview_content = interview_content == null ? null : interview_content.trim();
    }

    public String getInterview_recorder() {
        return interview_recorder;
    }

    public void setInterview_recorder(String interview_recorder) {
        this.interview_recorder = interview_recorder == null ? null : interview_recorder.trim();
    }

    public Integer getInterview_delectStatus() {
        return interview_delectStatus;
    }

    public void setInterview_delectStatus(Integer interview_delectStatus) {
        this.interview_delectStatus = interview_delectStatus;
    }
}