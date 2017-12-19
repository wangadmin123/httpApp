package cn.tyyhoa.pojo;

public class OaJzbStudentstatus {
    private Integer id;//编号

    private String stu_status;//学员状态

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStu_status() {
        return stu_status;
    }

    public void setStu_status(String stu_status) {
        this.stu_status = stu_status == null ? null : stu_status.trim();
    }
}