package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbPraise {
    private Integer id;//编号

    private String consultant_name;//咨询者姓名

    private Integer consultant_age;//年龄

    private String sex;//性别

    private Integer status;//就业状态id（一）

    private String contact_way;//联系方式

    private String contacts;//紧急联系人方式

    private Integer consultant_id;//所属咨询师ID(查询、外键)

    private Integer Record_id;//学历ID（一咨询）

    private String Consultant_remarks;//咨询者备注

    private Integer sponsor_id;//介绍人ID

    private String name;//姓名

    private String phone;//介绍人联系方式

    private Integer gradeId;//所在班级

    private Integer Teacher_id;//班主任ID（一）

    private String Consultant_nexus;//和咨询者关系

    private Date Register_time;//登记时间

    private String Sponsor_remark;//介绍人备注
    
    private int payStauts;//缴费编号
    
    private String payType;//缴费类型
    
    private String education;//学历名称
    
    private int sponsorcounselor;//介绍人所属咨询师
    
    private String emp_name;//所属咨询师姓名
    
    private String workcondition_name;//工作状态名称
    
    private String teachername;//班主任姓名
    
    private Integer emp_department;//所属部门
    
    private String gradeName;
    
    public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public Integer getEmp_department() {
		return emp_department;
	}

	public void setEmp_department(Integer emp_department) {
		this.emp_department = emp_department;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getWorkcondition_name() {
		return workcondition_name;
	}

	public void setWorkcondition_name(String workcondition_name) {
		this.workcondition_name = workcondition_name;
	}



	public int getSponsorcounselor() {
		return sponsorcounselor;
	}

	public void setSponsorcounselor(int sponsorcounselor) {
		this.sponsorcounselor = sponsorcounselor;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public int getPayStauts() {
		return payStauts;
	}

	public void setPayStauts(int payStauts) {
		this.payStauts = payStauts;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConsultant_name() {
        return consultant_name;
    }

    public void setConsultant_name(String consultant_name) {
        this.consultant_name = consultant_name == null ? null : consultant_name.trim();
    }

    public Integer getConsultant_age() {
        return consultant_age;
    }

    public void setConsultant_age(Integer consultant_age) {
        this.consultant_age = consultant_age;
    }

   

    public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getContact_way() {
        return contact_way;
    }

    public void setContact_way(String contact_way) {
        this.contact_way = contact_way == null ? null : contact_way.trim();
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
    }

    public Integer getConsultant_id() {
        return consultant_id;
    }

    public void setConsultant_id(Integer consultant_id) {
        this.consultant_id = consultant_id;
    }

    

    public Integer getRecord_id() {
		return Record_id;
	}

	public void setRecord_id(Integer record_id) {
		Record_id = record_id;
	}

	

    public String getConsultant_remarks() {
		return Consultant_remarks;
	}

	public void setConsultant_remarks(String consultant_remarks) {
		Consultant_remarks = consultant_remarks;
	}

	public Integer getSponsor_id() {
        return sponsor_id;
    }

    public void setSponsor_id(Integer sponsor_id) {
        this.sponsor_id = sponsor_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
    
    public Integer getGradeId() {
		return gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public Integer getTeacher_id() {
		return Teacher_id;
	}

	public void setTeacher_id(Integer teacher_id) {
		Teacher_id = teacher_id;
	}

    public String getConsultant_nexus() {
		return Consultant_nexus;
	}

	public void setConsultant_nexus(String consultant_nexus) {
		Consultant_nexus = consultant_nexus;
	}

	

    public Date getRegister_time() {
		return Register_time;
	}

	public void setRegister_time(Date register_time) {
		Register_time = register_time;
	}

	public String getSponsor_remark() {
		return Sponsor_remark;
	}

	public void setSponsor_remark(String sponsor_remark) {
		Sponsor_remark = sponsor_remark;
	}

	
}