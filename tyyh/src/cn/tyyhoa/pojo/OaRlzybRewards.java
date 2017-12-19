package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybRewards {
    private Integer rewards_id;//奖惩编号

    private Integer emp_id;//员工编号

    private Date rewards_date;//奖惩时间

    private String rewards_type;//奖惩类型

    private String rewards_reason;//奖惩原因

    private String rewards_content;//奖惩概要

    private Integer rewards_delectStatus;//删除状态
    
    private Integer emp_position;
    
    private String position_name;
    
    private Integer emp_department;
    
    private String depart_name;
    
    private String emp_name;
    
    private Date create_time;
    
    

    public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
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

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public Integer getRewards_id() {
        return rewards_id;
    }

    public void setRewards_id(Integer rewards_id) {
        this.rewards_id = rewards_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Date getRewards_date() {
        return rewards_date;
    }

    public void setRewards_date(Date rewards_date) {
        this.rewards_date = rewards_date;
    }

    public String getRewards_type() {
        return rewards_type;
    }

    public void setRewards_type(String rewards_type) {
        this.rewards_type = rewards_type == null ? null : rewards_type.trim();
    }

    public String getRewards_reason() {
        return rewards_reason;
    }

    public void setRewards_reason(String rewards_reason) {
        this.rewards_reason = rewards_reason == null ? null : rewards_reason.trim();
    }

    public String getRewards_content() {
        return rewards_content;
    }

    public void setRewards_content(String rewards_content) {
        this.rewards_content = rewards_content == null ? null : rewards_content.trim();
    }

    public Integer getRewards_delectStatus() {
        return rewards_delectStatus;
    }

    public void setRewards_delectStatus(Integer rewards_delectStatus) {
        this.rewards_delectStatus = rewards_delectStatus;
    }
}