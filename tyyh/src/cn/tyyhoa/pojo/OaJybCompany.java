package cn.tyyhoa.pojo;

public class OaJybCompany {
	
    private Integer company_id;//企业表主键id
    
    private String company_name;//企业名称

    private String company_city;//企业所在城市

    private String company_person;//联系人

    private String company_phone;//联系电话

    private String company_job;//职务

    private String company_station;//招聘岗位

    private String company_scope;//企业规模

    private String company_property;//企业性质

    private String company_category;//企业类别

    private String company_type;//企业类型

    private String company_trade;//企业行业

    private String company_Email;//企业邮箱

    private String company_Address;//企业地址

    private String company_remarks;//备注
    
    private String company_zuoji;//企业座机
    
    private String company_web;//公司网站
    
    private String company_pinyin;//公司拼音
    

    public String getCompany_pinyin() {
		return company_pinyin;
	}

	public void setCompany_pinyin(String company_pinyin) {
		this.company_pinyin = company_pinyin;
	}

	public String getCompany_zuoji() {
		return company_zuoji;
	}

	public void setCompany_zuoji(String company_zuoji) {
		this.company_zuoji = company_zuoji;
	}

	public String getCompany_web() {
		return company_web;
	}

	public void setCompany_web(String company_web) {
		this.company_web = company_web;
	}

	public Integer getCompany_id() {
        return company_id;
    }

    public void setCompany_id(Integer company_id) {
        this.company_id = company_id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name == null ? null : company_name.trim();
    }

    public String getCompany_city() {
        return company_city;
    }

    public void setCompany_city(String company_city) {
        this.company_city = company_city == null ? null : company_city.trim();
    }

    public String getCompany_person() {
        return company_person;
    }

    public void setCompany_person(String company_person) {
        this.company_person = company_person == null ? null : company_person.trim();
    }

    public String getCompany_phone() {
        return company_phone;
    }

    public void setCompany_phone(String company_phone) {
        this.company_phone = company_phone == null ? null : company_phone.trim();
    }

    public String getCompany_job() {
        return company_job;
    }

    public void setCompany_job(String company_job) {
        this.company_job = company_job == null ? null : company_job.trim();
    }

    public String getCompany_station() {
        return company_station;
    }

    public void setCompany_station(String company_station) {
        this.company_station = company_station == null ? null : company_station.trim();
    }

    public String getCompany_scope() {
        return company_scope;
    }

    public void setCompany_scope(String company_scope) {
        this.company_scope = company_scope == null ? null : company_scope.trim();
    }

    public String getCompany_property() {
        return company_property;
    }

    public void setCompany_property(String company_property) {
        this.company_property = company_property == null ? null : company_property.trim();
    }

    public String getCompany_category() {
        return company_category;
    }

    public void setCompany_category(String company_category) {
        this.company_category = company_category == null ? null : company_category.trim();
    }

    public String getCompany_type() {
        return company_type;
    }

    public void setCompany_type(String company_type) {
        this.company_type = company_type == null ? null : company_type.trim();
    }

    public String getCompany_trade() {
        return company_trade;
    }

    public void setCompany_trade(String company_trade) {
        this.company_trade = company_trade == null ? null : company_trade.trim();
    }

    public String getCompany_Email() {
        return company_Email;
    }

    public void setCompany_Email(String company_Email) {
        this.company_Email = company_Email == null ? null : company_Email.trim();
    }

    public String getCompany_Address() {
        return company_Address;
    }

    public void setCompany_Address(String company_Address) {
        this.company_Address = company_Address == null ? null : company_Address.trim();
    }

    public String getCompany_remarks() {
        return company_remarks;
    }

    public void setCompany_remarks(String company_remarks) {
        this.company_remarks = company_remarks == null ? null : company_remarks.trim();
    }
}