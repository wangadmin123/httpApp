package cn.tyyhoa.pojo;

import java.util.Date;

public class OaScbVisit {
    private Integer id;//编号

    private Integer consultId;//咨询量编号
    
    private String consultName;//咨询量姓名

    private Date returnvisitTime;//本次回访时间
    
    private String returnvisitTimes;//本次回访时间String

    private String returnvisitRecord;//回访记录
    
    private String returnvisitPeopleName;//回访人(咨询师姓名)
    
	private String consultTeacherName;//当前负责咨询师名字  

    private Date nextvisitTime;//下次回访时间
    
    private String nextvisitTimes;//下次回访时间String
    private Integer status; //回访人身份 ID
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getConsultId() {
        return consultId;
    }

    public void setConsultId(Integer consultId) {
        this.consultId = consultId;
    }

    public Date getReturnvisitTime() {
        return returnvisitTime;
    }

    public void setReturnvisitTime(Date returnvisitTime) {
        this.returnvisitTime = returnvisitTime;
    }

    public String getReturnvisitRecord() {
        return returnvisitRecord;
    }

    public void setReturnvisitRecord(String returnvisitRecord) {
        this.returnvisitRecord = returnvisitRecord == null ? null : returnvisitRecord.trim();
    }

    public Date getNextvisitTime() {
        return nextvisitTime;
    }

    public void setNextvisitTime(Date nextvisitTime) {
        this.nextvisitTime = nextvisitTime;
    }

	
	public String getReturnvisitTimes() {
		return returnvisitTimes;
	}

	public void setReturnvisitTimes(String returnvisitTimes) {
		this.returnvisitTimes = returnvisitTimes;
	}

	public String getNextvisitTimes() {
		return nextvisitTimes;
	}

	public void setNextvisitTimes(String nextvisitTimes) {
		this.nextvisitTimes = nextvisitTimes;
	}

	public String getConsultName() {
		return consultName;
	}

	public void setConsultName(String consultName) {
		this.consultName = consultName;
	}

	public String getReturnvisitPeopleName() {
		return returnvisitPeopleName;
	}

	public void setReturnvisitPeopleName(String returnvisitPeopleName) {
		this.returnvisitPeopleName = returnvisitPeopleName;
	}

	public String getConsultTeacherName() {
		return consultTeacherName;
	}

	public void setConsultTeacherName(String consultTeacherName) {
		this.consultTeacherName = consultTeacherName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	

	
}