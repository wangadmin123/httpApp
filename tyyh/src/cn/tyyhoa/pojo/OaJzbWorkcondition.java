package cn.tyyhoa.pojo;

public class OaJzbWorkcondition {
    private Integer workcondition_id;//编号

    private String workcondition_name;//工作状态名称

    public Integer getWorkcondition_id() {
        return workcondition_id;
    }

    public void setWorkcondition_id(Integer workcondition_id) {
        this.workcondition_id = workcondition_id;
    }

    public String getWorkcondition_name() {
        return workcondition_name;
    }

    public void setWorkcondition_name(String workcondition_name) {
        this.workcondition_name = workcondition_name == null ? null : workcondition_name.trim();
    }
}