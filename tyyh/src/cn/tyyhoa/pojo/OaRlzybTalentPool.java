package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybTalentPool {
    private Integer talent_pool_id;//编号

    private String talent_pool_name;//姓名

    private String talent_pool_sex;//性别：1、男，2、女

    private Integer talent_pool_age;//年龄
   
    private Date talent_pool_birthday;//出生日期

    private Date talent_pool_addTime; //应聘日期

	private Integer position_id;//应聘职位编号

    private String talent_pool_salaryExpect;//薪资期望

    private String talent_pool_phone;//联系电话
    
    /*OaRlzybPosition oaRlzybPosition;*/
    private String position_name;
    
    private Date create_time;


    
    
	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Date getTalent_pool_birthday() {
		return talent_pool_birthday;
	}

	public void setTalent_pool_birthday(Date talent_pool_birthday) {
		this.talent_pool_birthday = talent_pool_birthday;
	}

	public Date getTalent_pool_addTime() {
		return talent_pool_addTime;
	}

	public void setTalent_pool_addTime(Date talent_pool_addTime) {
		this.talent_pool_addTime = talent_pool_addTime;
	}

	private String talent_pool_work_experience;//工作经验

    private Integer talent_pool_delectStatus;//删除状态
    	
	public Integer getTalent_pool_id() {
        return talent_pool_id;
    }

    public void setTalent_pool_id(Integer talent_pool_id) {
        this.talent_pool_id = talent_pool_id;
    }

    public String getTalent_pool_name() {
        return talent_pool_name;
    }

    public void setTalent_pool_name(String talent_pool_name) {
        this.talent_pool_name = talent_pool_name == null ? null : talent_pool_name.trim();
    }

    public String getTalent_pool_sex() {
        return talent_pool_sex;
    }

    public void setTalent_pool_sex(String talent_pool_sex) {
        this.talent_pool_sex = talent_pool_sex == null ? null : talent_pool_sex.trim();
    }

    public Integer getTalent_pool_age() {
        return talent_pool_age;
    }

    public void setTalent_pool_age(Integer talent_pool_age) {
        this.talent_pool_age = talent_pool_age;
    }

    public Integer getPosition_id() {
        return position_id;
    }

    public void setPosition_id(Integer position_id) {
        this.position_id = position_id;
    }

    public String getTalent_pool_salaryExpect() {
        return talent_pool_salaryExpect;
    }

    public void setTalent_pool_salaryExpect(String talent_pool_salaryExpect) {
        this.talent_pool_salaryExpect = talent_pool_salaryExpect == null ? null : talent_pool_salaryExpect.trim();
    }

    public String getTalent_pool_phone() {
        return talent_pool_phone;
    }

    public void setTalent_pool_phone(String talent_pool_phone) {
        this.talent_pool_phone = talent_pool_phone == null ? null : talent_pool_phone.trim();
    }

    public String getTalent_pool_work_experience() {
        return talent_pool_work_experience;
    }

    public void setTalent_pool_work_experience(String talent_pool_work_experience) {
        this.talent_pool_work_experience = talent_pool_work_experience == null ? null : talent_pool_work_experience.trim();
    }

    public Integer getTalent_pool_delectStatus() {
        return talent_pool_delectStatus;
    }

    public void setTalent_pool_delectStatus(Integer talent_pool_delectStatus) {
        this.talent_pool_delectStatus = talent_pool_delectStatus;
    }
}