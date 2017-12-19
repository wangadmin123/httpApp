package cn.tyyhoa.pojo;

public class OaKfbGroup {
    private Integer id;

    private String groupname;

    private String module;

    private Integer stageid;
    private String gradename;
    
    private Integer gradestruts;

    public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public Integer getGradestruts() {
		return gradestruts;
	}

	public void setGradestruts(Integer gradestruts) {
		this.gradestruts = gradestruts;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module == null ? null : module.trim();
    }

    public Integer getStageid() {
        return stageid;
    }

    public void setStageid(Integer stageid) {
        this.stageid = stageid;
    }
}