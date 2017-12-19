package cn.tyyhoa.pojo;

import java.util.Date;

public class OaScbRecord {
	private int recordId;//记录编号
	
	private int consulterId;//咨询量编号
	
	private Date eventTime;//事件时间
	
	private String eventName;//事件名
	
	private String enterPeople;//录入人
	
	private Date enterTime;//录入时间
	
	
	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	public int getConsulterId() {
		return consulterId;
	}
	public void setConsulterId(int consulterId) {
		this.consulterId = consulterId;
	}
	public Date getEventTime() {
		return eventTime;
	}
	public void setEventTime(Date eventTime) {
		this.eventTime = eventTime;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEnterPeople() {
		return enterPeople;
	}
	public void setEnterPeople(String enterPeople) {
		this.enterPeople = enterPeople;
	}
	public Date getEnterTime() {
		return enterTime;
	}
	public void setEnterTime(Date enterTime) {
		this.enterTime = enterTime;
	}
	
}


