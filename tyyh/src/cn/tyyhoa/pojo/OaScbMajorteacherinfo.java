package cn.tyyhoa.pojo;

public class OaScbMajorteacherinfo {
    private Integer id;

    private Integer schoolId;

    private Integer specialtId;

    private String Name;

    private Integer Sex;

    private String Hobbies;

    private String specialSkill;

    private String teacherClass;

    private String comments;
    
    
    
    
    private String banname;
    private String bansex;
    private String banhobby;
    private String banspecial;
    private String bancomment;
    public String getBanname() {
		return banname;
	}

	public void setBanname(String banname) {
		this.banname = banname;
	}

	public String getBansex() {
		return bansex;
	}

	public void setBansex(String bansex) {
		this.bansex = bansex;
	}

	public String getBanhobby() {
		return banhobby;
	}

	public void setBanhobby(String banhobby) {
		this.banhobby = banhobby;
	}

	public String getBanspecial() {
		return banspecial;
	}

	public void setBanspecial(String banspecial) {
		this.banspecial = banspecial;
	}

	public String getBancomment() {
		return bancomment;
	}

	public void setBancomment(String bancomment) {
		this.bancomment = bancomment;
	}

	

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public Integer getSpecialtId() {
        return specialtId;
    }

    public void setSpecialtId(Integer specialtId) {
        this.specialtId = specialtId;
    }



    public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Integer getSex() {
		return Sex;
	}

	public void setSex(Integer sex) {
		Sex = sex;
	}

	public String getHobbies() {
		return Hobbies;
	}

	public void setHobbies(String hobbies) {
		Hobbies = hobbies;
	}

	public String getSpecialSkill() {
        return specialSkill;
    }

    public void setSpecialSkill(String specialSkill) {
        this.specialSkill = specialSkill == null ? null : specialSkill.trim();
    }

    public String getTeacherClass() {
        return teacherClass;
    }

    public void setTeacherClass(String teacherClass) {
        this.teacherClass = teacherClass == null ? null : teacherClass.trim();
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments == null ? null : comments.trim();
    }
}