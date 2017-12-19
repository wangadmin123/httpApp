package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybLeave {
    private Integer leave_id;//请假表编号

    private Integer emp_id;//请假人编号

    private Date leave_startDate;//合同起始日期
    
    private String leave_startDate_str;//合同起始日期
    private Date leave_endDate;//合同截止日期
    
    private String leave_endDate_str;//合同截止日期

    private String leave_type;//请假类型

    private String leave_reason;//离岗原因

    private String leave_approver;//批准人

    private Integer leave_delectStatus;//删除状态

    private String emp_name;//姓名
    
    private String depart_name;//部门
    
    private String position_name;//职位名称
    
    private Integer depart_id;

 private Date leave_backTime;
    
    public Date create_time;
    
    
    
    
    public Date getLeave_backTime() {
		return leave_backTime;
	}

	public void setLeave_backTime(Date leave_backTime) {
		this.leave_backTime = leave_backTime;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getLeave_startDate_str() {
		return leave_startDate_str;
	}

	public void setLeave_startDate_str(String leave_startDate_str) {
		this.leave_startDate_str = leave_startDate_str;
	}

	public String getLeave_endDate_str() {
		return leave_endDate_str;
	}

	public void setLeave_endDate_str(String leave_endDate_str) {
		this.leave_endDate_str = leave_endDate_str;
	}

	public Integer getDepart_id() {
		return depart_id;
	}

	public void setDepart_id(Integer depart_id) {
		this.depart_id = depart_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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

	public Integer getLeave_id() {
        return leave_id;
    }

    public void setLeave_id(Integer leave_id) {
        this.leave_id = leave_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Date getLeave_startDate() {
        return leave_startDate;
    }

    public void setLeave_startDate(Date leave_startDate) {
        this.leave_startDate = leave_startDate;
    }

    public Date getLeave_endDate() {
        return leave_endDate;
    }

    public void setLeave_endDate(Date leave_endDate) {
        this.leave_endDate = leave_endDate;
    }

    public String getLeave_type() {
        return leave_type;
    }

    public void setLeave_type(String leave_type) {
        this.leave_type = leave_type == null ? null : leave_type.trim();
    }

    public String getLeave_reason() {
        return leave_reason;
    }

    public void setLeave_reason(String leave_reason) {
        this.leave_reason = leave_reason == null ? null : leave_reason.trim();
    }

    public String getLeave_approver() {
        return leave_approver;
    }

    public void setLeave_approver(String leave_approver) {
        this.leave_approver = leave_approver == null ? null : leave_approver.trim();
    }

    public Integer getLeave_delectStatus() {
        return leave_delectStatus;
    }

    public void setLeave_delectStatus(Integer leave_delectStatus) {
        this.leave_delectStatus = leave_delectStatus;
    }
}