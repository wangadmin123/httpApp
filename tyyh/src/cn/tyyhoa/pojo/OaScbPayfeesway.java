package cn.tyyhoa.pojo;

public class OaScbPayfeesway {
    private Integer payfees_id;//编号

    private String payfees_way;//缴费方式

    public Integer getPayfees_id() {
        return payfees_id;
    }

    public void setPayfees_id(Integer payfees_id) {
        this.payfees_id = payfees_id;
    }

    public String getPayfees_way() {
        return payfees_way;
    }

    public void setPayfees_way(String payfees_way) {
        this.payfees_way = payfees_way == null ? null : payfees_way.trim();
    }
}