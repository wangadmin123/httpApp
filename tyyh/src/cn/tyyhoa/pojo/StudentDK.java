package cn.tyyhoa.pojo;

import java.io.Serializable;

public class StudentDK implements Serializable {
	private Integer stu_Id;		//学生Id
	private String am_dk;		//上午打卡
	private String am_time;		//上午打卡时间
	private String pm_dk;		//下午打卡
	private String pm_time;		//下午打卡时间
	public Integer getStu_Id() {
		return stu_Id;
	}
	public void setStu_Id(Integer stu_Id) {
		this.stu_Id = stu_Id;
	}
	public String getAm_dk() {
		return am_dk;
	}
	public void setAm_dk(String am_dk) {
		this.am_dk = am_dk;
	}
	public String getAm_time() {
		return am_time;
	}
	public void setAm_time(String am_time) {
		this.am_time = am_time;
	}
	public String getPm_dk() {
		return pm_dk;
	}
	public void setPm_dk(String pm_dk) {
		this.pm_dk = pm_dk;
	}
	public String getPm_time() {
		return pm_time;
	}
	public void setPm_time(String pm_time) {
		this.pm_time = pm_time;
	}
}
