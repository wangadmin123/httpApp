package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybTraining {
    private Integer training_id;//集训表主键

    private Integer training_studentId;//姓名

    private Integer training_score;//成绩

    private Date training_time;//时间

    public Integer getTraining_id() {
        return training_id;
    }

    public void setTraining_id(Integer training_id) {
        this.training_id = training_id;
    }

    public Integer getTraining_studentId() {
        return training_studentId;
    }

    public void setTraining_studentId(Integer training_studentId) {
        this.training_studentId = training_studentId;
    }

    public Integer getTraining_score() {
        return training_score;
    }

    public void setTraining_score(Integer training_score) {
        this.training_score = training_score;
    }

    public Date getTraining_time() {
        return training_time;
    }

    public void setTraining_time(Date training_time) {
        this.training_time = training_time;
    }
}