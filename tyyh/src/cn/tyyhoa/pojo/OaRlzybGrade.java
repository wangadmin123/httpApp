package cn.tyyhoa.pojo;

public class OaRlzybGrade {
    private Integer grade_id;//编号

    private String grade_name;//员工等级名称

    public Integer getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(Integer grade_id) {
        this.grade_id = grade_id;
    }

    public String getGrade_name() {
        return grade_name;
    }

    public void setGrade_name(String grade_name) {
        this.grade_name = grade_name == null ? null : grade_name.trim();
    }
}