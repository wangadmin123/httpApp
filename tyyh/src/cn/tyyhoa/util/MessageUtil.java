package cn.tyyhoa.util;


public class MessageUtil {
	private Integer id; //通知编号
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	private  Integer  from; //发送者
	private  String  content;  //内容
	private  String  date;  //时间
	private Integer to;  //接受者
	private Integer advicestate; //通知状态
	public Integer getAdvicestate() {
		return advicestate;
	}
	public void setAdvicestate(Integer advicestate) {
		this.advicestate = advicestate;
	}
	public Integer getTo() {
		return to;
	}
	public void setTo(Integer to) {
		this.to = to;
	}
	public Integer getFrom() {
		return from;
	}
	public void setFrom(Integer from) {
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
	public MessageUtil() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
