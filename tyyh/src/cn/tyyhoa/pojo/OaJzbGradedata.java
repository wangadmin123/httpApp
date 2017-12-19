package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbGradedata {
    private Integer ID;//编号

    private Integer Student_id;//学生编号
  
    
    private String stu_number;//学号

    private String stu_name;//姓名

    private String amturn;//上午出勤

    private String pmturn;//下午出勤
    
    private String word;//单词
    
    private Date time;//创建时间
    
    private String gradeName;//班级名称
    
    private String remarks;//备注
    
    private Integer grade_id;//班级id 
    
    private Date enteringTime;//录入时间
    
    private double classHour;//当天时间
    
    private int qijiaHour;	 //请假课时
    private int preparation; //预习正确数
    private int manami;      //本上正确数
    private int obu;		 //上机正确数
    private int homework;	 //课后正确数
    private int written;     //日考成绩

    
    public int getPreparation() {
		return preparation;
	}

	public void setPreparation(int preparation) {
		this.preparation = preparation;
	}

	public int getManami() {
		return manami;
	}

	public void setManami(int manami) {
		this.manami = manami;
	}

	public int getObu() {
		return obu;
	}

	public void setObu(int obu) {
		this.obu = obu;
	}

	public int getHomework() {
		return homework;
	}

	public void setHomework(int homework) {
		this.homework = homework;
	}

	public int getWritten() {
		return written;
	}

	public void setWritten(int written) {
		this.written = written;
	}

	public int getQijiaHour() {
		return qijiaHour;
	}

	public void setQijiaHour(int qijiaHour) {
		this.qijiaHour = qijiaHour;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getStudent_id() {
        return Student_id;
    }

    public void setStudent_id(Integer Student_id) {
        this.Student_id = Student_id;
    }

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getAmturn() {
        return amturn;
    }

    public void setAmturn(String amturn) {
        this.amturn = amturn == null ? null : amturn.trim();
    }

    public String getPmturn() {
        return pmturn;
    }

    public void setPmturn(String pmturn) {
        this.pmturn = pmturn == null ? null : pmturn.trim();
    }

	public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

	public String getStu_number() {
		return stu_number;
	}

	public void setStu_number(String stu_number) {
		this.stu_number = stu_number;
	}

	public Integer getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(Integer grade_id) {
		this.grade_id = grade_id;
	}

	public Date getEnteringTime() {
		return enteringTime;
	}

	public void setEnteringTime(Date enteringTime) {
		this.enteringTime = enteringTime;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public double getClassHour() {
		return classHour;
	}

	public void setClassHour(double classHour) {
		this.classHour = classHour;
	}


    
	
    
}