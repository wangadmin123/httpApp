package cn.tyyhoa.pojo;

public class OaScbMajorinfo {
    private Integer id;

    private Integer schoolId;

    private String specialtyName;

    private String specialtySituation;

    private String specialtyPeoplenNumber;

    private String classNumber;

    private String developDirection;

    private String specialtyComments;

    private String studySituation;

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

    public String getSpecialtyName() {
        return specialtyName;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName == null ? null : specialtyName.trim();
    }

    public String getSpecialtySituation() {
        return specialtySituation;
    }

    public void setSpecialtySituation(String specialtySituation) {
        this.specialtySituation = specialtySituation == null ? null : specialtySituation.trim();
    }

    public String getSpecialtyPeoplenNumber() {
        return specialtyPeoplenNumber;
    }

    public void setSpecialtyPeoplenNumber(String specialtyPeoplenNumber) {
        this.specialtyPeoplenNumber = specialtyPeoplenNumber == null ? null : specialtyPeoplenNumber.trim();
    }

    public String getClassNumber() {
        return classNumber;
    }

    public void setClassNumber(String classNumber) {
        this.classNumber = classNumber == null ? null : classNumber.trim();
    }

    public String getDevelopDirection() {
        return developDirection;
    }

    public void setDevelopDirection(String developDirection) {
        this.developDirection = developDirection == null ? null : developDirection.trim();
    }

    public String getSpecialtyComments() {
        return specialtyComments;
    }

    public void setSpecialtyComments(String specialtyComments) {
        this.specialtyComments = specialtyComments == null ? null : specialtyComments.trim();
    }

    public String getStudySituation() {
        return studySituation;
    }

    public void setStudySituation(String studySituation) {
        this.studySituation = studySituation == null ? null : studySituation.trim();
    }
}