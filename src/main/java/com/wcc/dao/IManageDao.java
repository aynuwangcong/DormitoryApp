package com.wcc.dao;
import com.wcc.beans.Manage;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IManageDao {
    int insertManage(Manage manage);

    int updateManage(Manage manage);

    int deleteManage(String id);

    Manage selectManageById(String id);


    List<Manage> selectAllManage2(int pageStartIndex);


    int selectAllManage1();

    List<Manage> selectCurrentPage(Page<Manage> page);

    List<Manage> selectCompound1(@Param("manage") Manage manage, @Param("pageStartIndex") int pageStartIndex);

    List<Manage> selectByapartment_id(String apartment_id);

    List<Manage> selectALLmanage();

    int updateManage1(@Param("manage_name") String manage_name, @Param("apartment_id") String apartment_id);

    int updateManage2(String manage_id);
}
