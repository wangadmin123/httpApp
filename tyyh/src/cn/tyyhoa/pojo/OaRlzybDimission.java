package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybDimission {
    private Integer dimission_id;//编号

    private Integer emp_id;//员工编号

    private String dimission_reason;//离职原因

    private Date dimission_date;//离职日期

    private String dimission_approver;//批准人

    private Integer dimission_delectStatus;//删除状态
    
    private String emp_name;
    private String emp_department;
    private String depart_name;
    private String emp_position;
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

	public String getEmp_department() {
		return emp_department;
	}

	public void setEmp_department(String emp_department) {
		this.emp_department = emp_department;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	public String getEmp_position() {
		return emp_position;
	}

	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Integer getDimission_id() {
        return dimission_id;
    }

    public void setDimission_id(Integer dimission_id) {
        this.dimission_id = dimission_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public String getDimission_reason() {
        return dimission_reason;
    }

    public void setDimission_reason(String dimission_reason) {
        this.dimission_reason = dimission_reason == null ? null : dimission_reason.trim();
    }

    public Date getDimission_date() {
        return dimission_date;
    }

    public void setDimission_date(Date dimission_date) {
        this.dimission_date = dimission_date;
    }

    public String getDimission_approver() {
        return dimission_approver;
    }

    public void setDimission_approver(String dimission_approver) {
        this.dimission_approver = dimission_approver == null ? null : dimission_approver.trim();
    }

    public Integer getDimission_delectStatus() {
        return dimission_delectStatus;
    }

    public void setDimission_delectStatus(Integer dimission_delectStatus) {
        this.dimission_delectStatus = dimission_delectStatus;
    }
}