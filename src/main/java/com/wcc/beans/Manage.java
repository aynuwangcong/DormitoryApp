package com.wcc.beans;

public class Manage {
    private Integer id;
    private String manage_id;
    private String manage_name;
    private Integer manage_age;
    private String manage_sex;
    private String apartment;
    private String nature;
    private String telphone;
 //外键
    private String apartment_id;//宿舍楼编号
    public Manage() {}

    public Manage(String manage_id, String manage_name, Integer manage_age, String manage_sex, String apartment, String nature, String telphone) {
        this.manage_id = manage_id;
        this.manage_name = manage_name;
        this.manage_age = manage_age;
        this.manage_sex = manage_sex;
        this.apartment = apartment;
        this.nature = nature;
        this.telphone = telphone;
    }

    public String getApartment_id() {
        return apartment_id;
    }

    public void setApartment_id(String apartment_id) {
        this.apartment_id = apartment_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getManage_id() {
        return manage_id;
    }

    public void setManage_id(String manage_id) {
        this.manage_id = manage_id;
    }

    public String getManage_name() {
        return manage_name;
    }

    public void setManage_name(String manage_name) {
        this.manage_name = manage_name;
    }

    public Integer getManage_age() {
        return manage_age;
    }

    public void setManage_age(Integer manage_age) {
        this.manage_age = manage_age;
    }

    public String getManage_sex() {
        return manage_sex;
    }

    public void setManage_sex(String manage_sex) {
        this.manage_sex = manage_sex;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    @Override
    public String toString() {
        return "Manage{" +
                "id=" + id +
                ", manage_id='" + manage_id + '\'' +
                ", manage_name='" + manage_name + '\'' +
                ", manage_age=" + manage_age +
                ", manage_sex='" + manage_sex + '\'' +
                ", apartment='" + apartment + '\'' +
                ", nature='" + nature + '\'' +
                ", telphone='" + telphone + '\'' +
                ", apartment_id='" + apartment_id + '\'' +
                '}';
    }
}
