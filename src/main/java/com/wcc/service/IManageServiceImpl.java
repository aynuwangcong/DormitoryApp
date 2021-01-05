package com.wcc.service;

import com.wcc.beans.Manage;
import com.wcc.beans.Student;
import com.wcc.dao.IManageDao;
import com.wcc.page.Page;

import java.util.List;

public class IManageServiceImpl implements IManageService {
    IManageDao manageDao;

    public void setManageDao(IManageDao manageDao) {
        this.manageDao = manageDao;
    }

    @Override
    public int addManage(Manage manage) {
        return manageDao.insertManage(manage);
    }

    @Override
    public int modifyManage(Manage manage) {
        return manageDao.updateManage(manage);
    }

    @Override
    public int modifyManage1(String manage_name, String apartment_id) {
        return manageDao.updateManage1(manage_name,apartment_id);
    }

    @Override
    public int modifyManage2(String manage_id) {
        return manageDao.updateManage2(manage_id);
    }

    @Override
    public int removeManage(String id) {
        return manageDao.deleteManage(id);
    }

    @Override
    public Manage findManageById(String id) {
        return manageDao.selectManageById(id);
    }

    @Override
    public List<Manage> selectByapartment_id(String apartment_id) {
        return manageDao.selectByapartment_id(apartment_id);
    }

    @Override
    public List<Manage> findAllManage() {
        return manageDao.selectALLmanage();
    }

    @Override
    public List<Manage> findAllManage2(int pageStartIndex) {
        return manageDao.selectAllManage2(pageStartIndex);
    }

    @Override
    public List<Manage> selectCompound1(Manage manage, int pageStartIndex) {
        return manageDao.selectCompound1(manage,pageStartIndex);
    }

    @Override
    public Page<Manage> findCurrentPage(int pagenum) {
        Page<Manage> page = new Page<>();
        page.setPagenum(pagenum);
        int totalRows = manageDao.selectAllManage1();
        page.setTotalRows(totalRows);
        List<Manage> datas = manageDao.selectCurrentPage(page);
        page.setDatas(datas);
        return page;
    }


}
