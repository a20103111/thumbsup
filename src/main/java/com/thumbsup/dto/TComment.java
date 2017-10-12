package com.thumbsup.dto;

public class TComment {
    private Integer id;

    private Integer studentId;

    private String studentName;

    private String comment;

    private String createtime;

    private Integer forteacherid;

    private String studentPhone;

    private Integer studentFromclassid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName == null ? null : studentName.trim();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public Integer getForteacherid() {
        return forteacherid;
    }

    public void setForteacherid(Integer forteacherid) {
        this.forteacherid = forteacherid;
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone == null ? null : studentPhone.trim();
    }

    public Integer getStudentFromclassid() {
        return studentFromclassid;
    }

    public void setStudentFromclassid(Integer studentFromclassid) {
        this.studentFromclassid = studentFromclassid;
    }
}