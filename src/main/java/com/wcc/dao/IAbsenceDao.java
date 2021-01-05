package com.wcc.dao;

import com.wcc.beans.Absence;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAbsenceDao {
    int insertAbsence(Absence absence);

    int updateAbsence(Absence absence);

    int deleteAbsence(String id);

    Absence selectAbsenceById(String id);


    List<Absence> selectAllAbsence2(int pageStartIndex);


    int selectAllAbsence1();

    List<Absence> selectCurrentPage(Page<Absence> page);

    List<Absence> selectCompound1(@Param("absence") Absence absence, @Param("pageStartIndex") int pageStartIndex);

    List<Absence> selectCurrentPage1(Page<Absence> page);

    int selectAllAbsence3();

    List<Absence> selectCompound2(@Param("absence") Absence absence, @Param("pageStartIndex") int pageStartIndex);

    int updateAbsence1(Absence absence);

    List<Absence> selectAllAbsence(int pageStartIndex);
}
