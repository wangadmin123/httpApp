package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybWorkPlan {
    private Integer work_plan_id;//工作计划表主键

    private Integer work_plan_reportid;//负责人姓名

    private String work_plan_job_content;//计划工作内容

    private String work_plan_needhelp;//计划需要的帮助

    private Date work_plan_plantime;//计划时间

    private String work_plan_remarks;//备注

    public Integer getWork_plan_id() {
        return work_plan_id;
    }

    public void setWork_plan_id(Integer work_plan_id) {
        this.work_plan_id = work_plan_id;
    }

    public Integer getWork_plan_reportid() {
        return work_plan_reportid;
    }

    public void setWork_plan_reportid(Integer work_plan_reportid) {
        this.work_plan_reportid = work_plan_reportid;
    }

    public String getWork_plan_job_content() {
        return work_plan_job_content;
    }

    public void setWork_plan_job_content(String work_plan_job_content) {
        this.work_plan_job_content = work_plan_job_content == null ? null : work_plan_job_content.trim();
    }

    public String getWork_plan_needhelp() {
        return work_plan_needhelp;
    }

    public void setWork_plan_needhelp(String work_plan_needhelp) {
        this.work_plan_needhelp = work_plan_needhelp == null ? null : work_plan_needhelp.trim();
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
        this.work_plan_remarks = work_plan_remarks == null ? null : work_plan_remarks.trim();
    }
}