package com.thumbsup.dto;

import java.util.ArrayList;
import java.util.List;

public class TStudentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TStudentExample() {
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

        public Criteria andStudentIdIsNull() {
            addCriterion("student_id is null");
            return (Criteria) this;
        }

        public Criteria andStudentIdIsNotNull() {
            addCriterion("student_id is not null");
            return (Criteria) this;
        }

        public Criteria andStudentIdEqualTo(Integer value) {
            addCriterion("student_id =", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotEqualTo(Integer value) {
            addCriterion("student_id <>", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdGreaterThan(Integer value) {
            addCriterion("student_id >", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("student_id >=", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdLessThan(Integer value) {
            addCriterion("student_id <", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdLessThanOrEqualTo(Integer value) {
            addCriterion("student_id <=", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdIn(List<Integer> values) {
            addCriterion("student_id in", values, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotIn(List<Integer> values) {
            addCriterion("student_id not in", values, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdBetween(Integer value1, Integer value2) {
            addCriterion("student_id between", value1, value2, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("student_id not between", value1, value2, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentNameIsNull() {
            addCriterion("student_name is null");
            return (Criteria) this;
        }

        public Criteria andStudentNameIsNotNull() {
            addCriterion("student_name is not null");
            return (Criteria) this;
        }

        public Criteria andStudentNameEqualTo(String value) {
            addCriterion("student_name =", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotEqualTo(String value) {
            addCriterion("student_name <>", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameGreaterThan(String value) {
            addCriterion("student_name >", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameGreaterThanOrEqualTo(String value) {
            addCriterion("student_name >=", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLessThan(String value) {
            addCriterion("student_name <", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLessThanOrEqualTo(String value) {
            addCriterion("student_name <=", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLike(String value) {
            addCriterion("student_name like", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotLike(String value) {
            addCriterion("student_name not like", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameIn(List<String> values) {
            addCriterion("student_name in", values, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotIn(List<String> values) {
            addCriterion("student_name not in", values, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameBetween(String value1, String value2) {
            addCriterion("student_name between", value1, value2, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotBetween(String value1, String value2) {
            addCriterion("student_name not between", value1, value2, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentClassidIsNull() {
            addCriterion("student_classid is null");
            return (Criteria) this;
        }

        public Criteria andStudentClassidIsNotNull() {
            addCriterion("student_classid is not null");
            return (Criteria) this;
        }

        public Criteria andStudentClassidEqualTo(Integer value) {
            addCriterion("student_classid =", value, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidNotEqualTo(Integer value) {
            addCriterion("student_classid <>", value, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidGreaterThan(Integer value) {
            addCriterion("student_classid >", value, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidGreaterThanOrEqualTo(Integer value) {
            addCriterion("student_classid >=", value, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidLessThan(Integer value) {
            addCriterion("student_classid <", value, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidLessThanOrEqualTo(Integer value) {
            addCriterion("student_classid <=", value, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidIn(List<Integer> values) {
            addCriterion("student_classid in", values, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidNotIn(List<Integer> values) {
            addCriterion("student_classid not in", values, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidBetween(Integer value1, Integer value2) {
            addCriterion("student_classid between", value1, value2, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentClassidNotBetween(Integer value1, Integer value2) {
            addCriterion("student_classid not between", value1, value2, "studentClassid");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeIsNull() {
            addCriterion("student_createtime is null");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeIsNotNull() {
            addCriterion("student_createtime is not null");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeEqualTo(String value) {
            addCriterion("student_createtime =", value, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeNotEqualTo(String value) {
            addCriterion("student_createtime <>", value, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeGreaterThan(String value) {
            addCriterion("student_createtime >", value, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeGreaterThanOrEqualTo(String value) {
            addCriterion("student_createtime >=", value, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeLessThan(String value) {
            addCriterion("student_createtime <", value, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeLessThanOrEqualTo(String value) {
            addCriterion("student_createtime <=", value, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeLike(String value) {
            addCriterion("student_createtime like", value, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeNotLike(String value) {
            addCriterion("student_createtime not like", value, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeIn(List<String> values) {
            addCriterion("student_createtime in", values, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeNotIn(List<String> values) {
            addCriterion("student_createtime not in", values, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeBetween(String value1, String value2) {
            addCriterion("student_createtime between", value1, value2, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentCreatetimeNotBetween(String value1, String value2) {
            addCriterion("student_createtime not between", value1, value2, "studentCreatetime");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneIsNull() {
            addCriterion("student_phone is null");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneIsNotNull() {
            addCriterion("student_phone is not null");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneEqualTo(String value) {
            addCriterion("student_phone =", value, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneNotEqualTo(String value) {
            addCriterion("student_phone <>", value, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneGreaterThan(String value) {
            addCriterion("student_phone >", value, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("student_phone >=", value, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneLessThan(String value) {
            addCriterion("student_phone <", value, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneLessThanOrEqualTo(String value) {
            addCriterion("student_phone <=", value, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneLike(String value) {
            addCriterion("student_phone like", value, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneNotLike(String value) {
            addCriterion("student_phone not like", value, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneIn(List<String> values) {
            addCriterion("student_phone in", values, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneNotIn(List<String> values) {
            addCriterion("student_phone not in", values, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneBetween(String value1, String value2) {
            addCriterion("student_phone between", value1, value2, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentPhoneNotBetween(String value1, String value2) {
            addCriterion("student_phone not between", value1, value2, "studentPhone");
            return (Criteria) this;
        }

        public Criteria andStudentCourseIsNull() {
            addCriterion("student_course is null");
            return (Criteria) this;
        }

        public Criteria andStudentCourseIsNotNull() {
            addCriterion("student_course is not null");
            return (Criteria) this;
        }

        public Criteria andStudentCourseEqualTo(String value) {
            addCriterion("student_course =", value, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseNotEqualTo(String value) {
            addCriterion("student_course <>", value, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseGreaterThan(String value) {
            addCriterion("student_course >", value, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseGreaterThanOrEqualTo(String value) {
            addCriterion("student_course >=", value, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseLessThan(String value) {
            addCriterion("student_course <", value, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseLessThanOrEqualTo(String value) {
            addCriterion("student_course <=", value, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseLike(String value) {
            addCriterion("student_course like", value, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseNotLike(String value) {
            addCriterion("student_course not like", value, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseIn(List<String> values) {
            addCriterion("student_course in", values, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseNotIn(List<String> values) {
            addCriterion("student_course not in", values, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseBetween(String value1, String value2) {
            addCriterion("student_course between", value1, value2, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentCourseNotBetween(String value1, String value2) {
            addCriterion("student_course not between", value1, value2, "studentCourse");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherIsNull() {
            addCriterion("student_fromteacher is null");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherIsNotNull() {
            addCriterion("student_fromteacher is not null");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherEqualTo(Integer value) {
            addCriterion("student_fromteacher =", value, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherNotEqualTo(Integer value) {
            addCriterion("student_fromteacher <>", value, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherGreaterThan(Integer value) {
            addCriterion("student_fromteacher >", value, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherGreaterThanOrEqualTo(Integer value) {
            addCriterion("student_fromteacher >=", value, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherLessThan(Integer value) {
            addCriterion("student_fromteacher <", value, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherLessThanOrEqualTo(Integer value) {
            addCriterion("student_fromteacher <=", value, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherIn(List<Integer> values) {
            addCriterion("student_fromteacher in", values, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherNotIn(List<Integer> values) {
            addCriterion("student_fromteacher not in", values, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherBetween(Integer value1, Integer value2) {
            addCriterion("student_fromteacher between", value1, value2, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentFromteacherNotBetween(Integer value1, Integer value2) {
            addCriterion("student_fromteacher not between", value1, value2, "studentFromteacher");
            return (Criteria) this;
        }

        public Criteria andStudentAccountIsNull() {
            addCriterion("student_account is null");
            return (Criteria) this;
        }

        public Criteria andStudentAccountIsNotNull() {
            addCriterion("student_account is not null");
            return (Criteria) this;
        }

        public Criteria andStudentAccountEqualTo(String value) {
            addCriterion("student_account =", value, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountNotEqualTo(String value) {
            addCriterion("student_account <>", value, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountGreaterThan(String value) {
            addCriterion("student_account >", value, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountGreaterThanOrEqualTo(String value) {
            addCriterion("student_account >=", value, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountLessThan(String value) {
            addCriterion("student_account <", value, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountLessThanOrEqualTo(String value) {
            addCriterion("student_account <=", value, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountLike(String value) {
            addCriterion("student_account like", value, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountNotLike(String value) {
            addCriterion("student_account not like", value, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountIn(List<String> values) {
            addCriterion("student_account in", values, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountNotIn(List<String> values) {
            addCriterion("student_account not in", values, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountBetween(String value1, String value2) {
            addCriterion("student_account between", value1, value2, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentAccountNotBetween(String value1, String value2) {
            addCriterion("student_account not between", value1, value2, "studentAccount");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordIsNull() {
            addCriterion("student_password is null");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordIsNotNull() {
            addCriterion("student_password is not null");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordEqualTo(String value) {
            addCriterion("student_password =", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordNotEqualTo(String value) {
            addCriterion("student_password <>", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordGreaterThan(String value) {
            addCriterion("student_password >", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("student_password >=", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordLessThan(String value) {
            addCriterion("student_password <", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordLessThanOrEqualTo(String value) {
            addCriterion("student_password <=", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordLike(String value) {
            addCriterion("student_password like", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordNotLike(String value) {
            addCriterion("student_password not like", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordIn(List<String> values) {
            addCriterion("student_password in", values, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordNotIn(List<String> values) {
            addCriterion("student_password not in", values, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordBetween(String value1, String value2) {
            addCriterion("student_password between", value1, value2, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordNotBetween(String value1, String value2) {
            addCriterion("student_password not between", value1, value2, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsIsNull() {
            addCriterion("student_isthumbs is null");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsIsNotNull() {
            addCriterion("student_isthumbs is not null");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsEqualTo(String value) {
            addCriterion("student_isthumbs =", value, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsNotEqualTo(String value) {
            addCriterion("student_isthumbs <>", value, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsGreaterThan(String value) {
            addCriterion("student_isthumbs >", value, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsGreaterThanOrEqualTo(String value) {
            addCriterion("student_isthumbs >=", value, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsLessThan(String value) {
            addCriterion("student_isthumbs <", value, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsLessThanOrEqualTo(String value) {
            addCriterion("student_isthumbs <=", value, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsLike(String value) {
            addCriterion("student_isthumbs like", value, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsNotLike(String value) {
            addCriterion("student_isthumbs not like", value, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsIn(List<String> values) {
            addCriterion("student_isthumbs in", values, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsNotIn(List<String> values) {
            addCriterion("student_isthumbs not in", values, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsBetween(String value1, String value2) {
            addCriterion("student_isthumbs between", value1, value2, "studentIsthumbs");
            return (Criteria) this;
        }

        public Criteria andStudentIsthumbsNotBetween(String value1, String value2) {
            addCriterion("student_isthumbs not between", value1, value2, "studentIsthumbs");
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