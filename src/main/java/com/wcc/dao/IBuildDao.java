package com.wcc.dao;

import com.wcc.beans.Build;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IBuildDao {
    int insertBuild(Build build);

    int updateBuild(Build build);

    int deleteBuild(String id);

    Build selectBuildById(String id);


    List<Build> selectAllBuild2(int pageStartIndex);

    int selectAllBuild1();

    List<Build> selectCurrentPage(Page<Build> page);

    List<Build> selectCompound1(@Param("apartment") Build apartment, @Param("pageStartIndex") int pageStartIndex);

}
