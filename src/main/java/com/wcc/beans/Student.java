package com.wcc.beans;

public class Student {
    private Integer id;
    private String  student_id;
    private String  student_name;
    private Integer student_age;
    private String  student_sex;
    private String  apartment;
    private String  dormitory;
    private String  telphone;
//外键

    public Student(){}

    public Student(String student_id, String student_name, Integer student_age, String student_sex, String apartment, String dormitory, String telphone) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.student_age = student_age;
        this.student_sex = student_sex;
        this.apartment = apartment;
        this.dormitory = dormitory;
        this.telphone = telphone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public Integer getStudent_age() {
        return student_age;
    }

    public void setStudent_age(Integer student_age) {
        this.student_age = student_age;
    }

    public String getStudent_sex() {
        return student_sex;
    }

    public void setStudent_sex(String student_sex) {
        this.student_sex = student_sex;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", student_id='" + student_id + '\'' +
                ", student_name='" + student_name + '\'' +
                ", student_age=" + student_age +
                ", student_sex='" + student_sex + '\'' +
                ", apartment='" + apartment + '\'' +
                ", dormitory='" + dormitory + '\'' +
                ", telphone='" + telphone + '\'' +
                '}';
    }
}
