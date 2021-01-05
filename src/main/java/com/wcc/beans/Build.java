package com.wcc.beans;

public class Build {
    private String apartment_id;
    private String apartment_name;
    private String apartment_location;
    private String apartment_nature;
    private String apartment_remark;

    public Build() {}

    public Build(String apartment_id, String apartment_name, String apartment_location, String apartment_nature, String apartment_remark) {
        this.apartment_id = apartment_id;
        this.apartment_name = apartment_name;
        this.apartment_location = apartment_location;
        this.apartment_nature = apartment_nature;
        this.apartment_remark = apartment_remark;
    }


    public String getApartment_id() {
        return apartment_id;
    }

    public void setApartment_id(String apartment_id) {
        this.apartment_id = apartment_id;
    }

    public String getApartment_name() {
        return apartment_name;
    }

    public void setApartment_name(String apartment_name) {
        this.apartment_name = apartment_name;
    }

    public String getApartment_location() {
        return apartment_location;
    }

    public void setApartment_location(String apartment_location) {
        this.apartment_location = apartment_location;
    }

    public String getApartment_nature() {
        return apartment_nature;
    }

    public void setApartment_nature(String apartment_nature) {
        this.apartment_nature = apartment_nature;
    }

    public String getApartment_remark() {
        return apartment_remark;
    }

    public void setApartment_remark(String apartment_remark) {
        this.apartment_remark = apartment_remark;
    }

    @Override
    public String toString() {
        return "Build{" +
                "apartment_id='" + apartment_id + '\'' +
                ", apartment_name='" + apartment_name + '\'' +
                ", apartment_location='" + apartment_location + '\'' +
                ", apartment_nature='" + apartment_nature + '\'' +
                ", apartment_remark='" + apartment_remark + '\'' +
                '}';
    }
}
