package com.wcc.service;

import com.wcc.beans.Absence;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAbsenceService {
    int addAbsence(Absence absence);

    int modifyAbsence(Absence absence);

    int removeAbsence(String id);

    Absence findAbsenceById(String id);

    List<Absence> findAllAbsence2(int pageStartIndex);


    List<Absence> selectCompound1(Absence absence,int pageStartIndex);

    Page<Absence> findCurrentPage(int pagenum);

    Page<Absence> findCurrentPage1(int pagenum);

    List<Absence> selectCompound2(Absence absence, int pageStartIndex);

    int modifyAbsence1(Absence absence);

    List<Absence> findAllAbsence(int pageStartIndex);
}
