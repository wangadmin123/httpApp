package cn.tyyhoa.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author Administrator
 *
 */
public class OaJzbPunish {
    private Integer id;//编号

    private Integer Student_id;//学员ID(一)
    
    private String stuName;//学员姓名
    
    private Integer Term_id;//学期ID（一）
    
    private Date Punish_time;//惩罚时间

    private String Punish_cause;//惩罚原因

    private String Punish_way;//惩罚方式

    private Integer Implement_id;//实施人ID(一)
    
    private String empName;//实施人姓名
    
    private Date Entering_time;//录入时间

    private String remarks;//备注
    
    private Integer DeleteStatus;
    
    private boolean flas;
    
    
    
    public boolean isFlas() {
		return flas;
	}

	public void setFlas(boolean flas) {
		this.flas = flas;
	}

	public Integer getDeleteStatus() {
		return DeleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		DeleteStatus = deleteStatus;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    

    public Integer getStudent_id() {
		return Student_id;
	}

	public void setStudent_id(Integer student_id) {
		Student_id = student_id;
	}

	

    public Integer getTerm_id() {
		return Term_id;
	}

	public void setTerm_id(Integer term_id) {
		Term_id = term_id;
	}

	

    public Date getPunish_time() {
		return Punish_time;
	}

	public void setPunish_time(Date punish_time) {
		Punish_time = punish_time;
	}

	

    public String getPunish_cause() {
		return Punish_cause;
	}

	public void setPunish_cause(String punish_cause) {
		Punish_cause = punish_cause;
	}



    public String getPunish_way() {
		return Punish_way;
	}

	public void setPunish_way(String punish_way) {
		Punish_way = punish_way;
	}

	public Integer getImplement_id() {
		return Implement_id;
	}

	public void setImplement_id(Integer implement_id) {
		Implement_id = implement_id;
	}

	public Date getEntering_time() {
		return Entering_time;
	}

	public void setEntering_time(Date entering_time) {
		Entering_time = entering_time;
	}

	public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
    
}