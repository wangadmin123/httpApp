package cn.tyyhoa.pojo;

public class OaRlzybNotifiedParty {
    private Integer id;//主键

    private Integer nid;//通知id
    private Integer status;//通知状态
    private Integer notice_uid;//被通知人id

    
    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public Integer getNotice_uid() {
        return notice_uid;
    }

    public void setNotice_uid(Integer notice_uid) {
        this.notice_uid = notice_uid;
    }
}