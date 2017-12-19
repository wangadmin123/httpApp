package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybOrder {
    private Integer order_id;//意向调查表主键

    private Integer order_studentId;//学员姓名

    private String order_city;//意向城市

    private String order_job;//岗位

    private Double order_sal;//期望薪资

    private String order_recommend_city;//推荐城市

    private Double order_fixSal;//预定薪资

    private Date order_createdate;//调查时间

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

    public Integer getOrder_studentId() {
        return order_studentId;
    }

    public void setOrder_studentId(Integer order_studentId) {
        this.order_studentId = order_studentId;
    }

    public String getOrder_city() {
        return order_city;
    }

    public void setOrder_city(String order_city) {
        this.order_city = order_city == null ? null : order_city.trim();
    }

    public String getOrder_job() {
        return order_job;
    }

    public void setOrder_job(String order_job) {
        this.order_job = order_job == null ? null : order_job.trim();
    }

    public Double getOrder_sal() {
        return order_sal;
    }

    public void setOrder_sal(Double order_sal) {
        this.order_sal = order_sal;
    }

    public String getOrder_recommend_city() {
        return order_recommend_city;
    }

    public void setOrder_recommend_city(String order_recommend_city) {
        this.order_recommend_city = order_recommend_city == null ? null : order_recommend_city.trim();
    }

    public Double getOrder_fixSal() {
        return order_fixSal;
    }

    public void setOrder_fixSal(Double order_fixSal) {
        this.order_fixSal = order_fixSal;
    }

    public Date getOrder_createdate() {
        return order_createdate;
    }

    public void setOrder_createdate(Date order_createdate) {
        this.order_createdate = order_createdate;
    }
}