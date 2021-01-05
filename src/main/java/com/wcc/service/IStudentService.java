package com.wcc.service;

import com.wcc.beans.Student;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IStudentService {
    int addStudent(Student student);

    int modifyStudent(Student student);

    int removeStudent(String i);

    Student findStudentById(String id);

    List<Student> findAllStudent2(int pageStartIndex);


    List<Student> selectCompound1(@Param("student") Student student, @Param("pageStartIndex") int pageStartIndex);

    Page<Student> findCurrentPage(int pagenum);
}
