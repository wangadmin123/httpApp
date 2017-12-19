package cn.tyyhoa.pojo;

import java.util.Date;

public class OaKfbProject {
    private Integer id;

    private Integer user_id;

    private Date startime;

    private Date endtime;

    private Integer isfinish;

    private Integer iswork;

    private Date finallytime;

    private String remark;

    private Integer stageid;

    private String content;
    
    private String stagename;
    
    private String username;
    
    private String module;
    private String groupname;
    
    private Integer groupid;
    
    private Integer eid;
    
    private String jobname;//职位名称
    
    private Date createtime;
    
    private boolean overstruts;
    
    
   

	public boolean isOverstruts() {
		return overstruts;
	}

	public void setOverstruts(boolean overstruts) {
		this.overstruts = overstruts;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getJobname() {
		return jobname;
	}

	public void setJobname(String jobname) {
		this.jobname = jobname;
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getStagename() {
		return stagename;
	}

	public void setStagename(String stagename) {
		this.stagename = stagename;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

    public Integer getIsfinish() {
        return isfinish;
    }

    public void setIsfinish(Integer isfinish) {
        this.isfinish = isfinish;
    }

    public Integer getIswork() {
        return iswork;
    }

    public void setIswork(Integer iswork) {
        this.iswork = iswork;
    }

    public Date getFinallytime() {
        return finallytime;
    }

    public void setFinallytime(Date finallytime) {
        this.finallytime = finallytime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getStageid() {
        return stageid;
    }

    public void setStageid(Integer stageid) {
        this.stageid = stageid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}