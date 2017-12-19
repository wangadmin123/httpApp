package cn.tyyhoa.pojo;

public class OaJzbSpecialty {
    private Integer specialty_Id;//编号

    private String specialty_name;//专业名称

    public Integer getSpecialty_Id() {
        return specialty_Id;
    }

    public void setSpecialty_Id(Integer specialty_Id) {
        this.specialty_Id = specialty_Id;
    }

    public String getSpecialty_name() {
        return specialty_name;
    }

    public void setSpecialty_name(String specialty_name) {
        this.specialty_name = specialty_name == null ? null : specialty_name.trim();
    }
}