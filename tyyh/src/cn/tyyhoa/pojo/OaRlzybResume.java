package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybResume {
    private Integer resume_id;//编号

    private Integer emp_id;//员工编号

    private Date resume_date;//复职日期

    private Integer resume_delectStatus;//删除状态

    public Integer getResume_id() {
        return resume_id;
    }

    public void setResume_id(Integer resume_id) {
        this.resume_id = resume_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public Date getResume_date() {
        return resume_date;
    }

    public void setResume_date(Date resume_date) {
        this.resume_date = resume_date;
    }

    public Integer getResume_delectStatus() {
        return resume_delectStatus;
    }

    public void setResume_delectStatus(Integer resume_delectStatus) {
        this.resume_delectStatus = resume_delectStatus;
    }
}