package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybActivity {
    private Integer activity_id;//活动主键

    private String activity_class;//班级

    private String activity_figure;//参与人物

    private String activity_address;//地点

    private String activity_theme;//主题

    private String activity_type;//活动类型

    private String  activity_photoid;//照片

    private Date activity_time;//时间

    private String activity_remarks;//备注

    public Integer getActivity_id() {
        return activity_id;
    }

    public void setActivity_id(Integer activity_id) {
        this.activity_id = activity_id;
    }

    public String getActivity_class() {
        return activity_class;
    }

    public void setActivity_class(String activity_class) {
        this.activity_class = activity_class == null ? null : activity_class.trim();
    }

    public String getActivity_figure() {
        return activity_figure;
    }

    public void setActivity_figure(String activity_figure) {
        this.activity_figure = activity_figure == null ? null : activity_figure.trim();
    }

    public String getActivity_address() {
        return activity_address;
    }

    public void setActivity_address(String activity_address) {
        this.activity_address = activity_address == null ? null : activity_address.trim();
    }

    public String getActivity_theme() {
        return activity_theme;
    }

    public void setActivity_theme(String activity_theme) {
        this.activity_theme = activity_theme == null ? null : activity_theme.trim();
    }

    public String getActivity_type() {
        return activity_type;
    }

    public void setActivity_type(String activity_type) {
        this.activity_type = activity_type == null ? null : activity_type.trim();
    }

   

    public String getActivity_photoid() {
		return activity_photoid;
	}

	public void setActivity_photoid(String activity_photoid) {
		this.activity_photoid = activity_photoid;
	}

	public Date getActivity_time() {
        return activity_time;
    }

    public void setActivity_time(Date activity_time) {
        this.activity_time = activity_time;
    }

    public String getActivity_remarks() {
        return activity_remarks;
    }

    public void setActivity_remarks(String activity_remarks) {
        this.activity_remarks = activity_remarks == null ? null : activity_remarks.trim();
    }
}