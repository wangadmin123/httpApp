package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbStudent {
    private Integer stu_Id;//编号

    private String stu_number;//学号

    private String stu_name;//姓名

    private String spellName;//姓名拼音

    private String stu_sex;//性别

    private String ID_number;//身份证号

    private String birthday;//出生日期
    
    private Integer stu_age;//学员年龄

    private String e_mail;//学生邮箱

    private String photograph;//学员照片

    private String hobbys;//爱好特长

    private String postalcode;//邮政编码

    private String present_address;//现住址
    
    private Integer specialty_id;//专业ID

    private String specialty;//所学专业

    private String contact_way;//联系方式(学员手机号)

    private String wechat;//微信号

    private Integer education_id;//学历id(--)

    private String high_school;//高中/中专就读学校

    private String undergraduate_school;//本科就读学校

    private String work_experience;//工作经历

    private String learning_experience;//学习经历
    
    private String credentials;//持有证书
    
    private String training_experience;//培训经历

    private String intentional_City;//意向就业城市

    private String address;//通讯地址(家庭住址)

    private String dormitory_number;//宿舍编号(跑校则不填)

    private Integer infoSource_id;//信息来源id(--)

    private Integer paymentmethod_id;//缴费方式id(--)

    private String other_help;//其他说明(备注)

    private Integer membership_id;//成员关系id(--)

    private String memberName;//成员姓名

    private Date memberBirthday;//出生日期

    private Integer workcondition_id;//工作状态id(--)

    private String work_unit;//工作单位

    private String memberContact_way;//联系方式

    private Integer deleteStatus;//删除状态
    
    private Integer grade_id;//班级ID
    
    private Integer status_id;//学员状态
    
    private String grade_name;//班级名称
    
    private String stu_status;//学员状态
      
    private String education_name;//学历
    
    private String member_ship;//成员关系
    
    private String infoSource;//信息来源名称
    
    private String secondary_school;//大专院校
    
    private Date entry_date;//建档日期
    
    private Integer member_age;//成员年龄
    
    private String member_remarks;//备注

    private Integer uid;//开发部
    
    private String jobname;  //开发部

    private String banji; //就业部添加

    private String xueli; //就业部添加
    
    private String appraise;//评价
    
    private int consulter_id;//咨询师id

       public String getBanji() {
		return banji;
	}

	public void setBanji(String banji) {
		this.banji = banji;
	}

	public String getXueli() {
		return xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
    
    
    public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getJobname() {
		return jobname;
	}

	public void setJobname(String jobname) {
		this.jobname = jobname;
	}

	public Integer getStu_Id() {
        return stu_Id;
    }

    public void setStu_Id(Integer stu_Id) {
        this.stu_Id = stu_Id;
    }

    public String getStu_number() {
        return stu_number;
    }

    public void setStu_number(String stu_number) {
        this.stu_number = stu_number == null ? null : stu_number.trim();
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name == null ? null : stu_name.trim();
    }

    public String getSpellName() {
        return spellName;
    }

    public void setSpellName(String spellName) {
        this.spellName = spellName == null ? null : spellName.trim();
    }

    

    public String getStu_sex() {
		return stu_sex;
	}

	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}

	public String getID_number() {
        return ID_number;
    }

    public void setID_number(String ID_number) {
        this.ID_number = ID_number == null ? null : ID_number.trim();
    }

    public String getE_mail() {
        return e_mail;
    }

    public void setE_mail(String e_mail) {
        this.e_mail = e_mail == null ? null : e_mail.trim();
    }

    public String getPhotograph() {
        return photograph;
    }

    public void setPhotograph(String photograph) {
        this.photograph = photograph == null ? null : photograph.trim();
    }

    public String getHobbys() {
        return hobbys;
    }

    public void setHobbys(String hobbys) {
        this.hobbys = hobbys == null ? null : hobbys.trim();
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode == null ? null : postalcode.trim();
    }

    public String getPresent_address() {
        return present_address;
    }

    public void setPresent_address(String present_address) {
        this.present_address = present_address == null ? null : present_address.trim();
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty == null ? null : specialty.trim();
    }

    public String getContact_way() {
        return contact_way;
    }

    public void setContact_way(String contact_way) {
        this.contact_way = contact_way == null ? null : contact_way.trim();
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat == null ? null : wechat.trim();
    }

    public Integer getEducation_id() {
		return education_id;
	}

	public void setEducation_id(Integer education_id) {
		this.education_id = education_id;
	}

	public String getHigh_school() {
        return high_school;
    }

    public void setHigh_school(String high_school) {
        this.high_school = high_school == null ? null : high_school.trim();
    }

    public String getUndergraduate_school() {
        return undergraduate_school;
    }

    public void setUndergraduate_school(String undergraduate_school) {
        this.undergraduate_school = undergraduate_school == null ? null : undergraduate_school.trim();
    }

    public String getIntentional_City() {
        return intentional_City;
    }

    public void setIntentional_City(String intentional_City) {
        this.intentional_City = intentional_City == null ? null : intentional_City.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }



    public String getDormitory_number() {
		return dormitory_number;
	}

	public Integer getInfoSource_id() {
        return infoSource_id;
    }

    public void setInfoSource_id(Integer infoSource_id) {
        this.infoSource_id = infoSource_id;
    }

    public Integer getPaymentmethod_id() {
        return paymentmethod_id;
    }

    public void setPaymentmethod_id(Integer paymentmethod_id) {
        this.paymentmethod_id = paymentmethod_id;
    }

    public String getOther_help() {
        return other_help;
    }

    public void setOther_help(String other_help) {
        this.other_help = other_help == null ? null : other_help.trim();
    }

    public Integer getMembership_id() {
        return membership_id;
    }

    public void setMembership_id(Integer membership_id) {
        this.membership_id = membership_id;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName == null ? null : memberName.trim();
    }

    public Date getMemberBirthday() {
        return memberBirthday;
    }

    public void setMemberBirthday(Date memberBirthday) {
        this.memberBirthday = memberBirthday;
    }

    public Integer getWorkcondition_id() {
        return workcondition_id;
    }

    public void setWorkcondition_id(Integer workcondition_id) {
        this.workcondition_id = workcondition_id;
    }

    public String getWork_unit() {
        return work_unit;
    }

    public void setWork_unit(String work_unit) {
        this.work_unit = work_unit == null ? null : work_unit.trim();
    }

    public String getMemberContact_way() {
        return memberContact_way;
    }

    public void setMemberContact_way(String memberContact_way) {
        this.memberContact_way = memberContact_way == null ? null : memberContact_way.trim();
    }

    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }

	
	public Integer getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(Integer grade_id) {
		this.grade_id = grade_id;
	}

	public void setDormitory_number(String dormitory_number) {
		this.dormitory_number = dormitory_number;
	}

	public Integer getStatus_id() {
		return status_id;
	}

	public void setStatus_id(Integer status_id) {
		this.status_id = status_id;
	}

	public String getGrade_name() {
		return grade_name;
	}

	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}

	public String getStu_status() {
		return stu_status;
	}

	public void setStu_status(String stu_status) {
		this.stu_status = stu_status;
	}

	public String getEducation_name() {
		return education_name;
	}

	public void setEducation_name(String education_name) {
		this.education_name = education_name;
	}

	public String getMember_ship() {
		return member_ship;
	}

	public void setMember_ship(String member_ship) {
		this.member_ship = member_ship;
	}

	public String getInfoSource() {
		return infoSource;
	}

	public void setInfoSource(String infoSource) {
		this.infoSource = infoSource;
	}

	public String getSecondary_school() {
		return secondary_school;
	}

	public void setSecondary_school(String secondary_school) {
		this.secondary_school = secondary_school;
	}

	public Date getEntry_date() {
		return entry_date;
	}

	public void setEntry_date(Date entry_date) {
		this.entry_date = entry_date;
	}

	public Integer getSpecialty_id() {
		return specialty_id;
	}

	public void setSpecialty_id(Integer specialty_id) {
		this.specialty_id = specialty_id;
	}

	public Integer getStu_age() {
		return stu_age;
	}

	public void setStu_age(Integer stu_age) {
		this.stu_age = stu_age;
	}

	public String getWork_experience() {
		return work_experience;
	}

	public void setWork_experience(String work_experience) {
		this.work_experience = work_experience;
	}

	public String getLearning_experience() {
		return learning_experience;
	}

	public void setLearning_experience(String learning_experience) {
		this.learning_experience = learning_experience;
	}

	public Integer getMember_age() {
		return member_age;
	}

	public void setMember_age(Integer member_age) {
		this.member_age = member_age;
	}

	public String getCredentials() {
		return credentials;
	}

	public void setCredentials(String credentials) {
		this.credentials = credentials;
	}

	public String getTraining_experience() {
		return training_experience;
	}

	public void setTraining_experience(String training_experience) {
		this.training_experience = training_experience;
	}

	public String getMember_remarks() {
		return member_remarks;
	}

	public void setMember_remarks(String member_remarks) {
		this.member_remarks = member_remarks;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAppraise() {
		return appraise;
	}

	public void setAppraise(String appraise) {
		this.appraise = appraise;
	}

	public int getConsulter_id() {
		return consulter_id;
	}

	public void setConsulter_id(int consulter_id) {
		this.consulter_id = consulter_id;
	}
	
	
	
    
    
}