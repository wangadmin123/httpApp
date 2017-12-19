package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbClassplansum {
    private Integer great_id;//班级ID

    private String sum;//总结

    private Integer emp_name_id;//老师ID
    
    private String deleteStatus;//删除状态
    
    private Integer classplansum_id;//主键 id
    
    private String emp_name;//老师名字
    
    private Date enteringTime;
    
    private boolean flas;//超时判断结果
    

    public Date getEnteringTime() {
		return enteringTime;
	}

	public void setEnteringTime(Date enteringTime) {
		this.enteringTime = enteringTime;
	}

	public boolean isFlas() {
		return flas;
	}

	public void setFlas(boolean flas) {
		this.flas = flas;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public Integer getClassplansum_id() {
		return classplansum_id;
	}

	public void setClassplansum_id(Integer classplansum_id) {
		this.classplansum_id = classplansum_id;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public Integer getGreat_id() {
        return great_id;
    }

    public void setGreat_id(Integer great_id) {
        this.great_id = great_id;
    }

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public Integer getEmp_name_id() {
		return emp_name_id;
	}

	public void setEmp_name_id(Integer emp_name_id) {
		this.emp_name_id = emp_name_id;
	}
    
}