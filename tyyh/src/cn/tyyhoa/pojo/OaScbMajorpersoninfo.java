package cn.tyyhoa.pojo;

public class OaScbMajorpersoninfo {
    private Integer id;

    private Integer schoolId;

    private Integer specialtId;

    private String Name;

    private Integer Sex;

    private String Hobbies;

    private String specialSkill;

    private String directorClass;

    private String comments;
    
    
    private String xiname;
    private String xisex;
    private String xihobby;
    private String xispecial;
    private String xicomment;

    public String getXiname() {
		return xiname;
	}

	public void setXiname(String xiname) {
		this.xiname = xiname;
	}

	public String getXisex() {
		return xisex;
	}

	public void setXisex(String xisex) {
		this.xisex = xisex;
	}

	public String getXihobby() {
		return xihobby;
	}

	public void setXihobby(String xihobby) {
		this.xihobby = xihobby;
	}

	public String getXispecial() {
		return xispecial;
	}

	public void setXispecial(String xispecial) {
		this.xispecial = xispecial;
	}

	public String getXicomment() {
		return xicomment;
	}

	public void setXicomment(String xicomment) {
		this.xicomment = xicomment;
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

    public String getDirectorClass() {
        return directorClass;
    }

    public void setDirectorClass(String directorClass) {
        this.directorClass = directorClass == null ? null : directorClass.trim();
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments == null ? null : comments.trim();
    }
}