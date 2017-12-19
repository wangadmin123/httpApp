package cn.tyyhoa.pojo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OaXsbDayTest implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -8760740029508367344L;

	private Integer id;// 记录ID
	
	private Integer stu_id;

	private Integer studentId;// 学生ID

	private Integer written;// 笔试分数

	private String stu_number;// 学号

	private String stu_name;// 学生姓名

	private Integer classId;// 班级ID
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date createtime;// 创建时间

	private Date modifytime;// 修改时间
	
	private Date writetime;//录入时间
	
	public OaXsbDayTest() {
	}

	public OaXsbDayTest(Integer id, Integer studentId, Integer written,
			String stu_number, String stu_name, Integer classId,
			Date createtime, Date modifytime, Date writetime,Integer stu_id) {
		super();
		this.id = id;
		this.stu_id = stu_id;
		this.studentId = studentId;
		this.written = written;
		this.stu_number = stu_number;
		this.stu_name = stu_name;
		this.classId = classId;
		this.createtime = createtime;
		this.modifytime = modifytime;
		this.writetime = writetime;
	}
	
	public Integer getStu_id() {
		return stu_id;
	}

	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
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

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
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

	public Date getWritetime() {
		return writetime;
	}

	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	
	


}
