package com.thumbsup.dto;

public class TClass {
    private Integer classId;

    private String className;

    private String classCreatetime;

    private String classEndtime;

    private Integer classNumbers;

    private Integer classType;

    private Integer classFromteacher;

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public String getClassCreatetime() {
        return classCreatetime;
    }

    public void setClassCreatetime(String classCreatetime) {
        this.classCreatetime = classCreatetime == null ? null : classCreatetime.trim();
    }

    public String getClassEndtime() {
        return classEndtime;
    }

    public void setClassEndtime(String classEndtime) {
        this.classEndtime = classEndtime == null ? null : classEndtime.trim();
    }

    public Integer getClassNumbers() {
        return classNumbers;
    }

    public void setClassNumbers(Integer classNumbers) {
        this.classNumbers = classNumbers;
    }

    public Integer getClassType() {
        return classType;
    }

    public void setClassType(Integer classType) {
        this.classType = classType;
    }

    public Integer getClassFromteacher() {
        return classFromteacher;
    }

    public void setClassFromteacher(Integer classFromteacher) {
        this.classFromteacher = classFromteacher;
    }
}