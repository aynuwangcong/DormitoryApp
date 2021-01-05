package com.wcc.service;

import com.wcc.beans.Build;
import com.wcc.beans.Student;
import com.wcc.dao.IBuildDao;
import com.wcc.page.Page;

import java.util.List;

public class IBuildServiceImpl implements IBuildService{
    IBuildDao buildDao;

    public void setBuildDao(IBuildDao buildDao) {
        this.buildDao = buildDao;
    }

    @Override
    public int addBuild(Build build) {
        return buildDao.insertBuild(build);
    }

    @Override
    public int modifyBuild(Build build) {
        return buildDao.updateBuild(build);
    }

    @Override
    public int removeBuild(String id) {
        return buildDao.deleteBuild(id);
    }

    @Override
    public Build findBuildById(String id) {
        return buildDao.selectBuildById(id);
    }

    @Override
    public List<Build> findAllBuild2(int pageStartIndex) {
        return buildDao.selectAllBuild2(pageStartIndex);
    }

    @Override
    public List<Build> selectCompound1(Build build, int pageStartIndex) {
        return buildDao.selectCompound1(build,pageStartIndex);
    }

    @Override
    public Page<Build> findCurrentPage(int pagenum) {
        Page<Build> page = new Page<>();
        page.setPagenum(pagenum);
        int totalRows = buildDao.selectAllBuild1();
        page.setTotalRows(totalRows);
        List<Build> datas = buildDao.selectCurrentPage(page);
        page.setDatas(datas);
        return page;
    }
}
