package cn.tyyhoa.pojo;

import java.util.Date;

public class OaScbSchoolinfo {
    private Integer id;

    private String schoolName;

    private String schoolAddress;

    private String schoolTimePlan;

    private String opptSituation;

    private String schoolsSchedule;

    private String pushingSchedule;

    private String studentsSituation;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName == null ? null : schoolName.trim();
    }

    public String getSchoolAddress() {
        return schoolAddress;
    }

    public void setSchoolAddress(String schoolAddress) {
        this.schoolAddress = schoolAddress == null ? null : schoolAddress.trim();
    }

    public String getSchoolTimePlan() {
        return schoolTimePlan;
    }

    public void setSchoolTimePlan(String schoolTimePlan) {
        this.schoolTimePlan = schoolTimePlan;
    }

    public String getOpptSituation() {
        return opptSituation;
    }

    public void setOpptSituation(String opptSituation) {
        this.opptSituation = opptSituation == null ? null : opptSituation.trim();
    }

    public String getSchoolsSchedule() {
        return schoolsSchedule;
    }

    public void setSchoolsSchedule(String schoolsSchedule) {
        this.schoolsSchedule = schoolsSchedule == null ? null : schoolsSchedule.trim();
    }

    public String getPushingSchedule() {
        return pushingSchedule;
    }

    public void setPushingSchedule(String pushingSchedule) {
        this.pushingSchedule = pushingSchedule == null ? null : pushingSchedule.trim();
    }

    public String getStudentsSituation() {
        return studentsSituation;
    }

    public void setStudentsSituation(String studentsSituation) {
        this.studentsSituation = studentsSituation == null ? null : studentsSituation.trim();
    }
}