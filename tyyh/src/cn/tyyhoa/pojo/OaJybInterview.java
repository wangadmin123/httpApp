package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybInterview {
    private Integer interview_id;//面试表主键

    private String interview_centrality;//中心编号

    private String interview_activity_theme;//活动主题

    private String interview_constitutor;//组织者

    private String interview_class;//班级

    private Date interview_time;//面试日期

    private String interview_staff;//面试人员
    
    private Integer mianshibiao_id;//对应的学生

    public Integer getMianshibiao_id() {
		return mianshibiao_id;
	}

	public void setMianshibiao_id(Integer mianshibiao_id) {
		this.mianshibiao_id = mianshibiao_id;
	}

	public Integer getInterview_id() {
        return interview_id;
    }

    public void setInterview_id(Integer interview_id) {
        this.interview_id = interview_id;
    }

    public String getInterview_centrality() {
        return interview_centrality;
    }

    public void setInterview_centrality(String interview_centrality) {
        this.interview_centrality = interview_centrality == null ? null : interview_centrality.trim();
    }

    public String getInterview_activity_theme() {
        return interview_activity_theme;
    }

    public void setInterview_activity_theme(String interview_activity_theme) {
        this.interview_activity_theme = interview_activity_theme == null ? null : interview_activity_theme.trim();
    }

    public String getInterview_constitutor() {
        return interview_constitutor;
    }

    public void setInterview_constitutor(String interview_constitutor) {
        this.interview_constitutor = interview_constitutor == null ? null : interview_constitutor.trim();
    }

    public String getInterview_class() {
        return interview_class;
    }

    public void setInterview_class(String interview_class) {
        this.interview_class = interview_class == null ? null : interview_class.trim();
    }

    public Date getInterview_time() {
        return interview_time;
    }

    public void setInterview_time(Date interview_time) {
        this.interview_time = interview_time;
    }

    public String getInterview_staff() {
        return interview_staff;
    }

    public void setInterview_staff(String interview_staff) {
        this.interview_staff = interview_staff == null ? null : interview_staff.trim();
    }
}