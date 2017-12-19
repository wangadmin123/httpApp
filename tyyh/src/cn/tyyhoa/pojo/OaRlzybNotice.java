package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybNotice {
    private Integer id;//编号

    private Integer sendid;//发送人编号

    private Date fstime;//发送时间

    private String title;//通知标题

    private String content;//通知内容

    private Integer status;//通知状态
    private Integer notice_uid;//接收方编号
    private String user_name;//发送人姓名
    private Integer npid;
    
    
    private String name;
    
    private String position_name;
    
    
    
    
    
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Integer getNpid() {
		return npid;
	}

	public void setNpid(Integer npid) {
		this.npid = npid;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Integer getNotice_uid() {
		return notice_uid;
	}

	public void setNotice_uid(Integer notice_uid) {
		this.notice_uid = notice_uid;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSendid() {
        return sendid;
    }

    public void setSendid(Integer sendid) {
        this.sendid = sendid;
    }

    public Date getFstime() {
        return fstime;
    }

    public void setFstime(Date fstime) {
        this.fstime = fstime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}