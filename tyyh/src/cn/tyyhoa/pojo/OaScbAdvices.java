package cn.tyyhoa.pojo;

public class OaScbAdvices {
	private Integer id; //通知编号
	private  OaRlzybEmployee  from; //发送者
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public OaRlzybEmployee getFrom() {
		return from;
	}
	public void setFrom(OaRlzybEmployee from) {
		this.from = from;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public OaRlzybEmployee getTo() {
		return to;
	}
	public void setTo(OaRlzybEmployee to) {
		this.to = to;
	}
	public Integer getAdvicestate() {
		return advicestate;
	}
	public void setAdvicestate(Integer advicestate) {
		this.advicestate = advicestate;
	}
	private  String  content;  //内容
	private  String  date;  //时间
	private OaRlzybEmployee to;  //接受者
	private Integer advicestate; //通知状态
}
