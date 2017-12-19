package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybVisit {
    private Integer visit_id;//回访记录主键

    private Integer visit_studentId;//姓名

    private String visit_phone;//联系电话

    private String visit_way;//回访方式

    private String visit_content;//回访记录

    private Date visit_createtime;//回访时间
    
    private String studentname;
    
    private String gradename;   
    
    private String xianshishijian;//显示时间STRING

    public String getXianshishijian() {
		return xianshishijian;
	}

	public void setXianshishijian(String xianshishijian) {
		this.xianshishijian = xianshishijian;
	}

	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public Integer getVisit_id() {
        return visit_id;
    }

    public void setVisit_id(Integer visit_id) {
        this.visit_id = visit_id;
    }

    public Integer getVisit_studentId() {
        return visit_studentId;
    }

    public void setVisit_studentId(Integer visit_studentId) {
        this.visit_studentId = visit_studentId;
    }

    public String getVisit_phone() {
        return visit_phone;
    }

    public void setVisit_phone(String visit_phone) {
        this.visit_phone = visit_phone == null ? null : visit_phone.trim();
    }

    public String getVisit_way() {
        return visit_way;
    }

    public void setVisit_way(String visit_way) {
        this.visit_way = visit_way == null ? null : visit_way.trim();
    }

    public String getVisit_content() {
        return visit_content;
    }

    public void setVisit_content(String visit_content) {
        this.visit_content = visit_content == null ? null : visit_content.trim();
    }

    public Date getVisit_createtime() {
        return visit_createtime;
    }

    public void setVisit_createtime(Date visit_createtime) {
        this.visit_createtime = visit_createtime;
    }
}