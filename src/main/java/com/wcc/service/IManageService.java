package com.wcc.service;

import com.wcc.beans.Manage;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IManageService {
    int addManage(Manage manage);

    int modifyManage(Manage manage);

    int removeManage(String id);

    Manage findManageById(String id);

    List<Manage> findAllManage2(int pageStartIndex);


    List<Manage> selectCompound1(@Param("manage") Manage manage, @Param("pageStartIndex") int pageStartIndex);

    Page<Manage> findCurrentPage(int pagenum);

    List<Manage> selectByapartment_id(String apartment_id);

    List<Manage> findAllManage();

    int modifyManage1(String manage_name, String apartment_id);

    int modifyManage2(String manage_id);
}
