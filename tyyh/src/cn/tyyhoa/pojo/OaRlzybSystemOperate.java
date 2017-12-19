package cn.tyyhoa.pojo;

import java.util.Date;

public class OaRlzybSystemOperate {
    private Integer system_operate_id;//编号

    private String system_operate_operator;//操作人

    private String system_operate_type;//操作类型

    private String system_operate_operateTable;//被操作表

    private String system_operate_operateTableId;//被操作记录主id

    private Date system_operate_date;//操作时间

    public Integer getSystem_operate_id() {
        return system_operate_id;
    }

    public void setSystem_operate_id(Integer system_operate_id) {
        this.system_operate_id = system_operate_id;
    }

    public String getSystem_operate_operator() {
        return system_operate_operator;
    }

    public void setSystem_operate_operator(String system_operate_operator) {
        this.system_operate_operator = system_operate_operator == null ? null : system_operate_operator.trim();
    }

    public String getSystem_operate_type() {
        return system_operate_type;
    }

    public void setSystem_operate_type(String system_operate_type) {
        this.system_operate_type = system_operate_type == null ? null : system_operate_type.trim();
    }

    public String getSystem_operate_operateTable() {
        return system_operate_operateTable;
    }

    public void setSystem_operate_operateTable(String system_operate_operateTable) {
        this.system_operate_operateTable = system_operate_operateTable == null ? null : system_operate_operateTable.trim();
    }

    public String getSystem_operate_operateTableId() {
        return system_operate_operateTableId;
    }

    public void setSystem_operate_operateTableId(String system_operate_operateTableId) {
        this.system_operate_operateTableId = system_operate_operateTableId == null ? null : system_operate_operateTableId.trim();
    }

    public Date getSystem_operate_date() {
        return system_operate_date;
    }

    public void setSystem_operate_date(Date system_operate_date) {
        this.system_operate_date = system_operate_date;
    }
}