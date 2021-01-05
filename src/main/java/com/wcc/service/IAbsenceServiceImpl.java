package com.wcc.service;

import com.wcc.beans.Absence;
import com.wcc.beans.Student;
import com.wcc.dao.IAbsenceDao;
import com.wcc.page.Page;

import java.util.List;

public class IAbsenceServiceImpl implements IAbsenceService {
    IAbsenceDao absenceDao;

    public void setAbsenceDao(IAbsenceDao absenceDao) {
        this.absenceDao = absenceDao;
    }

    @Override
    public int addAbsence(Absence absence) {
        return absenceDao.insertAbsence(absence);
    }

    @Override
    public int modifyAbsence(Absence absence) {
        return absenceDao.updateAbsence(absence);
    }

    @Override
    public int modifyAbsence1(Absence absence) {
        return absenceDao.updateAbsence1(absence);
    }


    @Override
    public int removeAbsence(String id) {
        return absenceDao.deleteAbsence(id);
    }

    @Override
    public Absence findAbsenceById(String id) {
        return absenceDao.selectAbsenceById(id);
    }

    @Override
    public List<Absence> findAllAbsence2(int pageStartIndex) {
        return absenceDao.selectAllAbsence2(pageStartIndex);
    }
    @Override
    public List<Absence> findAllAbsence(int pageStartIndex) {
        return absenceDao.selectAllAbsence(pageStartIndex);
    }
    @Override
    public List<Absence> selectCompound1(Absence absence, int pageStartIndex) {
        return absenceDao.selectCompound1(absence,pageStartIndex);
    }

    @Override
    public List<Absence> selectCompound2(Absence absence, int pageStartIndex) {
        return absenceDao.selectCompound2(absence,pageStartIndex);
    }

    @Override
    public Page<Absence> findCurrentPage(int pagenum) {
        Page<Absence> page = new Page<>();
        page.setPagenum(pagenum);
        int totalRows = absenceDao.selectAllAbsence1();
        page.setTotalRows(totalRows);
        List<Absence> datas = absenceDao.selectCurrentPage(page);
        page.setDatas(datas);
        return page;
    }

    @Override
    public Page<Absence> findCurrentPage1(int pagenum) {
        Page<Absence> page = new Page<>();
        page.setPagenum(pagenum);
        int totalRows = absenceDao.selectAllAbsence3();
        page.setTotalRows(totalRows);
        List<Absence> datas = absenceDao.selectCurrentPage1(page);
        page.setDatas(datas);
        return page;
    }

}
