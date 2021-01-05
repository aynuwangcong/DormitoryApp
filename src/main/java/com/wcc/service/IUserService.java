package com.wcc.service;

import com.wcc.beans.User;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserService {
   User queryUser (String username, String password);

    void addUser(User user);
    void updateUser(User user);

    User selectByusername(String username);

    Page<User> findCurrentPage(int pagenum);

    List<User> selectCompound1(User user1, int pageStartIndex);

 User findUserById(String username);

 int modifyUser(User user1);

 List<User> findAllUser2(int pageStartIndex);

 void removeUser(String username);
}
