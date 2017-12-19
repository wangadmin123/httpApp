package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbProject {
    private Integer id;//项目答辩编号
    
    private String group_name;//小组名称
    
    private Integer  group_id;//小组id
    
    private Integer Student_id;//学员姓名

    private Double score;//个人得分

    private Double group_score;//小组得分

    private String group_expression;//小组表现

    private String remarks;//备注
    
    private Integer deleteStatus;//删除状态

    private String stu_name;//学生姓名
    
    private Date entering_time;//录入时间
    
    private Integer stage_id;//学期id
    
    private String stage;//班级阶段（学期）
    
    private boolean flas;
    
    
    
    
	public boolean isFlas() {
		return flas;
	}

	public void setFlas(boolean flas) {
		this.flas = flas;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public Integer getStage_id() {
		return stage_id;
	}

	public void setStage_id(Integer stage_id) {
		this.stage_id = stage_id;
	}

	public Date getEntering_time() {
		return entering_time;
	}

	public void setEntering_time(Date entering_time) {
		this.entering_time = entering_time;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public Integer getGroup_id() {
		return group_id;
	}

	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



 


	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	

    public Integer getStudent_id() {
		return Student_id;
	}

	public void setStudent_id(Integer student_id) {
		Student_id = student_id;
	}

	public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Double getGroup_score() {
        return group_score;
    }

    public void setGroup_score(Double group_score) {
        this.group_score = group_score;
    }

    public String getGroup_expression() {
        return group_expression;
    }

    public void setGroup_expression(String group_expression) {
        this.group_expression = group_expression == null ? null : group_expression.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

	public Integer getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

}