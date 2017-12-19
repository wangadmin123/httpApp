package cn.tyyhoa.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OaKfbMetting {
    private Integer id;
    
    private Integer uid;
    private Integer  wid;
	private Integer groupid;

    private String usersname;

    private String leader;

    private Integer witer;
    @JsonFormat(pattern = "yyyy-MM-dd", locale = "zh", timezone = "GMT+8")
    private Date starttime;
    @JsonFormat(pattern = "yyyy-MM-dd", locale = "zh", timezone = "GMT+8")
    private Date endtime;

    private Integer type;

    private String content;
    
    private String groupname;
    private String   stu_name;
    
  
	
    public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	@Override
	public String toString() {
		return "OaKfbMetting [id=" + id + ", uid=" + uid + ", wid=" + wid + ", groupid=" + groupid + ", usersname="
				+ usersname + ", leader=" + leader + ", witer=" + witer + ", starttime=" + starttime + ", endtime="
				+ endtime + ", type=" + type + ", content=" + content + ", groupname=" + groupname + "]";
	}

	public Integer getWid() {
		return wid;
	}

	public void setWid(Integer wid) {
		this.wid = wid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }

    public String getUsersname() {
        return usersname;
    }

    public void setUsersname(String usersname) {
        this.usersname = usersname == null ? null : usersname.trim();
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader == null ? null : leader.trim();
    }



    public Integer getWiter() {
		return witer;
	}

	public void setWiter(Integer witer) {
		this.witer = witer;
	}

	public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type ;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}