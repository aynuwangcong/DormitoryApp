package com.wcc.dao;

import com.wcc.beans.User;
import com.wcc.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserDao {
    User findUser(@Param("username") String username,@Param("password") String password);

    void AddUser(User user);
    void updateser(User user);

    User selectByusername(String username);

    int selectAllUser();

    List<User> selectCurrentPage(Page<User> page);

    List<User> selectCompound1(@Param("user") User user, @Param("pageStartIndex") int pageStartIndex);

    User findUserById(String username);

    int modifyUser(User user1);

    List<User> findAllUser(int pageStartIndex);

    void deleteUser(String username);

    List<User> findAllUser1();
}
