package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbOpenClass {
    private Integer id;//编号

    private String name;//姓名

    private Integer sex;//性别

    private Integer age;//年龄

    private Integer study_experience;//学历

    private String computer_horizontal;//计算机水平

    private String remarks;//备注

    private String city;//城市
    
   

	private Integer gradeId;//班级副id
    
    private Integer deleteStatus;//状态
    
    private String education;//学历
    
    private Date enteringTime;//录入时间
    
    
	public Date getEnteringTime() {
		return enteringTime;
	}
	public void setEnteringTime(Date enteringTime) {
		this.enteringTime = enteringTime;
	}
	public String getEducation() {
		return education;
	}
	 public Integer getStudy_experience() {
			return study_experience;
		}
	public void setEducation(String education) {
		this.education = education;
	}

	public Integer getGradeId() {
		return gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	

	public Integer getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public void setStudy_experience(Integer study_experience) {
		this.study_experience = study_experience;
	}

	public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

   
    public String getComputer_horizontal() {
        return computer_horizontal;
    }

    public void setComputer_horizontal(String computer_horizontal) {
        this.computer_horizontal = computer_horizontal == null ? null : computer_horizontal.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }
}