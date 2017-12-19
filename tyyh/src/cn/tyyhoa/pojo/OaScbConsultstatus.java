package cn.tyyhoa.pojo;

public class OaScbConsultstatus {
    private Integer id;//编号

    private String status;//状态（在读、待业)

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}