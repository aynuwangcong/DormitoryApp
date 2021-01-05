
package com.wcc.page;

import com.wcc.beans.User;

import java.io.IOException;

import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig)throws ServletException{

    }

    public void doFilter(ServletRequest req, ServletResponse response, FilterChain filterChain)throws ServletException, IOException {

        HttpServletRequest request =(HttpServletRequest) req;
        HttpSession session= request.getSession();
        User user = (User) session.getAttribute("user");
        if(user!=null){
            System.out.println("进入过滤器!!!!!!!!");
            filterChain.doFilter(request, response);
        }else {
            request.setAttribute("msg", "你还没有登录，请先登录");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

    public void destroy(){

    }
}