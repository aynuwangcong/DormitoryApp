package com.wcc.page;

import java.util.ArrayList;
import java.util.List;

public class Page<T> {
    private int pagenum;    //当前页码
    private int pageStartIndex;//当前页起始索引
    private int pageSize;   //页面大小
    private int totalRows;  //总记录数
    private int totalPages; //总页码
    private List<T> datas;  //当前页所含的数据
    public Page(){
        this.pagenum=1;
        this.pageSize=6;
        datas= new ArrayList<>();
    }

    public int getPagenum() {
        return pagenum;
    }

    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }

    public int getPageStartIndex() {
        return (pagenum-1)*pageSize;
    }

    public void setPageStartIndex(int pageStartIndex) {
        this.pageStartIndex = pageStartIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    public int getTotalPages() {
        return totalRows%pageSize==0?totalRows/pageSize:totalRows/pageSize+1;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pagenum=" + pagenum +
                ", pageStartIndex=" + pageStartIndex +
                ", pageSize=" + pageSize +
                ", totalRows=" + totalRows +
                ", totalPages=" + totalPages +
                ", datas=" + datas +
                '}';
    }
}
