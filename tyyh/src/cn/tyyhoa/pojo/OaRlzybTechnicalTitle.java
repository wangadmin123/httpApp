package cn.tyyhoa.pojo;

public class OaRlzybTechnicalTitle {
    private Integer technical_title_id;//编号

    private String technical_title_path;//技术职称路径

    private Integer emp_id;//所属员工姓名

    public Integer getTechnical_title_id() {
        return technical_title_id;
    }

    public void setTechnical_title_id(Integer technical_title_id) {
        this.technical_title_id = technical_title_id;
    }

    public String getTechnical_title_path() {
        return technical_title_path;
    }

    public void setTechnical_title_path(String technical_title_path) {
        this.technical_title_path = technical_title_path == null ? null : technical_title_path.trim();
    }

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

}