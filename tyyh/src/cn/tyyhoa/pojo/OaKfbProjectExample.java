package cn.tyyhoa.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OaKfbProjectExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OaKfbProjectExample() {
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

        public Criteria andStartimeIsNull() {
            addCriterion("startime is null");
            return (Criteria) this;
        }

        public Criteria andStartimeIsNotNull() {
            addCriterion("startime is not null");
            return (Criteria) this;
        }

        public Criteria andStartimeEqualTo(Date value) {
            addCriterion("startime =", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeNotEqualTo(Date value) {
            addCriterion("startime <>", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeGreaterThan(Date value) {
            addCriterion("startime >", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeGreaterThanOrEqualTo(Date value) {
            addCriterion("startime >=", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeLessThan(Date value) {
            addCriterion("startime <", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeLessThanOrEqualTo(Date value) {
            addCriterion("startime <=", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeIn(List<Date> values) {
            addCriterion("startime in", values, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeNotIn(List<Date> values) {
            addCriterion("startime not in", values, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeBetween(Date value1, Date value2) {
            addCriterion("startime between", value1, value2, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeNotBetween(Date value1, Date value2) {
            addCriterion("startime not between", value1, value2, "startime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNull() {
            addCriterion("endtime is null");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNotNull() {
            addCriterion("endtime is not null");
            return (Criteria) this;
        }

        public Criteria andEndtimeEqualTo(Date value) {
            addCriterion("endtime =", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotEqualTo(Date value) {
            addCriterion("endtime <>", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThan(Date value) {
            addCriterion("endtime >", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("endtime >=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThan(Date value) {
            addCriterion("endtime <", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThanOrEqualTo(Date value) {
            addCriterion("endtime <=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIn(List<Date> values) {
            addCriterion("endtime in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotIn(List<Date> values) {
            addCriterion("endtime not in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeBetween(Date value1, Date value2) {
            addCriterion("endtime between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotBetween(Date value1, Date value2) {
            addCriterion("endtime not between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andIsfinishIsNull() {
            addCriterion("isfinish is null");
            return (Criteria) this;
        }

        public Criteria andIsfinishIsNotNull() {
            addCriterion("isfinish is not null");
            return (Criteria) this;
        }

        public Criteria andIsfinishEqualTo(Integer value) {
            addCriterion("isfinish =", value, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishNotEqualTo(Integer value) {
            addCriterion("isfinish <>", value, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishGreaterThan(Integer value) {
            addCriterion("isfinish >", value, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishGreaterThanOrEqualTo(Integer value) {
            addCriterion("isfinish >=", value, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishLessThan(Integer value) {
            addCriterion("isfinish <", value, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishLessThanOrEqualTo(Integer value) {
            addCriterion("isfinish <=", value, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishIn(List<Integer> values) {
            addCriterion("isfinish in", values, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishNotIn(List<Integer> values) {
            addCriterion("isfinish not in", values, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishBetween(Integer value1, Integer value2) {
            addCriterion("isfinish between", value1, value2, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsfinishNotBetween(Integer value1, Integer value2) {
            addCriterion("isfinish not between", value1, value2, "isfinish");
            return (Criteria) this;
        }

        public Criteria andIsworkIsNull() {
            addCriterion("iswork is null");
            return (Criteria) this;
        }

        public Criteria andIsworkIsNotNull() {
            addCriterion("iswork is not null");
            return (Criteria) this;
        }

        public Criteria andIsworkEqualTo(Integer value) {
            addCriterion("iswork =", value, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkNotEqualTo(Integer value) {
            addCriterion("iswork <>", value, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkGreaterThan(Integer value) {
            addCriterion("iswork >", value, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkGreaterThanOrEqualTo(Integer value) {
            addCriterion("iswork >=", value, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkLessThan(Integer value) {
            addCriterion("iswork <", value, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkLessThanOrEqualTo(Integer value) {
            addCriterion("iswork <=", value, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkIn(List<Integer> values) {
            addCriterion("iswork in", values, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkNotIn(List<Integer> values) {
            addCriterion("iswork not in", values, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkBetween(Integer value1, Integer value2) {
            addCriterion("iswork between", value1, value2, "iswork");
            return (Criteria) this;
        }

        public Criteria andIsworkNotBetween(Integer value1, Integer value2) {
            addCriterion("iswork not between", value1, value2, "iswork");
            return (Criteria) this;
        }

        public Criteria andFinallytimeIsNull() {
            addCriterion("finallytime is null");
            return (Criteria) this;
        }

        public Criteria andFinallytimeIsNotNull() {
            addCriterion("finallytime is not null");
            return (Criteria) this;
        }

        public Criteria andFinallytimeEqualTo(Date value) {
            addCriterion("finallytime =", value, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeNotEqualTo(Date value) {
            addCriterion("finallytime <>", value, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeGreaterThan(Date value) {
            addCriterion("finallytime >", value, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeGreaterThanOrEqualTo(Date value) {
            addCriterion("finallytime >=", value, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeLessThan(Date value) {
            addCriterion("finallytime <", value, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeLessThanOrEqualTo(Date value) {
            addCriterion("finallytime <=", value, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeIn(List<Date> values) {
            addCriterion("finallytime in", values, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeNotIn(List<Date> values) {
            addCriterion("finallytime not in", values, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeBetween(Date value1, Date value2) {
            addCriterion("finallytime between", value1, value2, "finallytime");
            return (Criteria) this;
        }

        public Criteria andFinallytimeNotBetween(Date value1, Date value2) {
            addCriterion("finallytime not between", value1, value2, "finallytime");
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

        public Criteria andStageidIsNull() {
            addCriterion("stageid is null");
            return (Criteria) this;
        }

        public Criteria andStageidIsNotNull() {
            addCriterion("stageid is not null");
            return (Criteria) this;
        }

        public Criteria andStageidEqualTo(Integer value) {
            addCriterion("stageid =", value, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidNotEqualTo(Integer value) {
            addCriterion("stageid <>", value, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidGreaterThan(Integer value) {
            addCriterion("stageid >", value, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidGreaterThanOrEqualTo(Integer value) {
            addCriterion("stageid >=", value, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidLessThan(Integer value) {
            addCriterion("stageid <", value, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidLessThanOrEqualTo(Integer value) {
            addCriterion("stageid <=", value, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidIn(List<Integer> values) {
            addCriterion("stageid in", values, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidNotIn(List<Integer> values) {
            addCriterion("stageid not in", values, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidBetween(Integer value1, Integer value2) {
            addCriterion("stageid between", value1, value2, "stageid");
            return (Criteria) this;
        }

        public Criteria andStageidNotBetween(Integer value1, Integer value2) {
            addCriterion("stageid not between", value1, value2, "stageid");
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