package cn.tyyhoa.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class OaRlzybWorkorderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OaRlzybWorkorderExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andWorkOrder_idIsNull() {
            addCriterion("workOrder_id is null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idIsNotNull() {
            addCriterion("workOrder_id is not null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idEqualTo(Integer value) {
            addCriterion("workOrder_id =", value, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idNotEqualTo(Integer value) {
            addCriterion("workOrder_id <>", value, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idGreaterThan(Integer value) {
            addCriterion("workOrder_id >", value, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idGreaterThanOrEqualTo(Integer value) {
            addCriterion("workOrder_id >=", value, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idLessThan(Integer value) {
            addCriterion("workOrder_id <", value, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idLessThanOrEqualTo(Integer value) {
            addCriterion("workOrder_id <=", value, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idIn(List<Integer> values) {
            addCriterion("workOrder_id in", values, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idNotIn(List<Integer> values) {
            addCriterion("workOrder_id not in", values, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idBetween(Integer value1, Integer value2) {
            addCriterion("workOrder_id between", value1, value2, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_idNotBetween(Integer value1, Integer value2) {
            addCriterion("workOrder_id not between", value1, value2, "workOrder_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateIsNull() {
            addCriterion("workOrder_IssuedDate is null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateIsNotNull() {
            addCriterion("workOrder_IssuedDate is not null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateEqualTo(Date value) {
            addCriterionForJDBCDate("workOrder_IssuedDate =", value, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("workOrder_IssuedDate <>", value, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateGreaterThan(Date value) {
            addCriterionForJDBCDate("workOrder_IssuedDate >", value, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("workOrder_IssuedDate >=", value, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateLessThan(Date value) {
            addCriterionForJDBCDate("workOrder_IssuedDate <", value, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("workOrder_IssuedDate <=", value, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateIn(List<Date> values) {
            addCriterionForJDBCDate("workOrder_IssuedDate in", values, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("workOrder_IssuedDate not in", values, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("workOrder_IssuedDate between", value1, value2, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_IssuedDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("workOrder_IssuedDate not between", value1, value2, "workOrder_IssuedDate");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerIsNull() {
            addCriterion("workOrder_pointer is null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerIsNotNull() {
            addCriterion("workOrder_pointer is not null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerEqualTo(Integer value) {
            addCriterion("workOrder_pointer =", value, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerNotEqualTo(Integer value) {
            addCriterion("workOrder_pointer <>", value, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerGreaterThan(Integer value) {
            addCriterion("workOrder_pointer >", value, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerGreaterThanOrEqualTo(Integer value) {
            addCriterion("workOrder_pointer >=", value, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerLessThan(Integer value) {
            addCriterion("workOrder_pointer <", value, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerLessThanOrEqualTo(Integer value) {
            addCriterion("workOrder_pointer <=", value, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerIn(List<Integer> values) {
            addCriterion("workOrder_pointer in", values, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerNotIn(List<Integer> values) {
            addCriterion("workOrder_pointer not in", values, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerBetween(Integer value1, Integer value2) {
            addCriterion("workOrder_pointer between", value1, value2, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_pointerNotBetween(Integer value1, Integer value2) {
            addCriterion("workOrder_pointer not between", value1, value2, "workOrder_pointer");
            return (Criteria) this;
        }

        public Criteria andEmp_idIsNull() {
            addCriterion("emp_id is null");
            return (Criteria) this;
        }

        public Criteria andEmp_idIsNotNull() {
            addCriterion("emp_id is not null");
            return (Criteria) this;
        }

        public Criteria andEmp_idEqualTo(Integer value) {
            addCriterion("emp_id =", value, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idNotEqualTo(Integer value) {
            addCriterion("emp_id <>", value, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idGreaterThan(Integer value) {
            addCriterion("emp_id >", value, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idGreaterThanOrEqualTo(Integer value) {
            addCriterion("emp_id >=", value, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idLessThan(Integer value) {
            addCriterion("emp_id <", value, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idLessThanOrEqualTo(Integer value) {
            addCriterion("emp_id <=", value, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idIn(List<Integer> values) {
            addCriterion("emp_id in", values, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idNotIn(List<Integer> values) {
            addCriterion("emp_id not in", values, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idBetween(Integer value1, Integer value2) {
            addCriterion("emp_id between", value1, value2, "emp_id");
            return (Criteria) this;
        }

        public Criteria andEmp_idNotBetween(Integer value1, Integer value2) {
            addCriterion("emp_id not between", value1, value2, "emp_id");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageIsNull() {
            addCriterion("workOrder_percentage is null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageIsNotNull() {
            addCriterion("workOrder_percentage is not null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageEqualTo(Integer value) {
            addCriterion("workOrder_percentage =", value, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageNotEqualTo(Integer value) {
            addCriterion("workOrder_percentage <>", value, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageGreaterThan(Integer value) {
            addCriterion("workOrder_percentage >", value, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageGreaterThanOrEqualTo(Integer value) {
            addCriterion("workOrder_percentage >=", value, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageLessThan(Integer value) {
            addCriterion("workOrder_percentage <", value, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageLessThanOrEqualTo(Integer value) {
            addCriterion("workOrder_percentage <=", value, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageIn(List<Integer> values) {
            addCriterion("workOrder_percentage in", values, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageNotIn(List<Integer> values) {
            addCriterion("workOrder_percentage not in", values, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageBetween(Integer value1, Integer value2) {
            addCriterion("workOrder_percentage between", value1, value2, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_percentageNotBetween(Integer value1, Integer value2) {
            addCriterion("workOrder_percentage not between", value1, value2, "workOrder_percentage");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsIsNull() {
            addCriterion("workOrder_totalPoints is null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsIsNotNull() {
            addCriterion("workOrder_totalPoints is not null");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsEqualTo(Integer value) {
            addCriterion("workOrder_totalPoints =", value, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsNotEqualTo(Integer value) {
            addCriterion("workOrder_totalPoints <>", value, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsGreaterThan(Integer value) {
            addCriterion("workOrder_totalPoints >", value, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsGreaterThanOrEqualTo(Integer value) {
            addCriterion("workOrder_totalPoints >=", value, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsLessThan(Integer value) {
            addCriterion("workOrder_totalPoints <", value, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsLessThanOrEqualTo(Integer value) {
            addCriterion("workOrder_totalPoints <=", value, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsIn(List<Integer> values) {
            addCriterion("workOrder_totalPoints in", values, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsNotIn(List<Integer> values) {
            addCriterion("workOrder_totalPoints not in", values, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsBetween(Integer value1, Integer value2) {
            addCriterion("workOrder_totalPoints between", value1, value2, "workOrder_totalPoints");
            return (Criteria) this;
        }

        public Criteria andWorkOrder_totalPointsNotBetween(Integer value1, Integer value2) {
            addCriterion("workOrder_totalPoints not between", value1, value2, "workOrder_totalPoints");
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