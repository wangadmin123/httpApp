package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybSalaryAdjustment {
    private Integer salary_adjustment_id;//调薪编号

    private Integer emp_id;//员工编号

    private String salary_adjustment_beforeMoney;//调薪前薪资

    private String salary_adjustment_afterMoney;//调薪后薪资

    private String salary_adjustment_reason;//调薪原因

    private String salary_adjustment_explain;//详细说明

    private Integer salary_adjustment_delectStatus;//删除状态
    
    private String emp_name;
    
    private Integer emp_department;
    
    private String depart_name;
    
    private Integer emp_position;
    
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

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Integer getSalary_adjustment_id() {
        return salary_adjustment_id;
    }

    public void setSalary_adjustment_id(Integer salary_adjustment_id) {
        this.salary_adjustment_id = salary_adjustment_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public String getSalary_adjustment_beforeMoney() {
        return salary_adjustment_beforeMoney;
    }

    public void setSalary_adjustment_beforeMoney(String salary_adjustment_beforeMoney) {
        this.salary_adjustment_beforeMoney = salary_adjustment_beforeMoney == null ? null : salary_adjustment_beforeMoney.trim();
    }

    public String getSalary_adjustment_afterMoney() {
        return salary_adjustment_afterMoney;
    }

    public void setSalary_adjustment_afterMoney(String salary_adjustment_afterMoney) {
        this.salary_adjustment_afterMoney = salary_adjustment_afterMoney == null ? null : salary_adjustment_afterMoney.trim();
    }

    public String getSalary_adjustment_reason() {
        return salary_adjustment_reason;
    }

    public void setSalary_adjustment_reason(String salary_adjustment_reason) {
        this.salary_adjustment_reason = salary_adjustment_reason == null ? null : salary_adjustment_reason.trim();
    }

    public String getSalary_adjustment_explain() {
        return salary_adjustment_explain;
    }

    public void setSalary_adjustment_explain(String salary_adjustment_explain) {
        this.salary_adjustment_explain = salary_adjustment_explain == null ? null : salary_adjustment_explain.trim();
    }

    public Integer getSalary_adjustment_delectStatus() {
        return salary_adjustment_delectStatus;
    }

    public void setSalary_adjustment_delectStatus(Integer salary_adjustment_delectStatus) {
        this.salary_adjustment_delectStatus = salary_adjustment_delectStatus;
    }
}