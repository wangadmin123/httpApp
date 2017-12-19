package cn.tyyhoa.pojo;

import java.util.Date;

public class OakfbScore {
    private Integer id;

    private Integer user_id;

    private Integer score;

    private String remark;

    private Date time;

    private Date clocktime;

    private Integer clockstatus;

    private Date outtiam;

    private Integer outstatus;

    private Integer operationid;
    
    
    private String stuname;
    
    private Integer sumscore;
    
    public Integer getSumscore() {
		return sumscore;
	}

	public void setSumscore(Integer sumscore) {
		this.sumscore = sumscore;
	}

	@Override
	public String toString() {
		return "OakfbScore [id=" + id + ", user_id=" + user_id + ", score="
				+ score + ", remark=" + remark + ", time=" + time
				+ ", clocktime=" + clocktime + ", clockstatus=" + clockstatus
				+ ", outtiam=" + outtiam + ", outstatus=" + outstatus
				+ ", operationid=" + operationid + ", stuname=" + stuname + "]";
	}

	public String getStuname() {
		return stuname;
	}

	public void setStuname(String stuname) {
		this.stuname = stuname;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getClocktime() {
        return clocktime;
    }

    public void setClocktime(Date clocktime) {
        this.clocktime = clocktime;
    }

    public Integer getClockstatus() {
        return clockstatus;
    }

    public void setClockstatus(Integer clockstatus) {
        this.clockstatus = clockstatus;
    }

    public Date getOuttiam() {
        return outtiam;
    }

    public void setOuttiam(Date outtiam) {
        this.outtiam = outtiam;
    }

    public Integer getOutstatus() {
        return outstatus;
    }

    public void setOutstatus(Integer outstatus) {
        this.outstatus = outstatus;
    }

    public Integer getOperationid() {
        return operationid;
    }

    public void setOperationid(Integer operationid) {
        this.operationid = operationid;
    }
}