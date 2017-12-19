package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybInterviewScore {
    private Integer interview_score_id;//面试成绩主键

    private Integer interview_score_studentId;//姓名

    private Integer interview_score_basic_etiquette;//基本礼仪

    private Integer interview_score_clothing;//衣着

    private Integer interview_score_appearance;//仪表

    private Integer interview_score_expression;//域外表现

    private Integer interview_score_skill;//基本技巧

    private Integer interview_score_self_introduction;//自我介绍

    private Integer interview_score_skill_main;//面试技巧要点

    private Integer interview_score_synthesize;//综合性考察

    private Integer interview_score_surface;//外观

    private Integer interview_score_content;//内容

    private Integer interview_score_totalscore;//总分

    private String interview_score_merit;//优点

    private String interview_score_defect;//缺点

    private Integer interview_score_interviewid;//面试人员
    
    private String studentname;
    
    private String gradename;
    
    private Integer gradeid;
    
    private String mianshiyuan;
    
    private Date mianshishijian;
    
    private int stuid;

	public int getStuid() {
		return stuid;
	}

	public void setStuid(int stuid) {
		this.stuid = stuid;
	}

	public Date getMianshishijian() {
		return mianshishijian;
	}

	public void setMianshishijian(Date mianshishijian) {
		this.mianshishijian = mianshishijian;
	}

	public String getMianshiyuan() {
		return mianshiyuan;
	}

	public void setMianshiyuan(String mianshiyuan) {
		this.mianshiyuan = mianshiyuan;
	}

	public Integer getGradeid() {
		return gradeid;
	}

	public void setGradeid(Integer gradeid) {
		this.gradeid = gradeid;
	}

	private OaJybInterview oaJybInterview;
    
    public OaJybInterview getOaJybInterview() {
		return oaJybInterview;
	}

	public void setOaJybInterview(OaJybInterview oaJybInterview) {
		this.oaJybInterview = oaJybInterview;
	}

	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	

    public Integer getInterview_score_id() {
        return interview_score_id;
    }

    public void setInterview_score_id(Integer interview_score_id) {
        this.interview_score_id = interview_score_id;
    }

    public Integer getInterview_score_studentId() {
        return interview_score_studentId;
    }

    public void setInterview_score_studentId(Integer interview_score_studentId) {
        this.interview_score_studentId = interview_score_studentId;
    }

    public Integer getInterview_score_basic_etiquette() {
        return interview_score_basic_etiquette;
    }

    public void setInterview_score_basic_etiquette(Integer interview_score_basic_etiquette) {
        this.interview_score_basic_etiquette = interview_score_basic_etiquette;
    }

    public Integer getInterview_score_clothing() {
        return interview_score_clothing;
    }

    public void setInterview_score_clothing(Integer interview_score_clothing) {
        this.interview_score_clothing = interview_score_clothing;
    }

    public Integer getInterview_score_appearance() {
        return interview_score_appearance;
    }

    public void setInterview_score_appearance(Integer interview_score_appearance) {
        this.interview_score_appearance = interview_score_appearance;
    }

    public Integer getInterview_score_expression() {
        return interview_score_expression;
    }

    public void setInterview_score_expression(Integer interview_score_expression) {
        this.interview_score_expression = interview_score_expression;
    }

    public Integer getInterview_score_skill() {
        return interview_score_skill;
    }

    public void setInterview_score_skill(Integer interview_score_skill) {
        this.interview_score_skill = interview_score_skill;
    }

    public Integer getInterview_score_self_introduction() {
        return interview_score_self_introduction;
    }

    public void setInterview_score_self_introduction(Integer interview_score_self_introduction) {
        this.interview_score_self_introduction = interview_score_self_introduction;
    }

    public Integer getInterview_score_skill_main() {
        return interview_score_skill_main;
    }

    public void setInterview_score_skill_main(Integer interview_score_skill_main) {
        this.interview_score_skill_main = interview_score_skill_main;
    }

    public Integer getInterview_score_synthesize() {
        return interview_score_synthesize;
    }

    public void setInterview_score_synthesize(Integer interview_score_synthesize) {
        this.interview_score_synthesize = interview_score_synthesize;
    }

    public Integer getInterview_score_surface() {
        return interview_score_surface;
    }

    public void setInterview_score_surface(Integer interview_score_surface) {
        this.interview_score_surface = interview_score_surface;
    }

    public Integer getInterview_score_content() {
        return interview_score_content;
    }

    public void setInterview_score_content(Integer interview_score_content) {
        this.interview_score_content = interview_score_content;
    }

    public Integer getInterview_score_totalscore() {
        return interview_score_totalscore;
    }

    public void setInterview_score_totalscore(Integer interview_score_totalscore) {
        this.interview_score_totalscore = interview_score_totalscore;
    }

    public String getInterview_score_merit() {
        return interview_score_merit;
    }

    public void setInterview_score_merit(String interview_score_merit) {
        this.interview_score_merit = interview_score_merit == null ? null : interview_score_merit.trim();
    }

    public String getInterview_score_defect() {
        return interview_score_defect;
    }

    public void setInterview_score_defect(String interview_score_defect) {
        this.interview_score_defect = interview_score_defect == null ? null : interview_score_defect.trim();
    }

    public Integer getInterview_score_interviewid() {
        return interview_score_interviewid;
    }

    public void setInterview_score_interviewid(Integer interview_score_interviewid) {
        this.interview_score_interviewid = interview_score_interviewid;
    }
}