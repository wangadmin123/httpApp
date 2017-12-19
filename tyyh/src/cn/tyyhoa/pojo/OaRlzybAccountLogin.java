package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybAccountLogin {
    private Integer account_login_id;//编号

    private String account_login_name;//账号名称

    private Date account_login_time;//登录时间

    private String account_login_ipaddress;//登录地点
    
    private String account_login_times;//上次登录时间String
    
    

    public String getAccount_login_times() {
		return account_login_times;
	}

	public void setAccount_login_times(String account_login_times) {
		this.account_login_times = account_login_times;
	}

	public Integer getAccount_login_id() {
        return account_login_id;
    }

    public void setAccount_login_id(Integer account_login_id) {
        this.account_login_id = account_login_id;
    }

    public String getAccount_login_name() {
        return account_login_name;
    }

    public void setAccount_login_name(String account_login_name) {
        this.account_login_name = account_login_name == null ? null : account_login_name.trim();
    }

    public Date getAccount_login_time() {
        return account_login_time;
    }

    public void setAccount_login_time(Date account_login_time) {
        this.account_login_time = account_login_time;
    }

    public String getAccount_login_ipaddress() {
        return account_login_ipaddress;
    }

    public void setAccount_login_ipaddress(String account_login_ipaddress) {
        this.account_login_ipaddress = account_login_ipaddress == null ? null : account_login_ipaddress.trim();
    }
}