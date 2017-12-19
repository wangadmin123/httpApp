package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJwbArrangement {
    private Integer id;//排课ID

    private Integer courseID;//课程名称

    private Integer sectionId;//课程进度

    private Integer gradeID;//班级ID

    private Integer teacherID;//教员编号

    private Integer classTeacherID;//班主任编号

    private Integer motorid;//机房ID

    private Date createTime;//创建时间

    private Date modifytime;//修改时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseID() {
        return courseID;
    }

    public void setCourseID(Integer courseID) {
        this.courseID = courseID;
    }

    public Integer getSectionId() {
        return sectionId;
    }

    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }

    public Integer getGradeID() {
        return gradeID;
    }

    public void setGradeID(Integer gradeID) {
        this.gradeID = gradeID;
    }

    public Integer getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(Integer teacherID) {
        this.teacherID = teacherID;
    }

    public Integer getClassTeacherID() {
        return classTeacherID;
    }

    public void setClassTeacherID(Integer classTeacherID) {
        this.classTeacherID = classTeacherID;
    }

    public Integer getMotorid() {
        return motorid;
    }

    public void setMotorid(Integer motorid) {
        this.motorid = motorid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifytime() {
        return modifytime;
    }

    public void setModifytime(Date modifytime) {
        this.modifytime = modifytime;
    }
}