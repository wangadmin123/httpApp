package cn.tyyhoa.pojo;

public class OaJzbInterview {
    private Integer interview_id;//访谈方式ID

    private String interview;//访谈方式类型

    private Integer deleteStatus;//删除状态

    public Integer getInterview_id() {
        return interview_id;
    }

    public void setInterview_id(Integer interview_id) {
        this.interview_id = interview_id;
    }

    public String getInterview() {
        return interview;
    }

    public void setInterview(String interview) {
        this.interview = interview == null ? null : interview.trim();
    }

    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }
}