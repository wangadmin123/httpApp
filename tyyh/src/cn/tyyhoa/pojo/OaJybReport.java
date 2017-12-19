package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybReport {
    private Integer report_id;//报表主键

    private String report_people;//负责人
    
    private String report_type;//报表类型

    public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}

	private Integer report_pioneer_enterprise;//开拓企业

    private Integer report_maintenance_enterprise;//维护企业

    private Integer report_interview;//面试安排

    private Integer report_entrystu;//入职学员

    private Integer report_employment;//就业确认

    private Integer report_photo;//照片

    private Integer report_testimonials;//感言

    private Integer report_employment_statistics;//负责就业学员总人数书
    
    

    private Integer report_abandonstu;//放弃

    private Integer report_recommendstu;//正在推荐

    private Integer report_deferstu;//延迟

    private String report_entry_summary;//入职简介

    private String report_interview_summary;//面试简介

    private String report_otherjob;//其他工作

    private Date report_createtime;//创建时间
    
    private String work_plan_job_content;//计划工作内容

    private String work_plan_needhelp;//计划需要的帮助

    private Date work_plan_plantime;//计划时间

    private String work_plan_remarks;//备注
    
    private int teacterid;
    
    private int tablestruts;
    
    private String empname;
    

    public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public int getTeacterid() {
		return teacterid;
	}

	public void setTeacterid(int teacterid) {
		this.teacterid = teacterid;
	}

	public int getTablestruts() {
		return tablestruts;
	}

	public void setTablestruts(int tablestruts) {
		this.tablestruts = tablestruts;
	}

	public String getWork_plan_job_content() {
		return work_plan_job_content;
	}

	public void setWork_plan_job_content(String work_plan_job_content) {
		this.work_plan_job_content = work_plan_job_content;
	}

	public String getWork_plan_needhelp() {
		return work_plan_needhelp;
	}

	public void setWork_plan_needhelp(String work_plan_needhelp) {
		this.work_plan_needhelp = work_plan_needhelp;
	}

	public Date getWork_plan_plantime() {
		return work_plan_plantime;
	}

	public void setWork_plan_plantime(Date work_plan_plantime) {
		this.work_plan_plantime = work_plan_plantime;
	}

	public String getWork_plan_remarks() {
		return work_plan_remarks;
	}

	public void setWork_plan_remarks(String work_plan_remarks) {
		this.work_plan_remarks = work_plan_remarks;
	}

	public Integer getReport_id() {
        return report_id;
    }

    public void setReport_id(Integer report_id) {
        this.report_id = report_id;
    }

    public String getReport_people() {
        return report_people;
    }

    public void setReport_people(String report_people) {
        this.report_people = report_people == null ? null : report_people.trim();
    }

    public Integer getReport_pioneer_enterprise() {
        return report_pioneer_enterprise;
    }

    public void setReport_pioneer_enterprise(Integer report_pioneer_enterprise) {
        this.report_pioneer_enterprise = report_pioneer_enterprise;
    }

    public Integer getReport_maintenance_enterprise() {
        return report_maintenance_enterprise;
    }

    public void setReport_maintenance_enterprise(Integer report_maintenance_enterprise) {
        this.report_maintenance_enterprise = report_maintenance_enterprise;
    }

    public Integer getReport_interview() {
        return report_interview;
    }

    public void setReport_interview(Integer report_interview) {
        this.report_interview = report_interview;
    }

    public Integer getReport_entrystu() {
        return report_entrystu;
    }

    public void setReport_entrystu(Integer report_entrystu) {
        this.report_entrystu = report_entrystu;
    }

    public Integer getReport_employment() {
        return report_employment;
    }

    public void setReport_employment(Integer report_employment) {
        this.report_employment = report_employment;
    }

    public Integer getReport_photo() {
        return report_photo;
    }

    public void setReport_photo(Integer report_photo) {
        this.report_photo = report_photo;
    }

    public Integer getReport_testimonials() {
        return report_testimonials;
    }

    public void setReport_testimonials(Integer report_testimonials) {
        this.report_testimonials = report_testimonials;
    }

    public Integer getReport_employment_statistics() {
        return report_employment_statistics;
    }

    public void setReport_employment_statistics(Integer report_employment_statistics) {
        this.report_employment_statistics = report_employment_statistics;
    }

    public Integer getReport_abandonstu() {
        return report_abandonstu;
    }

    public void setReport_abandonstu(Integer report_abandonstu) {
        this.report_abandonstu = report_abandonstu;
    }

    public Integer getReport_recommendstu() {
        return report_recommendstu;
    }

    public void setReport_recommendstu(Integer report_recommendstu) {
        this.report_recommendstu = report_recommendstu;
    }

    public Integer getReport_deferstu() {
        return report_deferstu;
    }

    public void setReport_deferstu(Integer report_deferstu) {
        this.report_deferstu = report_deferstu;
    }

    public String getReport_entry_summary() {
        return report_entry_summary;
    }

    public void setReport_entry_summary(String report_entry_summary) {
        this.report_entry_summary = report_entry_summary == null ? null : report_entry_summary.trim();
    }

    public String getReport_interview_summary() {
        return report_interview_summary;
    }

    public void setReport_interview_summary(String report_interview_summary) {
        this.report_interview_summary = report_interview_summary == null ? null : report_interview_summary.trim();
    }

    public String getReport_otherjob() {
        return report_otherjob;
    }

    public void setReport_otherjob(String report_otherjob) {
        this.report_otherjob = report_otherjob == null ? null : report_otherjob.trim();
    }

    public Date getReport_createtime() {
        return report_createtime;
    }

    public void setReport_createtime(Date report_createtime) {
        this.report_createtime = report_createtime;
    }
}