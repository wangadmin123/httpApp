package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybTransferPosition {
    private Integer transfer_position_id;//编号

    private Integer emp_id;//员工编号

    private Integer position_id;//目标岗位

    private Integer depart_id;  //目标部门编号
    
    private String transfer_position_reason;//调岗原因
    
    private String transfer_position_details;//详情说明

    private String transfer_position_time;//调岗时间

    private Integer transfer_position_delectStatus;//删除状态
    
    private Integer position;
    private Integer depart;
    
    
    
    private Date create_time;
    
    
    public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public Integer getDepart() {
		return depart;
	}

	public void setDepart(Integer depart) {
		this.depart = depart;
	}

	private String emp_name;
    private String position_name;	//岗位名称
    public String getTransfer_position_details() {
		return transfer_position_details;
	}

	public void setTransfer_position_details(String transfer_position_details) {
		this.transfer_position_details = transfer_position_details;
	}

	private String depart_name;		//部门名称

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

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	public Integer getTransfer_position_id() {
        return transfer_position_id;
    }

    public void setTransfer_position_id(Integer transfer_position_id) {
        this.transfer_position_id = transfer_position_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Integer getPosition_id() {
        return position_id;
    }

    public void setPosition_id(Integer position_id) {
        this.position_id = position_id;
    }

    public String getTransfer_position_reason() {
        return transfer_position_reason;
    }

    public void setTransfer_position_reason(String transfer_position_reason) {
        this.transfer_position_reason = transfer_position_reason == null ? null : transfer_position_reason.trim();
    }

    public String getTransfer_position_time() {
        return transfer_position_time;
    }

    public void setTransfer_position_time(String transfer_position_time) {
        this.transfer_position_time = transfer_position_time == null ? null : transfer_position_time.trim();
    }

    public Integer getTransfer_position_delectStatus() {
        return transfer_position_delectStatus;
    }

    public void setTransfer_position_delectStatus(Integer transfer_position_delectStatus) {
        this.transfer_position_delectStatus = transfer_position_delectStatus;
    }
}