package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJybPhoto {
    private Integer photo_id;//照片库主键

    private String photo_name;//照片名字

    private String photo_localpath;//照片本机路径

    private String photo_serverpath;//照片服务器路径

    private String photo_type;//照片所属类型

    private Integer photo_parentid;//照片所属父级

    private Date photo_uploadtime;//上传时间

    public Integer getPhoto_id() {
        return photo_id;
    }

    public void setPhoto_id(Integer photo_id) {
        this.photo_id = photo_id;
    }

    public String getPhoto_name() {
        return photo_name;
    }

    public void setPhoto_name(String photo_name) {
        this.photo_name = photo_name == null ? null : photo_name.trim();
    }

    public String getPhoto_localpath() {
        return photo_localpath;
    }

    public void setPhoto_localpath(String photo_localpath) {
        this.photo_localpath = photo_localpath == null ? null : photo_localpath.trim();
    }

    public String getPhoto_serverpath() {
        return photo_serverpath;
    }

    public void setPhoto_serverpath(String photo_serverpath) {
        this.photo_serverpath = photo_serverpath == null ? null : photo_serverpath.trim();
    }

    public String getPhoto_type() {
        return photo_type;
    }

    public void setPhoto_type(String photo_type) {
        this.photo_type = photo_type == null ? null : photo_type.trim();
    }

    public Integer getPhoto_parentid() {
        return photo_parentid;
    }

    public void setPhoto_parentid(Integer photo_parentid) {
        this.photo_parentid = photo_parentid;
    }

    public Date getPhoto_uploadtime() {
        return photo_uploadtime;
    }

    public void setPhoto_uploadtime(Date photo_uploadtime) {
        this.photo_uploadtime = photo_uploadtime;
    }
}