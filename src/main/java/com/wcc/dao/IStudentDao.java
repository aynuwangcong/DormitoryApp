package com.wcc.dao;

import com.wcc.beans.Student;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface IStudentDao {
    int insertStudent(Student student);

    int updateStudent(Student student);

    int deleteStudent(String id);

    Student selectStudentById(String id);


    List<Student> selectAllStudent2(int pageStartIndex);


    int selectAllStudent1();

    List<Student> selectCurrentPage(Page<Student> page);

    List<Student> selectCompound1(@Param("student") Student student, @Param("pageStartIndex") int pageStartIndex);

}
