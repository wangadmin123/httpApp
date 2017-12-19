package cn.tyyhoa.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class OaRlzybWodetailsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OaRlzybWodetailsExample() {
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

        public Criteria andWodetails_idIsNull() {
            addCriterion("wodetails_id is null");
            return (Criteria) this;
        }

        public Criteria andWodetails_idIsNotNull() {
            addCriterion("wodetails_id is not null");
            return (Criteria) this;
        }

        public Criteria andWodetails_idEqualTo(Integer value) {
            addCriterion("wodetails_id =", value, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idNotEqualTo(Integer value) {
            addCriterion("wodetails_id <>", value, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idGreaterThan(Integer value) {
            addCriterion("wodetails_id >", value, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idGreaterThanOrEqualTo(Integer value) {
            addCriterion("wodetails_id >=", value, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idLessThan(Integer value) {
            addCriterion("wodetails_id <", value, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idLessThanOrEqualTo(Integer value) {
            addCriterion("wodetails_id <=", value, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idIn(List<Integer> values) {
            addCriterion("wodetails_id in", values, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idNotIn(List<Integer> values) {
            addCriterion("wodetails_id not in", values, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idBetween(Integer value1, Integer value2) {
            addCriterion("wodetails_id between", value1, value2, "wodetails_id");
            return (Criteria) this;
        }

        public Criteria andWodetails_idNotBetween(Integer value1, Integer value2) {
            addCriterion("wodetails_id not between", value1, value2, "wodetails_id");
            return (Criteria) this;
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

        public Criteria andWodetails_itemIsNull() {
            addCriterion("wodetails_item is null");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemIsNotNull() {
            addCriterion("wodetails_item is not null");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemEqualTo(String value) {
            addCriterion("wodetails_item =", value, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemNotEqualTo(String value) {
            addCriterion("wodetails_item <>", value, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemGreaterThan(String value) {
            addCriterion("wodetails_item >", value, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemGreaterThanOrEqualTo(String value) {
            addCriterion("wodetails_item >=", value, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemLessThan(String value) {
            addCriterion("wodetails_item <", value, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemLessThanOrEqualTo(String value) {
            addCriterion("wodetails_item <=", value, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemLike(String value) {
            addCriterion("wodetails_item like", value, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemNotLike(String value) {
            addCriterion("wodetails_item not like", value, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemIn(List<String> values) {
            addCriterion("wodetails_item in", values, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemNotIn(List<String> values) {
            addCriterion("wodetails_item not in", values, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemBetween(String value1, String value2) {
            addCriterion("wodetails_item between", value1, value2, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_itemNotBetween(String value1, String value2) {
            addCriterion("wodetails_item not between", value1, value2, "wodetails_item");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentIsNull() {
            addCriterion("wodetails_content is null");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentIsNotNull() {
            addCriterion("wodetails_content is not null");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentEqualTo(String value) {
            addCriterion("wodetails_content =", value, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentNotEqualTo(String value) {
            addCriterion("wodetails_content <>", value, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentGreaterThan(String value) {
            addCriterion("wodetails_content >", value, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentGreaterThanOrEqualTo(String value) {
            addCriterion("wodetails_content >=", value, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentLessThan(String value) {
            addCriterion("wodetails_content <", value, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentLessThanOrEqualTo(String value) {
            addCriterion("wodetails_content <=", value, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentLike(String value) {
            addCriterion("wodetails_content like", value, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentNotLike(String value) {
            addCriterion("wodetails_content not like", value, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentIn(List<String> values) {
            addCriterion("wodetails_content in", values, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentNotIn(List<String> values) {
            addCriterion("wodetails_content not in", values, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentBetween(String value1, String value2) {
            addCriterion("wodetails_content between", value1, value2, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_contentNotBetween(String value1, String value2) {
            addCriterion("wodetails_content not between", value1, value2, "wodetails_content");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodIsNull() {
            addCriterion("wodetails_method is null");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodIsNotNull() {
            addCriterion("wodetails_method is not null");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodEqualTo(String value) {
            addCriterion("wodetails_method =", value, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodNotEqualTo(String value) {
            addCriterion("wodetails_method <>", value, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodGreaterThan(String value) {
            addCriterion("wodetails_method >", value, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodGreaterThanOrEqualTo(String value) {
            addCriterion("wodetails_method >=", value, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodLessThan(String value) {
            addCriterion("wodetails_method <", value, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodLessThanOrEqualTo(String value) {
            addCriterion("wodetails_method <=", value, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodLike(String value) {
            addCriterion("wodetails_method like", value, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodNotLike(String value) {
            addCriterion("wodetails_method not like", value, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodIn(List<String> values) {
            addCriterion("wodetails_method in", values, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodNotIn(List<String> values) {
            addCriterion("wodetails_method not in", values, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodBetween(String value1, String value2) {
            addCriterion("wodetails_method between", value1, value2, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_methodNotBetween(String value1, String value2) {
            addCriterion("wodetails_method not between", value1, value2, "wodetails_method");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaIsNull() {
            addCriterion("wodetails_criteria is null");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaIsNotNull() {
            addCriterion("wodetails_criteria is not null");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaEqualTo(String value) {
            addCriterion("wodetails_criteria =", value, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaNotEqualTo(String value) {
            addCriterion("wodetails_criteria <>", value, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaGreaterThan(String value) {
            addCriterion("wodetails_criteria >", value, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaGreaterThanOrEqualTo(String value) {
            addCriterion("wodetails_criteria >=", value, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaLessThan(String value) {
            addCriterion("wodetails_criteria <", value, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaLessThanOrEqualTo(String value) {
            addCriterion("wodetails_criteria <=", value, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaLike(String value) {
            addCriterion("wodetails_criteria like", value, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaNotLike(String value) {
            addCriterion("wodetails_criteria not like", value, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaIn(List<String> values) {
            addCriterion("wodetails_criteria in", values, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaNotIn(List<String> values) {
            addCriterion("wodetails_criteria not in", values, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaBetween(String value1, String value2) {
            addCriterion("wodetails_criteria between", value1, value2, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_criteriaNotBetween(String value1, String value2) {
            addCriterion("wodetails_criteria not between", value1, value2, "wodetails_criteria");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateIsNull() {
            addCriterion("wodetails_finishDate is null");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateIsNotNull() {
            addCriterion("wodetails_finishDate is not null");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateEqualTo(Date value) {
            addCriterionForJDBCDate("wodetails_finishDate =", value, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("wodetails_finishDate <>", value, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateGreaterThan(Date value) {
            addCriterionForJDBCDate("wodetails_finishDate >", value, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("wodetails_finishDate >=", value, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateLessThan(Date value) {
            addCriterionForJDBCDate("wodetails_finishDate <", value, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("wodetails_finishDate <=", value, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateIn(List<Date> values) {
            addCriterionForJDBCDate("wodetails_finishDate in", values, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("wodetails_finishDate not in", values, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("wodetails_finishDate between", value1, value2, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_finishDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("wodetails_finishDate not between", value1, value2, "wodetails_finishDate");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageIsNull() {
            addCriterion("wodetails_percentage is null");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageIsNotNull() {
            addCriterion("wodetails_percentage is not null");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageEqualTo(Integer value) {
            addCriterion("wodetails_percentage =", value, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageNotEqualTo(Integer value) {
            addCriterion("wodetails_percentage <>", value, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageGreaterThan(Integer value) {
            addCriterion("wodetails_percentage >", value, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageGreaterThanOrEqualTo(Integer value) {
            addCriterion("wodetails_percentage >=", value, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageLessThan(Integer value) {
            addCriterion("wodetails_percentage <", value, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageLessThanOrEqualTo(Integer value) {
            addCriterion("wodetails_percentage <=", value, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageIn(List<Integer> values) {
            addCriterion("wodetails_percentage in", values, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageNotIn(List<Integer> values) {
            addCriterion("wodetails_percentage not in", values, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageBetween(Integer value1, Integer value2) {
            addCriterion("wodetails_percentage between", value1, value2, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_percentageNotBetween(Integer value1, Integer value2) {
            addCriterion("wodetails_percentage not between", value1, value2, "wodetails_percentage");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsIsNull() {
            addCriterion("wodetails_points is null");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsIsNotNull() {
            addCriterion("wodetails_points is not null");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsEqualTo(Integer value) {
            addCriterion("wodetails_points =", value, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsNotEqualTo(Integer value) {
            addCriterion("wodetails_points <>", value, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsGreaterThan(Integer value) {
            addCriterion("wodetails_points >", value, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsGreaterThanOrEqualTo(Integer value) {
            addCriterion("wodetails_points >=", value, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsLessThan(Integer value) {
            addCriterion("wodetails_points <", value, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsLessThanOrEqualTo(Integer value) {
            addCriterion("wodetails_points <=", value, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsIn(List<Integer> values) {
            addCriterion("wodetails_points in", values, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsNotIn(List<Integer> values) {
            addCriterion("wodetails_points not in", values, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsBetween(Integer value1, Integer value2) {
            addCriterion("wodetails_points between", value1, value2, "wodetails_points");
            return (Criteria) this;
        }

        public Criteria andWodetails_pointsNotBetween(Integer value1, Integer value2) {
            addCriterion("wodetails_points not between", value1, value2, "wodetails_points");
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