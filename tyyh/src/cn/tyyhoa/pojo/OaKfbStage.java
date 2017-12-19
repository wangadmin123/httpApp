package cn.tyyhoa.pojo;

public class OaKfbStage {
    private Integer id;

    private Integer did;
    private String stagename;

    public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStagename() {
        return stagename;
    }

    public void setStagename(String stagename) {
        this.stagename = stagename == null ? null : stagename.trim();
    }
}