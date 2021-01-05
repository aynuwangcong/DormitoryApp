package com.wcc.beans;

public class Absence {
    private String student_id;
    private String student_name;
    private String apartment_name;
    private String dormitory;
    private String time;
    private String leave_if;
    private String cause;

    public Absence() {}

    public Absence(String student_id, String student_name, String apartment_name, String dormitory, String time, String leave_if, String cause) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.apartment_name = apartment_name;
        this.dormitory = dormitory;
        this.time = time;
        this.leave_if = leave_if;
        this.cause = cause;
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

    public String getApartment_name() {
        return apartment_name;
    }

    public void setApartment_name(String apartment_name) {
        this.apartment_name = apartment_name;
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getleave_if() {
        return leave_if;
    }

    public void setleave_if(String leave_if) {
        this.leave_if = leave_if;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    @Override
    public String toString() {
        return "Absence{" +
                "student_id='" + student_id + '\'' +
                ", student_name='" + student_name + '\'' +
                ", apartment_name='" + apartment_name + '\'' +
                ", dormitory='" + dormitory + '\'' +
                ", time='" + time + '\'' +
                ", leave_if='" + leave_if + '\'' +
                ", cause='" + cause + '\'' +
                '}';
    }
}
