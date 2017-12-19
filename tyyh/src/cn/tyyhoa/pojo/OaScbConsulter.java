package cn.tyyhoa.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;


public class OaScbConsulter {
    private Integer id;//编号

    private String name;//名字

    private String phoneticize;//拼音简码

    private Integer age;//年龄

    private Integer sex;//性别

    private String province;//省

    private String city;//市

    private String district;//区，县

    private String wechat;//微信

    private String telphone1;//联系方式

    private String urgentTelpeople;//紧急联系人
    
    private String ungenTelphone;//练习方式2

    private String familyCondition;//家庭情况

    private String hobbies;//爱好

    private String specialSkill;//特长

    private Integer status;//状态

    private String schoolName;//院校

    private Integer education;//学历

    private String specialty;//专业

    private String schoolClass;//学校班级

    private String schoolJob;//学校职位

    private String schoolDorm;//学校宿舍

    private Integer type;//类型(0:全部，1:常规，2：市场)
    
    private String infoSource;//信息来源

    private String keywords;//关键词
  
    @JSONField(format="yyyy-MM-dd")
    private Date firstConsultTime;//首次咨询日期
    @JSONField(format="yyyy-MM-dd")
    private Date firstComeTime;//首次上门时间
    
    private String firstComeTimes;//首次上门日期

    private Integer come;//是否上门

    private Integer consultWay;//咨询方式

    private Integer mediaName;//媒体名称
    
    private String mediaNames;//媒体名称String

    private Integer allotstatus;//分配状态(1:已分量，2:未分量)

    private Integer rank;//等级

    private String rankName;//等级名称
    
    private Integer consultTeacher;//咨询师

    private String comments;//说明

    private Integer consultLesson;//咨询课程

    private Integer invalid;//是否有效(1:有效，2:无效，3:待审核)
    
    private String uselessCause;//无效原因

    private Integer enrollStatus;//报名状态(1:已报名，2:未报名)

    private Date enrollTime;//报名时间

    private Date declareTime;//申报时间

    private Integer payType;//缴费方式
    
    private String payTypeName;//缴费方式名称

    private Integer payStatus;//缴费状态
    
    private String payStatusName;//缴费状态名称

    private String payMoney;//缴费金额

    private Date payTime;//缴费时间
    
    private String payTimes;/*缴费时间String*/

    private Integer allotClass;//分配班级(1:已分配；2：未分配) 
    
    private Integer allotClassteacher;/*分配老师*/

    private Integer enlistLesson;//报选课程

    private Integer dorm;//宿舍

    private String insurance;//保险
    
    private String consultLessonName;//咨询课程名称
    
    private String educationName;//学历名称
    
    private String infoSourceName;//信息来源名称
     
    private String statusName;//状态名称
    
    private Integer identityStatus;//身份状态(1:咨询量，2:学生)
    
    private Integer declareStatus;//申报状态(1:已申报，2:未申报)
    
    private String firstConsultTimes;//首次咨询日期  
    @JSONField(format="yyyy-MM-dd")
    private Date returnvisitTime;//本次回访时间
    
   public Date getReturnvisitTime() {
		return returnvisitTime;
	}



	public void setReturnvisitTime(Date returnvisitTime) {
		this.returnvisitTime = returnvisitTime;
	}

private Date nextvisitTime; //预计回访时间 
   
   private Integer number; //重复数量
    
    public Integer getNumber() {
	return number;
}
   


public void setNumber(Integer number) {
	this.number = number;
}

	private String nextvisitTimes;//预计回访时间
    
    private String returnvisitTimes;//本次回访时间
    
    private String enrollTimes; //报名时间

	private String consultTeacherName;//咨询师名字   
    
    private String allotClassName;//分配班级名称  
    
    private String enlistLessonName;//报选课程名称
    
	private String consultwayName;//咨询方式名称
    
    private String declareTimes;//申报时间
    
    private Integer display;//是否显示（1:显示，2:不显示）
    
    private String place;//籍贯
    
    private Integer computer;//是否计算机专业（1:是，2:否）
    
    private String street;//街道
    
    private Integer infoStatus;//信息量状态（1:未提交，2:已提交）
    
    private Date allMoneyTime;//全款日期
    
	private String allMoneyTimes;//全款日期
	@JSONField(format="yyyy-MM-dd")
    private Date allotTime;//分量日期
    
    private String allotTimes;//分量日期
    
    private String returnvisitRecord;/*回访记录*/
    
    private String follow;//是否跟进
    
    private String educat;//学历
    
    private String sta;//状态（付款学员状态在读）
    
    private Integer educationId;
    
    private int gradeId;
    
    private String telphone2;	//联系方式2
    private String repetitionStatus; //是否是重复量
    private Integer intention; 	//意向评估
    
    
    public String getRepetitionStatus() {
		return repetitionStatus;
	}

	public void setRepetitionStatus(String repetitionStatus) {
		this.repetitionStatus = repetitionStatus;
	}

	public Integer getIntention() {
		return intention;
	}

	public void setIntention(Integer intention) {
		this.intention = intention;
	}

	public String getKbjsr() {
		return kbjsr;
	}

	public void setKbjsr(String kbjsr) {
		this.kbjsr = kbjsr;
	}

	private String kbjsr;		//口碑介绍人
    
	
    
    public String getTelphone2() {
		return telphone2;
	}

	public void setTelphone2(String telphone2) {
		this.telphone2 = telphone2;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public String getEducat() {
		return educat;
	}

	public void setEducat(String educat) {
		this.educat = educat;
	}

	public String getSta() {
		return sta;
	}

	public void setSta(String sta) {
		this.sta = sta;
	}

	public Integer getEducationId() {
		return educationId;
	}

	public void setEducationId(Integer educationId) {
		this.educationId = educationId;
	}

	public Date getNextvisitTime() {
		return nextvisitTime;
	}

	public void setNextvisitTime(Date nextvisitTime) {
		this.nextvisitTime = nextvisitTime;
	}

	public Integer getDisplay() {
		return display;
	}

	public void setDisplay(Integer display) {
		this.display = display;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Integer getComputer() {
		return computer;
	}

	public void setComputer(Integer computer) {
		this.computer = computer;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public Integer getInfoStatus() {
		return infoStatus;
	}

	public void setInfoStatus(Integer infoStatus) {
		this.infoStatus = infoStatus;
	}

	public Date getAllMoneyTime() {
		return allMoneyTime;
	}

	public void setAllMoneyTime(Date allMoneyTime) {
		this.allMoneyTime = allMoneyTime;
	}

	public String getAllMoneyTimes() {
		return allMoneyTimes;
	}

	public void setAllMoneyTimes(String allMoneyTimes) {
		this.allMoneyTimes = allMoneyTimes;
	}

	public String getAllotTimes() {
		return allotTimes;
	}

	public void setAllotTimes(String allotTimes) {
		this.allotTimes = allotTimes;
	}
	
    public String getNextvisitTimes() {
		return nextvisitTimes;
	}

	public void setNextvisitTimes(String nextvisitTimes) {
		this.nextvisitTimes = nextvisitTimes;
	}

	public String getEnrollTimes() {
		return enrollTimes;
	}

	public void setEnrollTimes(String enrollTimes) {
		this.enrollTimes = enrollTimes;
	}
    
    public String getDeclareTimes() {
		return declareTimes;
	}

	public void setDeclareTimes(String declareTimes) {
		this.declareTimes = declareTimes;
	}

	public String getFirstConsultTimes() {
		return firstConsultTimes;
	}

	public void setFirstConsultTimes(String firstConsultTimes) {
		this.firstConsultTimes = firstConsultTimes;
	}

	public String getConsultTeacherName() {
		return consultTeacherName;
	}

	public void setConsultTeacherName(String consultTeacherName) {
		this.consultTeacherName = consultTeacherName;
	}

	public String getAllotClassName() {
		return allotClassName;
	}

	public void setAllotClassName(String allotClassName) {
		this.allotClassName = allotClassName;
	}

	public String getEnlistLessonName() {
		return enlistLessonName;
	}

	public void setEnlistLessonName(String enlistLessonName) {
		this.enlistLessonName = enlistLessonName;
	}

    public Integer getIdentityStatus() {
		return identityStatus;
	}
    
    public Integer getDeclareStatus() {
		return declareStatus;
	}

	public void setDeclareStatus(Integer declareStatus) {
		this.declareStatus = declareStatus;
	}

	public void setIdentityStatus(Integer identityStatus) {
		this.identityStatus = identityStatus;
	}

    public Date getAllotTime() {
		return allotTime;
	}

	public void setAllotTime(Date allotTime) {
		this.allotTime = allotTime;
	}
    
    public String getConsultLessonName() {
		return consultLessonName;
	}

	public void setConsultLessonName(String consultLessonName) {
		this.consultLessonName = consultLessonName;
	}

	public String getEducationName() {
		return educationName;
	}

	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}

	public String getInfoSourceName() {
		return infoSourceName;
	}

	public void setInfoSourceName(String infoSourceName) {
		this.infoSourceName = infoSourceName;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getConsultwayName() {
		return consultwayName;
	}

	public void setConsultwayName(String consultwayName) {
		this.consultwayName = consultwayName;
	}

	public String getUngenTelphone() {
		return ungenTelphone;
	}

	public void setUngenTelphone(String ungenTelphone) {
		this.ungenTelphone = ungenTelphone;
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhoneticize() {
        return phoneticize;
    }

    public void setPhoneticize(String phoneticize) {
        this.phoneticize = phoneticize == null ? null : phoneticize.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat == null ? null : wechat.trim();
    }

    public String getTelphone1() {
        return telphone1;
    }

    public void setTelphone1(String telphone1) {
        this.telphone1 = telphone1 == null ? null : telphone1.trim();
    }

    public String getUrgentTelpeople() {
        return urgentTelpeople;
    }

    public void setUrgentTelpeople(String urgentTelpeople) {
        this.urgentTelpeople = urgentTelpeople == null ? null : urgentTelpeople.trim();
    }

    public String getFamilyCondition() {
        return familyCondition;
    }

    public void setFamilyCondition(String familyCondition) {
        this.familyCondition = familyCondition == null ? null : familyCondition.trim();
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies == null ? null : hobbies.trim();
    }

    public String getSpecialSkill() {
        return specialSkill;
    }

    public void setSpecialSkill(String specialSkill) {
        this.specialSkill = specialSkill == null ? null : specialSkill.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName == null ? null : schoolName.trim();
    }

    public Integer getEducation() {
        return education;
    }

    public void setEducation(Integer education) {
        this.education = education;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty == null ? null : specialty.trim();
    }

    public String getSchoolClass() {
        return schoolClass;
    }

    public void setSchoolClass(String schoolClass) {
        this.schoolClass = schoolClass == null ? null : schoolClass.trim();
    }

    public String getSchoolJob() {
        return schoolJob;
    }

    public void setSchoolJob(String schoolJob) {
        this.schoolJob = schoolJob == null ? null : schoolJob.trim();
    }

    public String getSchoolDorm() {
        return schoolDorm;
    }

    public void setSchoolDorm(String schoolDorm) {
        this.schoolDorm = schoolDorm == null ? null : schoolDorm.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    
    public String getInfoSource() {
		return infoSource;
	}

	public void setInfoSource(String infoSource) {
		this.infoSource = infoSource;
	}

	public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public Date getFirstConsultTime() {
        return firstConsultTime;
    }

    public void setFirstConsultTime(Date firstConsultTime) {
        this.firstConsultTime = firstConsultTime;
    }

    public Date getFirstComeTime() {
        return firstComeTime;
    }

    public void setFirstComeTime(Date firstComeTime) {
        this.firstComeTime = firstComeTime;
    }

    public Integer getCome() {
        return come;
    }

    public void setCome(Integer come) {
        this.come = come;
    }

    public Integer getConsultWay() {
        return consultWay;
    }

    public void setConsultWay(Integer consultWay) {
        this.consultWay = consultWay;
    }

    public Integer getMediaName() {
        return mediaName;
    }

    public void setMediaName(Integer mediaName) {
        this.mediaName = mediaName;
    }

    public Integer getAllotstatus() {
        return allotstatus;
    }

    public void setAllotstatus(Integer allotstatus) {
        this.allotstatus = allotstatus;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getConsultTeacher() {
        return consultTeacher;
    }

    public void setConsultTeacher(Integer consultTeacher) {
        this.consultTeacher = consultTeacher;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments == null ? null : comments.trim();
    }

    public Integer getConsultLesson() {
        return consultLesson;
    }

    public void setConsultLesson(Integer consultLesson) {
        this.consultLesson = consultLesson;
    }

    public Integer getInvalid() {
        return invalid;
    }

    public void setInvalid(Integer invalid) {
        this.invalid = invalid;
    }

    public String getUselessCause() {
        return uselessCause;
    }

    public void setUselessCause(String uselessCause) {
        this.uselessCause = uselessCause == null ? null : uselessCause.trim();
    }

    public Integer getEnrollStatus() {
        return enrollStatus;
    }

    public void setEnrollStatus(Integer enrollStatus) {
        this.enrollStatus = enrollStatus;
    }

    public Date getEnrollTime() {
        return enrollTime;
    }

    public void setEnrollTime(Date enrollTime) {
        this.enrollTime = enrollTime;
    }

    public Date getDeclareTime() {
        return declareTime;
    }

    public void setDeclareTime(Date declareTime) {
        this.declareTime = declareTime;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Integer getPayStatus(){
		return payStatus;
	}

	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}

	public String getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(String payMoney) {
        this.payMoney = payMoney == null ? null : payMoney.trim();
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Integer getAllotClass() {
        return allotClass;
    }

    public void setAllotClass(Integer allotClass) {
        this.allotClass = allotClass;
    }

    public Integer getEnlistLesson() {
        return enlistLesson;
    }

    public void setEnlistLesson(Integer enlistLesson) {
        this.enlistLesson = enlistLesson;
    }

    public Integer getDorm() {
        return dorm;
    }

    public void setDorm(Integer dorm) {
        this.dorm = dorm;
    }

    public String getInsurance() {
        return insurance;
    }

    public void setInsurance(String insurance) {
        this.insurance = insurance == null ? null : insurance.trim();
    }

	public String getFirstComeTimes() {
		return firstComeTimes;
	}

	public void setFirstComeTimes(String firstComeTimes) {
		this.firstComeTimes = firstComeTimes;
	}

	public String getReturnvisitTimes() {
		return returnvisitTimes;
	}

	public void setReturnvisitTimes(String returnvisitTimes) {
		
		this.returnvisitTimes = returnvisitTimes;
	}

	public String getPayTypeName() {
		return payTypeName;
	}

	public void setPayTypeName(String payTypeName) {
		this.payTypeName = payTypeName;
	}

	public String getPayStatusName() {
		return payStatusName;
	}

	public void setPayStatusName(String payStatusName) {
		this.payStatusName = payStatusName;
	}

	public Integer getAllotClassteacher() {
		return allotClassteacher;
	}

	public void setAllotClassteacher(Integer allotClassteacher) {
		this.allotClassteacher = allotClassteacher;
	}

	public String getPayTimes() {
		return payTimes;
	}

	public void setPayTimes(String payTimes) {
		this.payTimes = payTimes;
	}

	public String getMediaNames() {
		return mediaNames;
	}

	public void setMediaNames(String mediaNames) {
		this.mediaNames = mediaNames;
	}

	public String getReturnvisitRecord() {
		return returnvisitRecord;
	}

	public void setReturnvisitRecord(String returnvisitRecord) {
		this.returnvisitRecord = returnvisitRecord;
	}

	public String getFollow() {
		return follow;
	}

	public void setFollow(String follow) {
		this.follow = follow;
	}

	
    
	
}