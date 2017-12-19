package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybEmployee {
    private Integer emp_id;//员工编号

    private String emp_name;//姓名

    private String emp_idcard;//身份证号
    
    private String a_emp_idcard;//身份证号副本

    private String emp_name_simple;//姓名简写

    private String emp_phone;//手机号码

    private String emp_political_status;//政治面貌

    private String emp_sex;//性别

    private String emp_marital_status;//婚姻状况

    private String nation_name;//民族

    private String emp_Email;//邮箱

    private String emp_hobby;//爱好特长

    private Integer emp_province;//籍贯省

    private Integer emp_city;//市

    private Integer emp_county;//区/县

    private String emp_address;//家庭住址

    private String emp_contact_name;//紧急联系人姓名

    private String emp_contact_phone;//紧急联系人电话

    private String emp_contact_relationship;//与本人关系

    private String emp_contact_address;//紧急联系人家庭住址

    private String emp_Employment_nature;//用工性质

    private String emp_photo_path;//照片路径

    private Date emp_Entry_date;//入职日期

    private Date emp_tryout_end_date;//试用结束日期

    private String emp_now_status;//目前状态

    private String emp_technical_title_name;//技术职称

    private Integer emp_grade_id;//员工等级

    private Integer emp_registrant;//登记人

    private String emp_salary_cardnumber;//工资卡号

    private String emp_medical_insurance_cardnumber;//医保卡号

    private String emp_endowment_insurance_cardnumber;//养老保险卡号

    private String emp_idcard_front;//身份证正面

    private String emp_idcard_reverse;//身份证反面

    private String emp_Degree_certificate;//学位证

    private String emp_Education_certificate;//学历证

    private String emp_technical_title_path;//技术职称

    private String emp_Education_experience;//教育经历

    private String emp_work_experience;//工作经历

    private String emp_train_experience;//培训经历

    private String emp_society_relation;//社会关系

    private String emp_remarks;//备注

    private String emp_delectStatus;//删除状态

    private Integer emp_department;//部门编号

    private Integer emp_position;//职位编号

    private String emp_educational_background;//学历

    private Integer emp_age;//年龄

    private Date emp_birthday;//出生日期
    
private String emp_position_name;//职位名称
    
private String emp_department_name; //部门名称 
    
    
    

    private String emp_origin_detail;//籍贯补充内容

    private String emp_now_province;//现住址省

    private String emp_now_city;//现住址市

    private String emp_now_county;//现住址县

    private String emp_now_detail;//现住址补充内容

    private String emp_contact_address_province;//紧急联系人现住址省

    private String emp_contact_address_city;//紧急联系人现住址市

    private String emp_contact_address_county;//紧急联系人现住址县

    private String emp_contact_address_detail;//紧急联系人现住址补充内容

    private String save_model;
    
    private Date create_time;
    
    
    
    
    
    
    
    public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	private Integer contract_num;
    private String depart_name;
    private String position_name;
    private Integer contract_id;
    private String contract_status;
    private String contract_belong_company;
    private String contract_startDate;
    private String contract_endDate;
    
    
    
    
   /* du*/
private String emp_Entry_date_str;
private String  emp_tryout_end_date_str;   
    
    
    /* du*/
    
    
    

	public Integer getContract_num() {
		return contract_num;
	}

	public String getA_emp_idcard() {
		return a_emp_idcard;
	}

	public void setA_emp_idcard(String a_emp_idcard) {
		this.a_emp_idcard = a_emp_idcard;
	}

	public String getEmp_Entry_date_str() {
		return emp_Entry_date_str;
	}

	public void setEmp_Entry_date_str(String emp_Entry_date_str) {
		this.emp_Entry_date_str = emp_Entry_date_str;
	}

	public String getEmp_tryout_end_date_str() {
		return emp_tryout_end_date_str;
	}

	public void setEmp_tryout_end_date_str(String emp_tryout_end_date_str) {
		this.emp_tryout_end_date_str = emp_tryout_end_date_str;
	}

	public void setContract_num(Integer contract_num) {
		this.contract_num = contract_num;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Integer getContract_id() {
		return contract_id;
	}

	public void setContract_id(Integer contract_id) {
		this.contract_id = contract_id;
	}

	public String getContract_status() {
		return contract_status;
	}

	public void setContract_status(String contract_status) {
		this.contract_status = contract_status;
	}

	public String getContract_belong_company() {
		return contract_belong_company;
	}

	public void setContract_belong_company(String contract_belong_company) {
		this.contract_belong_company = contract_belong_company;
	}

	public String getContract_startDate() {
		return contract_startDate;
	}

	public void setContract_startDate(String contract_startDate) {
		this.contract_startDate = contract_startDate;
	}

	public String getContract_endDate() {
		return contract_endDate;
	}

	public void setContract_endDate(String contract_endDate) {
		this.contract_endDate = contract_endDate;
	}

	public String getSave_model() {
		return save_model;
	}

	public void setSave_model(String save_model) {
		this.save_model = save_model;
	}

	public String getEmp_position_name() {
		return emp_position_name;
	}

	public void setEmp_position_name(String emp_position_name) {
		this.emp_position_name = emp_position_name;
	}

	public String getEmp_department_name() {
		return emp_department_name;
	}

	public void setEmp_department_name(String emp_department_name) {
		this.emp_department_name = emp_department_name;
	}

	public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name == null ? null : emp_name.trim();
    }

    public String getEmp_idcard() {
        return emp_idcard;
    }

    public void setEmp_idcard(String emp_idcard) {
        this.emp_idcard = emp_idcard == null ? null : emp_idcard.trim();
    }

    public String getEmp_name_simple() {
        return emp_name_simple;
    }

    public void setEmp_name_simple(String emp_name_simple) {
        this.emp_name_simple = emp_name_simple == null ? null : emp_name_simple.trim();
    }

    public String getEmp_phone() {
        return emp_phone;
    }

    public void setEmp_phone(String emp_phone) {
        this.emp_phone = emp_phone == null ? null : emp_phone.trim();
    }

    public String getEmp_political_status() {
        return emp_political_status;
    }

    public void setEmp_political_status(String emp_political_status) {
        this.emp_political_status = emp_political_status == null ? null : emp_political_status.trim();
    }

    public String getEmp_sex() {
        return emp_sex;
    }

    public void setEmp_sex(String emp_sex) {
        this.emp_sex = emp_sex == null ? null : emp_sex.trim();
    }

    public String getEmp_marital_status() {
        return emp_marital_status;
    }

    public void setEmp_marital_status(String emp_marital_status) {
        this.emp_marital_status = emp_marital_status == null ? null : emp_marital_status.trim();
    }

    public String getNation_name() {
        return nation_name;
    }

    public void setNation_name(String nation_name) {
        this.nation_name = nation_name == null ? null : nation_name.trim();
    }

    public String getEmp_Email() {
        return emp_Email;
    }

    public void setEmp_Email(String emp_Email) {
        this.emp_Email = emp_Email == null ? null : emp_Email.trim();
    }

    public String getEmp_hobby() {
        return emp_hobby;
    }

    public void setEmp_hobby(String emp_hobby) {
        this.emp_hobby = emp_hobby == null ? null : emp_hobby.trim();
    }

    public Integer getEmp_province() {
        return emp_province;
    }

    public void setEmp_province(Integer emp_province) {
        this.emp_province = emp_province;
    }

    public Integer getEmp_city() {
        return emp_city;
    }

    public void setEmp_city(Integer emp_city) {
        this.emp_city = emp_city;
    }

    public Integer getEmp_county() {
        return emp_county;
    }

    public void setEmp_county(Integer emp_county) {
        this.emp_county = emp_county;
    }

    public String getEmp_address() {
        return emp_address;
    }

    public void setEmp_address(String emp_address) {
        this.emp_address = emp_address == null ? null : emp_address.trim();
    }

    public String getEmp_contact_name() {
        return emp_contact_name;
    }

    public void setEmp_contact_name(String emp_contact_name) {
        this.emp_contact_name = emp_contact_name == null ? null : emp_contact_name.trim();
    }

    public String getEmp_contact_phone() {
        return emp_contact_phone;
    }

    public void setEmp_contact_phone(String emp_contact_phone) {
        this.emp_contact_phone = emp_contact_phone == null ? null : emp_contact_phone.trim();
    }

    public String getEmp_contact_relationship() {
        return emp_contact_relationship;
    }

    public void setEmp_contact_relationship(String emp_contact_relationship) {
        this.emp_contact_relationship = emp_contact_relationship == null ? null : emp_contact_relationship.trim();
    }

    public String getEmp_contact_address() {
        return emp_contact_address;
    }

    public void setEmp_contact_address(String emp_contact_address) {
        this.emp_contact_address = emp_contact_address == null ? null : emp_contact_address.trim();
    }

    public String getEmp_Employment_nature() {
        return emp_Employment_nature;
    }

    public void setEmp_Employment_nature(String emp_Employment_nature) {
        this.emp_Employment_nature = emp_Employment_nature == null ? null : emp_Employment_nature.trim();
    }

    public String getEmp_photo_path() {
        return emp_photo_path;
    }

    public void setEmp_photo_path(String emp_photo_path) {
        this.emp_photo_path = emp_photo_path == null ? null : emp_photo_path.trim();
    }

    public Date getEmp_Entry_date() {
        return emp_Entry_date;
    }

    public void setEmp_Entry_date(Date emp_Entry_date) {
        this.emp_Entry_date = emp_Entry_date;
    }

    public Date getEmp_tryout_end_date() {
        return emp_tryout_end_date;
    }

    public void setEmp_tryout_end_date(Date emp_tryout_end_date) {
        this.emp_tryout_end_date = emp_tryout_end_date;
    }

    public String getEmp_now_status() {
        return emp_now_status;
    }

    public void setEmp_now_status(String emp_now_status) {
        this.emp_now_status = emp_now_status == null ? null : emp_now_status.trim();
    }

    public String getEmp_technical_title_name() {
        return emp_technical_title_name;
    }

    public void setEmp_technical_title_name(String emp_technical_title_name) {
        this.emp_technical_title_name = emp_technical_title_name == null ? null : emp_technical_title_name.trim();
    }

    public Integer getEmp_grade_id() {
        return emp_grade_id;
    }

    public void setEmp_grade_id(Integer emp_grade_id) {
        this.emp_grade_id = emp_grade_id;
    }

    public Integer getEmp_registrant() {
        return emp_registrant;
    }

    public void setEmp_registrant(Integer emp_registrant) {
        this.emp_registrant = emp_registrant;
    }

    public String getEmp_salary_cardnumber() {
        return emp_salary_cardnumber;
    }

    public void setEmp_salary_cardnumber(String emp_salary_cardnumber) {
        this.emp_salary_cardnumber = emp_salary_cardnumber == null ? null : emp_salary_cardnumber.trim();
    }

    public String getEmp_medical_insurance_cardnumber() {
        return emp_medical_insurance_cardnumber;
    }

    public void setEmp_medical_insurance_cardnumber(String emp_medical_insurance_cardnumber) {
        this.emp_medical_insurance_cardnumber = emp_medical_insurance_cardnumber == null ? null : emp_medical_insurance_cardnumber.trim();
    }

    public String getEmp_endowment_insurance_cardnumber() {
        return emp_endowment_insurance_cardnumber;
    }

    public void setEmp_endowment_insurance_cardnumber(String emp_endowment_insurance_cardnumber) {
        this.emp_endowment_insurance_cardnumber = emp_endowment_insurance_cardnumber == null ? null : emp_endowment_insurance_cardnumber.trim();
    }

    public String getEmp_idcard_front() {
        return emp_idcard_front;
    }

    public void setEmp_idcard_front(String emp_idcard_front) {
        this.emp_idcard_front = emp_idcard_front == null ? null : emp_idcard_front.trim();
    }

    public String getEmp_idcard_reverse() {
        return emp_idcard_reverse;
    }

    public void setEmp_idcard_reverse(String emp_idcard_reverse) {
        this.emp_idcard_reverse = emp_idcard_reverse == null ? null : emp_idcard_reverse.trim();
    }

    public String getEmp_Degree_certificate() {
        return emp_Degree_certificate;
    }

    public void setEmp_Degree_certificate(String emp_Degree_certificate) {
        this.emp_Degree_certificate = emp_Degree_certificate == null ? null : emp_Degree_certificate.trim();
    }

    public String getEmp_Education_certificate() {
        return emp_Education_certificate;
    }

    public void setEmp_Education_certificate(String emp_Education_certificate) {
        this.emp_Education_certificate = emp_Education_certificate == null ? null : emp_Education_certificate.trim();
    }

    public String getEmp_technical_title_path() {
        return emp_technical_title_path;
    }

    public void setEmp_technical_title_path(String emp_technical_title_path) {
        this.emp_technical_title_path = emp_technical_title_path == null ? null : emp_technical_title_path.trim();
    }

    public String getEmp_Education_experience() {
        return emp_Education_experience;
    }

    public void setEmp_Education_experience(String emp_Education_experience) {
        this.emp_Education_experience = emp_Education_experience == null ? null : emp_Education_experience.trim();
    }

    public String getEmp_work_experience() {
        return emp_work_experience;
    }

    public void setEmp_work_experience(String emp_work_experience) {
        this.emp_work_experience = emp_work_experience == null ? null : emp_work_experience.trim();
    }

    public String getEmp_train_experience() {
        return emp_train_experience;
    }

    public void setEmp_train_experience(String emp_train_experience) {
        this.emp_train_experience = emp_train_experience == null ? null : emp_train_experience.trim();
    }

    public String getEmp_society_relation() {
        return emp_society_relation;
    }

    public void setEmp_society_relation(String emp_society_relation) {
        this.emp_society_relation = emp_society_relation == null ? null : emp_society_relation.trim();
    }

    public String getEmp_remarks() {
        return emp_remarks;
    }

    public void setEmp_remarks(String emp_remarks) {
        this.emp_remarks = emp_remarks == null ? null : emp_remarks.trim();
    }

    public String getEmp_delectStatus() {
        return emp_delectStatus;
    }

    public void setEmp_delectStatus(String emp_delectStatus) {
        this.emp_delectStatus = emp_delectStatus == null ? null : emp_delectStatus.trim();
    }

    public Integer getEmp_department() {
        return emp_department;
    }

    public void setEmp_department(Integer emp_department) {
        this.emp_department = emp_department;
    }

    public Integer getEmp_position() {
        return emp_position;
    }

    public void setEmp_position(Integer emp_position) {
        this.emp_position = emp_position;
    }

    public String getEmp_educational_background() {
        return emp_educational_background;
    }

    public void setEmp_educational_background(String emp_educational_background) {
        this.emp_educational_background = emp_educational_background == null ? null : emp_educational_background.trim();
    }

    public Integer getEmp_age() {
        return emp_age;
    }

    public void setEmp_age(Integer emp_age) {
        this.emp_age = emp_age;
    }

    public Date getEmp_birthday() {
        return emp_birthday;
    }

    public void setEmp_birthday(Date emp_birthday) {
        this.emp_birthday = emp_birthday;
    }

    public String getEmp_origin_detail() {
        return emp_origin_detail;
    }

    public void setEmp_origin_detail(String emp_origin_detail) {
        this.emp_origin_detail = emp_origin_detail == null ? null : emp_origin_detail.trim();
    }

    public String getEmp_now_province() {
        return emp_now_province;
    }

    public void setEmp_now_province(String emp_now_province) {
        this.emp_now_province = emp_now_province == null ? null : emp_now_province.trim();
    }

    public String getEmp_now_city() {
        return emp_now_city;
    }

    public void setEmp_now_city(String emp_now_city) {
        this.emp_now_city = emp_now_city == null ? null : emp_now_city.trim();
    }

    public String getEmp_now_county() {
        return emp_now_county;
    }

    public void setEmp_now_county(String emp_now_county) {
        this.emp_now_county = emp_now_county == null ? null : emp_now_county.trim();
    }

    public String getEmp_now_detail() {
        return emp_now_detail;
    }

    public void setEmp_now_detail(String emp_now_detail) {
        this.emp_now_detail = emp_now_detail == null ? null : emp_now_detail.trim();
    }

    public String getEmp_contact_address_province() {
        return emp_contact_address_province;
    }

    public void setEmp_contact_address_province(String emp_contact_address_province) {
        this.emp_contact_address_province = emp_contact_address_province == null ? null : emp_contact_address_province.trim();
    }

    public String getEmp_contact_address_city() {
        return emp_contact_address_city;
    }

    public void setEmp_contact_address_city(String emp_contact_address_city) {
        this.emp_contact_address_city = emp_contact_address_city == null ? null : emp_contact_address_city.trim();
    }

    public String getEmp_contact_address_county() {
        return emp_contact_address_county;
    }

    public void setEmp_contact_address_county(String emp_contact_address_county) {
        this.emp_contact_address_county = emp_contact_address_county == null ? null : emp_contact_address_county.trim();
    }

    public String getEmp_contact_address_detail() {
        return emp_contact_address_detail;
    }

    public void setEmp_contact_address_detail(String emp_contact_address_detail) {
        this.emp_contact_address_detail = emp_contact_address_detail == null ? null : emp_contact_address_detail.trim();
    }
}