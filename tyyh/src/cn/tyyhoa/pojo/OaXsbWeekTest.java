package cn.tyyhoa.pojo;

import java.io.Serializable;
import java.util.Date;

public class OaXsbWeekTest implements Serializable {



	/**
	 * 
	 */
	private static final long serialVersionUID = -9178643697727649403L;

	private Integer id;// 记录ID

	private Integer studentId;// 学生ID

	private Integer written;// 笔试分数

	private Integer scjd;// 机试分数

	private Integer classId;// 班级ID

	private String stu_number;// 学号

	private String stu_name;// 学生姓名

	private Date createtime;// 创建时间

	private Date modifytime;// 修改时间

	private Integer whatweek;//第几次周考
	
	private Date writetime;//录入时间

	public OaXsbWeekTest() {
	}

	public OaXsbWeekTest(Integer id, Integer studentId, Integer written,
			Integer scjd, Integer classId, String stu_number, String stu_name,
			Date createtime, Date modifytime, Integer whatweek, Date writetime) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.written = written;
		this.scjd = scjd;
		this.classId = classId;
		this.stu_number = stu_number;
		this.stu_name = stu_name;
		this.createtime = createtime;
		this.modifytime = modifytime;
		this.whatweek = whatweek;
		this.writetime = writetime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public Integer getWritten() {
		return written;
	}

	public void setWritten(Integer written) {
		this.written = written;
	}

	public Integer getScjd() {
		return scjd;
	}

	public void setScjd(Integer scjd) {
		this.scjd = scjd;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public String getStu_number() {
		return stu_number;
	}

	public void setStu_number(String stu_number) {
		this.stu_number = stu_number;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getModifytime() {
		return modifytime;
	}

	public void setModifytime(Date modifytime) {
		this.modifytime = modifytime;
	}

	public Integer getWhatweek() {
		return whatweek;
	}

	public void setWhatweek(Integer whatweek) {
		this.whatweek = whatweek;
	}

	public Date getWritetime() {
		return writetime;
	}

	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	
	
	
}
