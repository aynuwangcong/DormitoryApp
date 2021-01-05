package com.wcc.service;

import com.wcc.beans.Build;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IBuildService {
    int addBuild(Build build);

    int modifyBuild(Build build);

    int removeBuild(String id);

    Build findBuildById(String id);

    List<Build> findAllBuild2(int pageStartIndex);

    List<Build> selectCompound1(Build build, int pageStartIndex);

    Page<Build> findCurrentPage(int pagenum);
}
