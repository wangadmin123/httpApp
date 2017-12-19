package cn.tyyhoa.pojo;

public class OaScbClassname {
    private Integer id;//编号

    private String allotClass;//班级

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAllotClass() {
        return allotClass;
    }

    public void setAllotClass(String allotClass) {
        this.allotClass = allotClass == null ? null : allotClass.trim();
    }
}