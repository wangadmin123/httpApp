package cn.tyyhoa.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class OaRlzybWorkorder {
    private Integer workOrder_id;
   
    @JsonFormat(pattern = "yyyy-MM-dd", locale = "zh", timezone = "GMT+8")
    private Date workOrder_IssuedDate;

    private Integer workOrder_pointer;

    private Integer emp_id;

    private Integer workOrder_percentage;

    private Integer workOrder_totalPoints;
    
    private String emp_name;

    
    
    @Override
	public String toString() {
		return "OaRlzybWorkorder [workOrder_id=" + workOrder_id + ", workOrder_IssuedDate=" + workOrder_IssuedDate
				+ ", workOrder_pointer=" + workOrder_pointer + ", emp_id=" + emp_id + ", workOrder_percentage="
				+ workOrder_percentage + ", workOrder_totalPoints=" + workOrder_totalPoints + ", emp_name=" + emp_name
				+ "]";
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public Integer getWorkOrder_id() {
        return workOrder_id;
    }

    public void setWorkOrder_id(Integer workOrder_id) {
        this.workOrder_id = workOrder_id;
    }

    public Date getWorkOrder_IssuedDate() {
        return workOrder_IssuedDate;
    }

    public void setWorkOrder_IssuedDate(Date workOrder_IssuedDate) {
        this.workOrder_IssuedDate = workOrder_IssuedDate;
    }

    public Integer getWorkOrder_pointer() {
        return workOrder_pointer;
    }

    public void setWorkOrder_pointer(Integer workOrder_pointer) {
        this.workOrder_pointer = workOrder_pointer;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Integer getWorkOrder_percentage() {
        return workOrder_percentage;
    }

    public void setWorkOrder_percentage(Integer workOrder_percentage) {
        this.workOrder_percentage = workOrder_percentage;
    }

    public Integer getWorkOrder_totalPoints() {
        return workOrder_totalPoints;
    }

    public void setWorkOrder_totalPoints(Integer workOrder_totalPoints) {
        this.workOrder_totalPoints = workOrder_totalPoints;
    }
}