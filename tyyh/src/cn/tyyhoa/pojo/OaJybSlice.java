package cn.tyyhoa.pojo;

public class OaJybSlice {
    private Integer slice_id;//学员分层主键

    private Integer slice_studentId;//姓名

    private String slice_type;//分层类型

    private String slice_quality;//综合素质

    private String slice_skill;//技术水平

    private String slice_remarks;//备注

    public Integer getSlice_id() {
        return slice_id;
    }

    public void setSlice_id(Integer slice_id) {
        this.slice_id = slice_id;
    }

    public Integer getSlice_studentId() {
        return slice_studentId;
    }

    public void setSlice_studentId(Integer slice_studentId) {
        this.slice_studentId = slice_studentId;
    }

    public String getSlice_type() {
        return slice_type;
    }

    public void setSlice_type(String slice_type) {
        this.slice_type = slice_type == null ? null : slice_type.trim();
    }

    public String getSlice_quality() {
        return slice_quality;
    }

    public void setSlice_quality(String slice_quality) {
        this.slice_quality = slice_quality == null ? null : slice_quality.trim();
    }

    public String getSlice_skill() {
        return slice_skill;
    }

    public void setSlice_skill(String slice_skill) {
        this.slice_skill = slice_skill == null ? null : slice_skill.trim();
    }

    public String getSlice_remarks() {
        return slice_remarks;
    }

    public void setSlice_remarks(String slice_remarks) {
        this.slice_remarks = slice_remarks == null ? null : slice_remarks.trim();
    }
}