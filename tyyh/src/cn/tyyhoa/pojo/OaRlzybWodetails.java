package cn.tyyhoa.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OaRlzybWodetails {
    private Integer wodetails_id;

    private Integer workOrder_id;

    private String wodetails_item;

    private String wodetails_content;

    private String wodetails_method;

    private String wodetails_criteria;
    @JsonFormat(pattern = "yyyy-MM-dd", locale = "zh", timezone = "GMT+8")
    private Date wodetails_finishDate;

    private Integer wodetails_percentage;

    private Integer wodetails_points;
    
    

    @Override
	public String toString() {
		return "OaRlzybWodetails [wodetails_id=" + wodetails_id + ", workOrder_id=" + workOrder_id + ", wodetails_item="
				+ wodetails_item + ", wodetails_content=" + wodetails_content + ", wodetails_method=" + wodetails_method
				+ ", wodetails_criteria=" + wodetails_criteria + ", wodetails_finishDate=" + wodetails_finishDate
				+ ", wodetails_percentage=" + wodetails_percentage + ", wodetails_points=" + wodetails_points + "]";
	}

	public Integer getWodetails_id() {
        return wodetails_id;
    }

    public void setWodetails_id(Integer wodetails_id) {
        this.wodetails_id = wodetails_id;
    }

    public Integer getWorkOrder_id() {
        return workOrder_id;
    }

    public void setWorkOrder_id(Integer workOrder_id) {
        this.workOrder_id = workOrder_id;
    }

    public String getWodetails_item() {
        return wodetails_item;
    }

    public void setWodetails_item(String wodetails_item) {
        this.wodetails_item = wodetails_item == null ? null : wodetails_item.trim();
    }

    public String getWodetails_content() {
        return wodetails_content;
    }

    public void setWodetails_content(String wodetails_content) {
        this.wodetails_content = wodetails_content == null ? null : wodetails_content.trim();
    }

    public String getWodetails_method() {
        return wodetails_method;
    }

    public void setWodetails_method(String wodetails_method) {
        this.wodetails_method = wodetails_method == null ? null : wodetails_method.trim();
    }

    public String getWodetails_criteria() {
        return wodetails_criteria;
    }

    public void setWodetails_criteria(String wodetails_criteria) {
        this.wodetails_criteria = wodetails_criteria == null ? null : wodetails_criteria.trim();
    }

    public Date getWodetails_finishDate() {
        return wodetails_finishDate;
    }

    public void setWodetails_finishDate(Date wodetails_finishDate) {
        this.wodetails_finishDate = wodetails_finishDate;
    }

    public Integer getWodetails_percentage() {
        return wodetails_percentage;
    }

    public void setWodetails_percentage(Integer wodetails_percentage) {
        this.wodetails_percentage = wodetails_percentage;
    }

    public Integer getWodetails_points() {
        return wodetails_points;
    }

    public void setWodetails_points(Integer wodetails_points) {
        this.wodetails_points = wodetails_points;
    }
}