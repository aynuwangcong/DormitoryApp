package com.wcc.service;

import com.wcc.beans.Student;
import com.wcc.dao.IStudentDao;
import com.wcc.page.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class IStudentServiceImpl implements IStudentService {

    IStudentDao studentDao;

    public void setStudentDao(IStudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @Override
    public int addStudent(Student student) {
        return studentDao.insertStudent(student);
    }


    @Override
    public int modifyStudent(Student student) {
        return studentDao.updateStudent(student);
    }

    @Override
    public int removeStudent(String i) {
        return studentDao.deleteStudent(i);
    }


    @Override
    public Student findStudentById(String id) {
        return studentDao.selectStudentById(id);
    }


    @Override
    public List<Student> findAllStudent2(int pageStartIndex) {
        return studentDao.selectAllStudent2(pageStartIndex);
    }


    @Override
    public List<Student> selectCompound1(Student student, int pageStartIndex) {
        return studentDao.selectCompound1(student,pageStartIndex);
    }

    @Override
    public Page<Student> findCurrentPage(int pagenum) {
        Page<Student> page = new Page<>();
        page.setPagenum(pagenum);
        int totalRows = studentDao.selectAllStudent1();
        page.setTotalRows(totalRows);
        List<Student> datas = studentDao.selectCurrentPage(page);
        page.setDatas(datas);
        return page;
    }

}
