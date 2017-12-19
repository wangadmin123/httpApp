package cn.tyyhoa.pojo;

import java.util.Date;

public class OaKfbLeave {
    private Integer id;

    private Integer type;

    private Date startime;

    private Date endtime;

    private String reason;

    private Integer days;

    private Date time;

    private Integer user_id;

    private String phone;
    
    private String E_mail;
    
    private String groupname;

	private String stuname;
    
    private String stucontact_way;
    
    private String jobname;
    
    private Integer cid;
    
    public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "OaKfbLeave [id=" + id + ", type=" + type + ", reason=" + reason
				+ ", days=" + days + ", time=" + time + ", user_id=" + user_id
				+ ", phone=" + phone + "]";
	}
    
    public String getE_mail() {
		return E_mail;
	}

	public void setE_mail(String e_mail) {
		E_mail = e_mail;
	}
	
	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getJobname() {
		return jobname;
	}

	public void setJobname(String jobname) {
		this.jobname = jobname;
	}

	public String getStucontact_way() {
		return stucontact_way;
	}

	public void setStucontact_way(String stucontact_way) {
		this.stucontact_way = stucontact_way;
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




	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Date getStartime() {
        return startime;
    }

    public void setStartime(Date startime) {
        this.startime = startime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}