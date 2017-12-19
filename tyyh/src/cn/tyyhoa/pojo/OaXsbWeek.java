package cn.tyyhoa.pojo;

import java.util.Date;

public class OaXsbWeek {
    private Integer id;//记录ID

    private Integer stuID;//学生ID

    private Integer written;//笔试

    private Integer scjd;//机试

    private Integer gradeID;//班级ID

    private Date createTime;//创建时间

    private Date modifytime;//修改时间

	private String stu_name;//学生姓名
	
	private Integer a; //笔试+机试

	private String stu_number;//学生学号
	
	private Integer whatweek;//第几周
		
	public Integer getWhatweek() {
		return whatweek;
	}

	public void setWhatweek(Integer whatweek) {
		this.whatweek = whatweek;
	}

	public String getStu_number() {
		return stu_number;
	}

	public void setStu_number(String stu_number) {
		this.stu_number = stu_number;
	}

	public Integer getA() {
		return a;
	}

	public void setA(Integer a) {
		this.a = a;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStuID() {
		return stuID;
	}

	public void setStuID(Integer stuID) {
		this.stuID = stuID;
	}

	public Integer getWritten() {
        return written;
    }

    public void setWritten(Integer written) {
        this.written = written;
    }

    public Integer getScjd() {
        return scjd;
    }

    public void setScjd(Integer scjd) {
        this.scjd = scjd;
    }

    public Integer getGradeID() {
        return gradeID;
    }

    public void setGradeID(Integer gradeID) {
        this.gradeID = gradeID;
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