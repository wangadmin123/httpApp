package cn.tyyhoa.pojo;

public class OaJwbCourse {
    private Integer id;//课程ID

    private String name;//课程名称

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
        this.name = name == null ? null : name.trim();
    }
}