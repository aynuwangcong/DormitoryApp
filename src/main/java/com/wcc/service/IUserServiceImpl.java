package com.wcc.service;

import com.wcc.beans.Student;
import com.wcc.beans.User;
import com.wcc.dao.IUserDao;
import com.wcc.page.Page;

import java.util.List;

public class IUserServiceImpl implements IUserService {
    IUserDao userDao;
    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }
    @Override
    public User queryUser(String username, String password) {
        User user = this.userDao.findUser(username,password);
        return user;
    }

    @Override
    public void addUser(User user) {
        this.userDao.AddUser(user);
    }

    @Override
    public void updateUser(User user) {
        this.userDao.updateser(user);
    }

    @Override
    public User selectByusername(String username) {
        return this.userDao.selectByusername(username);
    }

    @Override
    public Page<User> findCurrentPage(int pagenum) {
        Page<User> page = new Page<>();
        page.setPagenum(pagenum);
        int totalRows = userDao.selectAllUser();
        page.setTotalRows(totalRows);
        List<User> datas = userDao.selectCurrentPage(page);
        page.setDatas(datas);
        return page;
    }

    @Override
    public List<User> selectCompound1(User user1, int pageStartIndex) {
        return userDao.selectCompound1(user1,pageStartIndex);
    }

    @Override
    public User findUserById(String username) {
        return userDao.findUserById(username);
    }

    @Override
    public int modifyUser(User user1) {
        return userDao.modifyUser(user1);
    }

    @Override
    public List<User> findAllUser2(int pageStartIndex) {
        return userDao.findAllUser(pageStartIndex);
    }

    @Override
    public void removeUser(String username) {
         userDao.deleteUser(username);
    }

    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser1();
    }


}
