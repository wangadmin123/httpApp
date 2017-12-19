package cn.tyyhoa.pojo;

public class OaScbPaytype {
    private Integer id;//编号

    private String payType;//缴费类型

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType == null ? null : payType.trim();
    }
}