package cn.tyyhoa.pojo;

import java.sql.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class OaJwbGrade {
	private Integer id;//班级ID
	
	private String name;//班级名称
	
	private Integer teacherID;//教员编号
	
	private Integer classTeacherID;//班主任编号
	
	private Integer obtainID; //就业老师编号
	
	private Integer motorid; //机房ID
	
	private Integer specialtyID;//班级类型
	
	private Integer struts;//班级状态
	
	private Integer stage;//班级阶段
	@JSONField(format="yyyy-MM-dd")
	private Date createTime;//开班时间
	
	private Date graduate;//毕业时间
	
	private Date firststudytime;//第一次升学时间
	private Date secondstudytime;//第二次升学时间
	private Date practicetime;//实训时间
	
	private String teacher;//班主任名字
    
    private String classTeacher;//教员名字
    
    private String careerteacher;//就业老师
    
    private String strutsName;//班级状态
    
    private String stagename;//学期
    private String stageId;//学期
    
    private String specialtyname;//专业
    
    private String obtain;//就业老师名称	
	private Integer num;
	private String motor;
	
	private double preparationPT;//上机提交率
	private double manamiPT;//本上百分比
	private double obuPT;//上机百分比
	private double homeworkPT;//课后百分比
	private double wordPT;//单词正确率
	private double classHourPT;//出勤率
	
	private Integer studentNum;//学生人数
	private Integer stuid;//学生id
	private String written;//笔试
	private String scjd;//机试
	private String stuName;//学生名称
	private double Integrated;//综合成绩
	
	private String stages;//班级阶段
	
	
	public String getStages() {
		return stages;
	}
	public void setStages(String stages) {
		this.stages = stages;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(Integer teacherID) {
		this.teacherID = teacherID;
	}
	public Integer getClassTeacherID() {
		return classTeacherID;
	}
	public void setClassTeacherID(Integer classTeacherID) {
		this.classTeacherID = classTeacherID;
	}
	public Integer getObtainID() {
		return obtainID;
	}
	public void setObtainID(Integer obtainID) {
		this.obtainID = obtainID;
	}
	public Integer getMotorid() {
		return motorid;
	}
	public void setMotorid(Integer motorid) {
		this.motorid = motorid;
	}
	public Integer getSpecialtyID() {
		return specialtyID;
	}
	public void setSpecialtyID(Integer specialtyID) {
		this.specialtyID = specialtyID;
	}
	public Integer getStruts() {
		return struts;
	}
	public void setStruts(Integer struts) {
		this.struts = struts;
	}
	public Integer getStage() {
		return stage;
	}
	public void setStage(Integer stage) {
		this.stage = stage;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getGraduate() {
		return graduate;
	}
	public void setGraduate(Date graduate) {
		this.graduate = graduate;
	}
	public Date getFirststudytime() {
		return firststudytime;
	}
	public void setFirststudytime(Date firststudytime) {
		this.firststudytime = firststudytime;
	}
	public Date getSecondstudytime() {
		return secondstudytime;
	}
	public void setSecondstudytime(Date secondstudytime) {
		this.secondstudytime = secondstudytime;
	}
	public Date getPracticetime() {
		return practicetime;
	}
	public void setPracticetime(Date practicetime) {
		this.practicetime = practicetime;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getClassTeacher() {
		return classTeacher;
	}
	public void setClassTeacher(String classTeacher) {
		this.classTeacher = classTeacher;
	}
	public String getCareerteacher() {
		return careerteacher;
	}
	public void setCareerteacher(String careerteacher) {
		this.careerteacher = careerteacher;
	}
	public String getStrutsName() {
		return strutsName;
	}
	public void setStrutsName(String strutsName) {
		this.strutsName = strutsName;
	}
	public String getStagename() {
		return stagename;
	}
	public void setStagename(String stagename) {
		this.stagename = stagename;
	}
	public String getSpecialtyname() {
		return specialtyname;
	}
	public void setSpecialtyname(String specialtyname) {
		this.specialtyname = specialtyname;
	}
	public String getObtain() {
		return obtain;
	}
	public void setObtain(String obtain) {
		this.obtain = obtain;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getMotor() {
		return motor;
	}
	public void setMotor(String motor) {
		this.motor = motor;
	}
	public double getPreparationPT() {
		return preparationPT;
	}
	public void setPreparationPT(double preparationPT) {
		this.preparationPT = preparationPT;
	}
	public double getManamiPT() {
		return manamiPT;
	}
	public void setManamiPT(double manamiPT) {
		this.manamiPT = manamiPT;
	}
	public double getObuPT() {
		return obuPT;
	}
	public void setObuPT(double obuPT) {
		this.obuPT = obuPT;
	}
	public double getHomeworkPT() {
		return homeworkPT;
	}
	public void setHomeworkPT(double homeworkPT) {
		this.homeworkPT = homeworkPT;
	}
	public double getWordPT() {
		return wordPT;
	}
	public void setWordPT(double wordPT) {
		this.wordPT = wordPT;
	}
	public double getClassHourPT() {
		return classHourPT;
	}
	public void setClassHourPT(double classHourPT) {
		this.classHourPT = classHourPT;
	}
	public Integer getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(Integer studentNum) {
		this.studentNum = studentNum;
	}
	public Integer getStuid() {
		return stuid;
	}
	public void setStuid(Integer stuid) {
		this.stuid = stuid;
	}
	public String getWritten() {
		return written;
	}
	public void setWritten(String written) {
		this.written = written;
	}
	public String getScjd() {
		return scjd;
	}
	public void setScjd(String scjd) {
		this.scjd = scjd;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public double getIntegrated() {
		return Integrated;
	}
	public void setIntegrated(double integrated) {
		Integrated = integrated;
	}
	public String getStageId() {
		return stageId;
	}
	public void setStageId(String stageId) {
		this.stageId = stageId;
	}


}
