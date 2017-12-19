package cn.tyyhoa.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OakfbScoreExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OakfbScoreExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andUser_idIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUser_idIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUser_idEqualTo(Integer value) {
            addCriterion("user_id =", value, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idGreaterThan(Integer value) {
            addCriterion("user_id >", value, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idLessThan(Integer value) {
            addCriterion("user_id <", value, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idIn(List<Integer> values) {
            addCriterion("user_id in", values, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "user_id");
            return (Criteria) this;
        }

        public Criteria andUser_idNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "user_id");
            return (Criteria) this;
        }

        public Criteria andScoreIsNull() {
            addCriterion("score is null");
            return (Criteria) this;
        }

        public Criteria andScoreIsNotNull() {
            addCriterion("score is not null");
            return (Criteria) this;
        }

        public Criteria andScoreEqualTo(Integer value) {
            addCriterion("score =", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotEqualTo(Integer value) {
            addCriterion("score <>", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThan(Integer value) {
            addCriterion("score >", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("score >=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThan(Integer value) {
            addCriterion("score <", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThanOrEqualTo(Integer value) {
            addCriterion("score <=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreIn(List<Integer> values) {
            addCriterion("score in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotIn(List<Integer> values) {
            addCriterion("score not in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreBetween(Integer value1, Integer value2) {
            addCriterion("score between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("score not between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeIsNull() {
            addCriterion("updatetime is null");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeIsNotNull() {
            addCriterion("updatetime is not null");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeEqualTo(Date value) {
            addCriterion("updatetime =", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeNotEqualTo(Date value) {
            addCriterion("updatetime <>", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeGreaterThan(Date value) {
            addCriterion("updatetime >", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("updatetime >=", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeLessThan(Date value) {
            addCriterion("updatetime <", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeLessThanOrEqualTo(Date value) {
            addCriterion("updatetime <=", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeIn(List<Date> values) {
            addCriterion("updatetime in", values, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeNotIn(List<Date> values) {
            addCriterion("updatetime not in", values, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeBetween(Date value1, Date value2) {
            addCriterion("updatetime between", value1, value2, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeNotBetween(Date value1, Date value2) {
            addCriterion("updatetime not between", value1, value2, "updatetime");
            return (Criteria) this;
        }

        public Criteria andClocktimeIsNull() {
            addCriterion("clocktime is null");
            return (Criteria) this;
        }

        public Criteria andClocktimeIsNotNull() {
            addCriterion("clocktime is not null");
            return (Criteria) this;
        }

        public Criteria andClocktimeEqualTo(Date value) {
            addCriterion("clocktime =", value, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeNotEqualTo(Date value) {
            addCriterion("clocktime <>", value, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeGreaterThan(Date value) {
            addCriterion("clocktime >", value, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeGreaterThanOrEqualTo(Date value) {
            addCriterion("clocktime >=", value, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeLessThan(Date value) {
            addCriterion("clocktime <", value, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeLessThanOrEqualTo(Date value) {
            addCriterion("clocktime <=", value, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeIn(List<Date> values) {
            addCriterion("clocktime in", values, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeNotIn(List<Date> values) {
            addCriterion("clocktime not in", values, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeBetween(Date value1, Date value2) {
            addCriterion("clocktime between", value1, value2, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClocktimeNotBetween(Date value1, Date value2) {
            addCriterion("clocktime not between", value1, value2, "clocktime");
            return (Criteria) this;
        }

        public Criteria andClockstatusIsNull() {
            addCriterion("clockstatus is null");
            return (Criteria) this;
        }

        public Criteria andClockstatusIsNotNull() {
            addCriterion("clockstatus is not null");
            return (Criteria) this;
        }

        public Criteria andClockstatusEqualTo(Integer value) {
            addCriterion("clockstatus =", value, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusNotEqualTo(Integer value) {
            addCriterion("clockstatus <>", value, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusGreaterThan(Integer value) {
            addCriterion("clockstatus >", value, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("clockstatus >=", value, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusLessThan(Integer value) {
            addCriterion("clockstatus <", value, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusLessThanOrEqualTo(Integer value) {
            addCriterion("clockstatus <=", value, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusIn(List<Integer> values) {
            addCriterion("clockstatus in", values, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusNotIn(List<Integer> values) {
            addCriterion("clockstatus not in", values, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusBetween(Integer value1, Integer value2) {
            addCriterion("clockstatus between", value1, value2, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andClockstatusNotBetween(Integer value1, Integer value2) {
            addCriterion("clockstatus not between", value1, value2, "clockstatus");
            return (Criteria) this;
        }

        public Criteria andOuttiamIsNull() {
            addCriterion("outtiam is null");
            return (Criteria) this;
        }

        public Criteria andOuttiamIsNotNull() {
            addCriterion("outtiam is not null");
            return (Criteria) this;
        }

        public Criteria andOuttiamEqualTo(Date value) {
            addCriterion("outtiam =", value, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamNotEqualTo(Date value) {
            addCriterion("outtiam <>", value, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamGreaterThan(Date value) {
            addCriterion("outtiam >", value, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamGreaterThanOrEqualTo(Date value) {
            addCriterion("outtiam >=", value, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamLessThan(Date value) {
            addCriterion("outtiam <", value, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamLessThanOrEqualTo(Date value) {
            addCriterion("outtiam <=", value, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamIn(List<Date> values) {
            addCriterion("outtiam in", values, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamNotIn(List<Date> values) {
            addCriterion("outtiam not in", values, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamBetween(Date value1, Date value2) {
            addCriterion("outtiam between", value1, value2, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOuttiamNotBetween(Date value1, Date value2) {
            addCriterion("outtiam not between", value1, value2, "outtiam");
            return (Criteria) this;
        }

        public Criteria andOutstatusIsNull() {
            addCriterion("outstatus is null");
            return (Criteria) this;
        }

        public Criteria andOutstatusIsNotNull() {
            addCriterion("outstatus is not null");
            return (Criteria) this;
        }

        public Criteria andOutstatusEqualTo(Integer value) {
            addCriterion("outstatus =", value, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusNotEqualTo(Integer value) {
            addCriterion("outstatus <>", value, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusGreaterThan(Integer value) {
            addCriterion("outstatus >", value, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("outstatus >=", value, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusLessThan(Integer value) {
            addCriterion("outstatus <", value, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusLessThanOrEqualTo(Integer value) {
            addCriterion("outstatus <=", value, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusIn(List<Integer> values) {
            addCriterion("outstatus in", values, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusNotIn(List<Integer> values) {
            addCriterion("outstatus not in", values, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusBetween(Integer value1, Integer value2) {
            addCriterion("outstatus between", value1, value2, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOutstatusNotBetween(Integer value1, Integer value2) {
            addCriterion("outstatus not between", value1, value2, "outstatus");
            return (Criteria) this;
        }

        public Criteria andOperationidIsNull() {
            addCriterion("operationid is null");
            return (Criteria) this;
        }

        public Criteria andOperationidIsNotNull() {
            addCriterion("operationid is not null");
            return (Criteria) this;
        }

        public Criteria andOperationidEqualTo(Integer value) {
            addCriterion("operationid =", value, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidNotEqualTo(Integer value) {
            addCriterion("operationid <>", value, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidGreaterThan(Integer value) {
            addCriterion("operationid >", value, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidGreaterThanOrEqualTo(Integer value) {
            addCriterion("operationid >=", value, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidLessThan(Integer value) {
            addCriterion("operationid <", value, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidLessThanOrEqualTo(Integer value) {
            addCriterion("operationid <=", value, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidIn(List<Integer> values) {
            addCriterion("operationid in", values, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidNotIn(List<Integer> values) {
            addCriterion("operationid not in", values, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidBetween(Integer value1, Integer value2) {
            addCriterion("operationid between", value1, value2, "operationid");
            return (Criteria) this;
        }

        public Criteria andOperationidNotBetween(Integer value1, Integer value2) {
            addCriterion("operationid not between", value1, value2, "operationid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}