package cn.tyyhoa.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OaRlzybContract {
	
    private Integer contract_num;//编号

    private Integer contract_id;//合同编号

    private Integer emp_id;//员工编号

    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date contract_startDate;//合同起始日期

    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date contract_endDate;//合同截止日期

    private String contract_status;//合同状态

    private String contract_belong_company;//所属公司

    private Integer contract_delectStatus;//删除状态

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

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	public Integer getEmp_department() {
		return emp_department;
	}

	public void setEmp_department(Integer emp_department) {
		this.emp_department = emp_department;
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

	public Integer getContract_num() {
        return contract_num;
    }

    public void setContract_num(Integer contract_num) {
        this.contract_num = contract_num;
    }

    public Integer getContract_id() {
        return contract_id;
    }

    public void setContract_id(Integer contract_id) {
        this.contract_id = contract_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Date getContract_startDate() {
		return contract_startDate;
	}

	public void setContract_startDate(Date contract_startDate) {
		this.contract_startDate = contract_startDate;
	}

	public Date getContract_endDate() {
		return contract_endDate;
	}

	public void setContract_endDate(Date contract_endDate) {
		this.contract_endDate = contract_endDate;
	}

	public String getContract_status() {
        return contract_status;
    }

    public void setContract_status(String contract_status) {
        this.contract_status = contract_status == null ? null : contract_status.trim();
    }

    public String getContract_belong_company() {
        return contract_belong_company;
    }

    public void setContract_belong_company(String contract_belong_company) {
        this.contract_belong_company = contract_belong_company == null ? null : contract_belong_company.trim();
    }

    public Integer getContract_delectStatus() {
        return contract_delectStatus;
    }

    public void setContract_delectStatus(Integer contract_delectStatus) {
        this.contract_delectStatus = contract_delectStatus;
    }
}