package cn.tyyhoa.pojo;

import java.util.Date;

public class OaJzbDailyschedule {
    private Integer dailyschedule_id;//日报表巡班记录id

    private Date starttime;//开始时间

    private Date outtime;//结束时间

    private Date entrytime;//录入时间

    private String contentsoftheclass;//巡班内容

    private Integer classteacher_id;//班主任id

    public Integer getDailyschedule_id() {
        return dailyschedule_id;
    }

    public void setDailyschedule_id(Integer dailyschedule_id) {
        this.dailyschedule_id = dailyschedule_id;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getOuttime() {
        return outtime;
    }

    public void setOuttime(Date outtime) {
        this.outtime = outtime;
    }

    public Date getEntrytime() {
        return entrytime;
    }

    public void setEntrytime(Date entrytime) {
        this.entrytime = entrytime;
    }

    public String getContentsoftheclass() {
        return contentsoftheclass;
    }

    public void setContentsoftheclass(String contentsoftheclass) {
        this.contentsoftheclass = contentsoftheclass == null ? null : contentsoftheclass.trim();
    }

    public Integer getClassteacher_id() {
        return classteacher_id;
    }

    public void setClassteacher_id(Integer classteacher_id) {
        this.classteacher_id = classteacher_id;
    }
}