package cn.tyyhoa.pojo;

import java.io.Serializable;
import java.util.Date;

public class OaXsbDailypaper implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3760529379834086050L;
	private Integer id;// 记录ID
	private Integer preparation;// 预习正确数
	private Integer manami;// 本上作业正确数
	private Integer obu;// 上机练习正确数
	private Integer homework;// 课后练习正确数
	private String stu_number;// 学号
	private String stu_name;// 学生姓名
	private Integer classId;// 班级ID
	private Integer studentId;// 学生ID
	private Date createtime;// 创建时间
	private Date modifytime;// 修改时间
	private Date writetime;//录入时间

	public OaXsbDailypaper() {
	}

	public OaXsbDailypaper(Integer id, Integer preparation, Integer manami,
			Integer obu, Integer homework, String stu_number, String stu_name,
			Integer classId, Integer studentId, Date createtime,
			Date modifytime, Date writetime) {
		super();
		this.id = id;
		this.preparation = preparation;
		this.manami = manami;
		this.obu = obu;
		this.homework = homework;
		this.stu_number = stu_number;
		this.stu_name = stu_name;
		this.classId = classId;
		this.studentId = studentId;
		this.createtime = createtime;
		this.modifytime = modifytime;
		this.writetime = writetime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPreparation() {
		return preparation;
	}

	public void setPreparation(Integer preparation) {
		this.preparation = preparation;
	}

	public Integer getManami() {
		return manami;
	}

	public void setManami(Integer manami) {
		this.manami = manami;
	}

	public Integer getObu() {
		return obu;
	}

	public void setObu(Integer obu) {
		this.obu = obu;
	}

	public Integer getHomework() {
		return homework;
	}

	public void setHomework(Integer homework) {
		this.homework = homework;
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

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
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
