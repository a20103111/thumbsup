package com.thumbsup.dto;

import java.util.ArrayList;
import java.util.List;

public class TClassExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TClassExample() {
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

        public Criteria andClassIdIsNull() {
            addCriterion("class_id is null");
            return (Criteria) this;
        }

        public Criteria andClassIdIsNotNull() {
            addCriterion("class_id is not null");
            return (Criteria) this;
        }

        public Criteria andClassIdEqualTo(Integer value) {
            addCriterion("class_id =", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotEqualTo(Integer value) {
            addCriterion("class_id <>", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdGreaterThan(Integer value) {
            addCriterion("class_id >", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("class_id >=", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdLessThan(Integer value) {
            addCriterion("class_id <", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdLessThanOrEqualTo(Integer value) {
            addCriterion("class_id <=", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdIn(List<Integer> values) {
            addCriterion("class_id in", values, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotIn(List<Integer> values) {
            addCriterion("class_id not in", values, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdBetween(Integer value1, Integer value2) {
            addCriterion("class_id between", value1, value2, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotBetween(Integer value1, Integer value2) {
            addCriterion("class_id not between", value1, value2, "classId");
            return (Criteria) this;
        }

        public Criteria andClassNameIsNull() {
            addCriterion("class_name is null");
            return (Criteria) this;
        }

        public Criteria andClassNameIsNotNull() {
            addCriterion("class_name is not null");
            return (Criteria) this;
        }

        public Criteria andClassNameEqualTo(String value) {
            addCriterion("class_name =", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameNotEqualTo(String value) {
            addCriterion("class_name <>", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameGreaterThan(String value) {
            addCriterion("class_name >", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameGreaterThanOrEqualTo(String value) {
            addCriterion("class_name >=", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameLessThan(String value) {
            addCriterion("class_name <", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameLessThanOrEqualTo(String value) {
            addCriterion("class_name <=", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameLike(String value) {
            addCriterion("class_name like", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameNotLike(String value) {
            addCriterion("class_name not like", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameIn(List<String> values) {
            addCriterion("class_name in", values, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameNotIn(List<String> values) {
            addCriterion("class_name not in", values, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameBetween(String value1, String value2) {
            addCriterion("class_name between", value1, value2, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameNotBetween(String value1, String value2) {
            addCriterion("class_name not between", value1, value2, "className");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeIsNull() {
            addCriterion("class_createtime is null");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeIsNotNull() {
            addCriterion("class_createtime is not null");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeEqualTo(String value) {
            addCriterion("class_createtime =", value, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeNotEqualTo(String value) {
            addCriterion("class_createtime <>", value, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeGreaterThan(String value) {
            addCriterion("class_createtime >", value, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeGreaterThanOrEqualTo(String value) {
            addCriterion("class_createtime >=", value, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeLessThan(String value) {
            addCriterion("class_createtime <", value, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeLessThanOrEqualTo(String value) {
            addCriterion("class_createtime <=", value, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeLike(String value) {
            addCriterion("class_createtime like", value, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeNotLike(String value) {
            addCriterion("class_createtime not like", value, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeIn(List<String> values) {
            addCriterion("class_createtime in", values, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeNotIn(List<String> values) {
            addCriterion("class_createtime not in", values, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeBetween(String value1, String value2) {
            addCriterion("class_createtime between", value1, value2, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassCreatetimeNotBetween(String value1, String value2) {
            addCriterion("class_createtime not between", value1, value2, "classCreatetime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeIsNull() {
            addCriterion("class_endtime is null");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeIsNotNull() {
            addCriterion("class_endtime is not null");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeEqualTo(String value) {
            addCriterion("class_endtime =", value, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeNotEqualTo(String value) {
            addCriterion("class_endtime <>", value, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeGreaterThan(String value) {
            addCriterion("class_endtime >", value, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeGreaterThanOrEqualTo(String value) {
            addCriterion("class_endtime >=", value, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeLessThan(String value) {
            addCriterion("class_endtime <", value, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeLessThanOrEqualTo(String value) {
            addCriterion("class_endtime <=", value, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeLike(String value) {
            addCriterion("class_endtime like", value, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeNotLike(String value) {
            addCriterion("class_endtime not like", value, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeIn(List<String> values) {
            addCriterion("class_endtime in", values, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeNotIn(List<String> values) {
            addCriterion("class_endtime not in", values, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeBetween(String value1, String value2) {
            addCriterion("class_endtime between", value1, value2, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassEndtimeNotBetween(String value1, String value2) {
            addCriterion("class_endtime not between", value1, value2, "classEndtime");
            return (Criteria) this;
        }

        public Criteria andClassNumbersIsNull() {
            addCriterion("class_numbers is null");
            return (Criteria) this;
        }

        public Criteria andClassNumbersIsNotNull() {
            addCriterion("class_numbers is not null");
            return (Criteria) this;
        }

        public Criteria andClassNumbersEqualTo(Integer value) {
            addCriterion("class_numbers =", value, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersNotEqualTo(Integer value) {
            addCriterion("class_numbers <>", value, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersGreaterThan(Integer value) {
            addCriterion("class_numbers >", value, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersGreaterThanOrEqualTo(Integer value) {
            addCriterion("class_numbers >=", value, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersLessThan(Integer value) {
            addCriterion("class_numbers <", value, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersLessThanOrEqualTo(Integer value) {
            addCriterion("class_numbers <=", value, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersIn(List<Integer> values) {
            addCriterion("class_numbers in", values, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersNotIn(List<Integer> values) {
            addCriterion("class_numbers not in", values, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersBetween(Integer value1, Integer value2) {
            addCriterion("class_numbers between", value1, value2, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassNumbersNotBetween(Integer value1, Integer value2) {
            addCriterion("class_numbers not between", value1, value2, "classNumbers");
            return (Criteria) this;
        }

        public Criteria andClassTypeIsNull() {
            addCriterion("class_type is null");
            return (Criteria) this;
        }

        public Criteria andClassTypeIsNotNull() {
            addCriterion("class_type is not null");
            return (Criteria) this;
        }

        public Criteria andClassTypeEqualTo(Integer value) {
            addCriterion("class_type =", value, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeNotEqualTo(Integer value) {
            addCriterion("class_type <>", value, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeGreaterThan(Integer value) {
            addCriterion("class_type >", value, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("class_type >=", value, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeLessThan(Integer value) {
            addCriterion("class_type <", value, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeLessThanOrEqualTo(Integer value) {
            addCriterion("class_type <=", value, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeIn(List<Integer> values) {
            addCriterion("class_type in", values, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeNotIn(List<Integer> values) {
            addCriterion("class_type not in", values, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeBetween(Integer value1, Integer value2) {
            addCriterion("class_type between", value1, value2, "classType");
            return (Criteria) this;
        }

        public Criteria andClassTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("class_type not between", value1, value2, "classType");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherIsNull() {
            addCriterion("class_fromteacher is null");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherIsNotNull() {
            addCriterion("class_fromteacher is not null");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherEqualTo(Integer value) {
            addCriterion("class_fromteacher =", value, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherNotEqualTo(Integer value) {
            addCriterion("class_fromteacher <>", value, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherGreaterThan(Integer value) {
            addCriterion("class_fromteacher >", value, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherGreaterThanOrEqualTo(Integer value) {
            addCriterion("class_fromteacher >=", value, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherLessThan(Integer value) {
            addCriterion("class_fromteacher <", value, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherLessThanOrEqualTo(Integer value) {
            addCriterion("class_fromteacher <=", value, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherIn(List<Integer> values) {
            addCriterion("class_fromteacher in", values, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherNotIn(List<Integer> values) {
            addCriterion("class_fromteacher not in", values, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherBetween(Integer value1, Integer value2) {
            addCriterion("class_fromteacher between", value1, value2, "classFromteacher");
            return (Criteria) this;
        }

        public Criteria andClassFromteacherNotBetween(Integer value1, Integer value2) {
            addCriterion("class_fromteacher not between", value1, value2, "classFromteacher");
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