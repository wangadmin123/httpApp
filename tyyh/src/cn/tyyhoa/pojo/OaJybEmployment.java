package cn.tyyhoa.pojo;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class OaJybEmployment {
    private Integer employment_id;//就业信息表主键id
    
    private OaJzbStudent employment_studentId;//学员姓名

    @JSONField(format="yyyy-MM-dd")
    private Date employment_time;//入职时间

    private String employment_city;//入职城市

    private String employment_unit;//就业单位

    private Double employment_Salary_probation;//试用期薪资

    private Double employment_Salary_worker;//转正薪资

    private String employment_engaged_type;//就业岗位类型

    private String employment_welfare;//福利待遇

    private String employment_remarks;//备注
    
    private String employment_engaged; //从事岗位
    
    private String employment_status; //就业状态
    
    private String className; //班级
    

	private String  record; //学历
	
	private int agePd; //年龄段判断
	

	public void setAgePd(int agePd) {
		this.agePd = agePd;
	}

	public String getEmployment_status() {
		return employment_status;
	}

	public void setEmployment_status(String employment_status) {
		this.employment_status = employment_status;
	}

	public int getAgePd() {
		return agePd;
	}

	public void setAgePd(Integer agePd) {
		this.agePd = agePd;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}
    
    public String getEmployment_engaged() {
		return employment_engaged;
	}

	public void setEmployment_engaged(String employment_engaged) {
		this.employment_engaged = employment_engaged;
	}

	public Integer getEmployment_id() {
        return employment_id;
    }

    public void setEmployment_id(Integer employment_id) {
        this.employment_id = employment_id;
    }

  

    public OaJzbStudent getEmployment_studentId() {
		return employment_studentId;
	}

	public void setEmployment_studentId(OaJzbStudent employment_studentId) {
		this.employment_studentId = employment_studentId;
	}

	public Date getEmployment_time() {
        return employment_time;
    }

    public void setEmployment_time(Date employment_time) {
        this.employment_time = employment_time;
    }

    public String getEmployment_city() {
        return employment_city;
    }

    public void setEmployment_city(String employment_city) {
        this.employment_city = employment_city == null ? null : employment_city.trim();
    }

    public String getEmployment_unit() {
        return employment_unit;
    }

    public void setEmployment_unit(String employment_unit) {
        this.employment_unit = employment_unit == null ? null : employment_unit.trim();
    }

    public Double getEmployment_Salary_probation() {
        return employment_Salary_probation;
    }

    public void setEmployment_Salary_probation(Double employment_Salary_probation) {
        this.employment_Salary_probation = employment_Salary_probation;
    }

    public Double getEmployment_Salary_worker() {
        return employment_Salary_worker;
    }

    public void setEmployment_Salary_worker(Double employment_Salary_worker) {
        this.employment_Salary_worker = employment_Salary_worker;
    }

    
    public String getEmployment_engaged_type() {
		return employment_engaged_type;
	}

	public void setEmployment_engaged_type(String employment_engaged_type) {
		this.employment_engaged_type = employment_engaged_type;
	}

	public String getEmployment_welfare() {
        return employment_welfare;
    }

    public void setEmployment_welfare(String employment_welfare) {
        this.employment_welfare = employment_welfare == null ? null : employment_welfare.trim();
    }

    public String getEmployment_remarks() {
        return employment_remarks;
    }

    public void setEmployment_remarks(String employment_remarks) {
        this.employment_remarks = employment_remarks == null ? null : employment_remarks.trim();
    }
}