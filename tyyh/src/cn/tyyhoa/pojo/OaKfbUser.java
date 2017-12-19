package cn.tyyhoa.pojo;

public class OaKfbUser {
    private Integer id;

    private String stu_id;//学号 对应stu_number

    private Integer groupid;

    private Integer jobid;
    
    private String groupname;
    
    private String jobname;
    
    private String stu_name;

    private String e_mail;
    
    private String contact_way;//联系方式

    private String wechat;//微信
    
    private String present_address;//现住址
    
    private Integer stu_age;
    
    private String appraise;
    
    private String stu_sex;
    
    private Integer sumscore;
    
    
    

    @Override
	public String toString() {
		return "OaKfbUser [id=" + id + ", stu_id=" + stu_id + ", groupid=" + groupid + ", jobid=" + jobid
				+ ", groupname=" + groupname + ", jobname=" + jobname + ", stu_name=" + stu_name + ", e_mail=" + e_mail
				+ ", contact_way=" + contact_way + ", wechat=" + wechat + ", present_address=" + present_address
				+ ", stu_age=" + stu_age + ", appraise=" + appraise + ", sumscore=" + sumscore + "]";
	}

    
    
	public String getStu_sex() {
		return stu_sex;
	}



	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}



	public String getAppraise() {
		return appraise;
	}

	public void setAppraise(String appraise) {
		this.appraise = appraise;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public String getContact_way() {
		return contact_way;
	}

	public void setContact_way(String contact_way) {
		this.contact_way = contact_way;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getPresent_address() {
		return present_address;
	}

	public void setPresent_address(String present_address) {
		this.present_address = present_address;
	}

	public Integer getStu_age() {
		return stu_age;
	}

	public void setStu_age(Integer stu_age) {
		this.stu_age = stu_age;
	}

	public Integer getSumscore() {
		return sumscore;
	}

	public void setSumscore(Integer sumscore) {
		this.sumscore = sumscore;
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

    public String getStu_id() {
        return stu_id;
    }

    public void setStu_id(String stu_id) {
        this.stu_id = stu_id == null ? null : stu_id.trim();
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }

    public Integer getJobid() {
        return jobid;
    }

    public void setJobid(Integer jobid) {
        this.jobid = jobid;
    }
}