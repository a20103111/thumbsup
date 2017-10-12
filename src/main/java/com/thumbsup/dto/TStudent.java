package com.thumbsup.dto;

public class TStudent {
    private Integer studentId;

    private String studentName;

    private Integer studentClassid;

    private String studentCreatetime;

    private String studentPhone;

    private String studentCourse;

    private Integer studentFromteacher;

    private String studentAccount;

    private String studentPassword;

    private String studentIsthumbs;

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

    public Integer getStudentClassid() {
        return studentClassid;
    }

    public void setStudentClassid(Integer studentClassid) {
        this.studentClassid = studentClassid;
    }

    public String getStudentCreatetime() {
        return studentCreatetime;
    }

    public void setStudentCreatetime(String studentCreatetime) {
        this.studentCreatetime = studentCreatetime == null ? null : studentCreatetime.trim();
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone == null ? null : studentPhone.trim();
    }

    public String getStudentCourse() {
        return studentCourse;
    }

    public void setStudentCourse(String studentCourse) {
        this.studentCourse = studentCourse == null ? null : studentCourse.trim();
    }

    public Integer getStudentFromteacher() {
        return studentFromteacher;
    }

    public void setStudentFromteacher(Integer studentFromteacher) {
        this.studentFromteacher = studentFromteacher;
    }

    public String getStudentAccount() {
        return studentAccount;
    }

    public void setStudentAccount(String studentAccount) {
        this.studentAccount = studentAccount == null ? null : studentAccount.trim();
    }

    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword == null ? null : studentPassword.trim();
    }

    public String getStudentIsthumbs() {
        return studentIsthumbs;
    }

    public void setStudentIsthumbs(String studentIsthumbs) {
        this.studentIsthumbs = studentIsthumbs == null ? null : studentIsthumbs.trim();
    }
}