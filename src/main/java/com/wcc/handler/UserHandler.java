package com.wcc.handler;

import com.wcc.beans.Student;
import com.wcc.beans.User;
import com.wcc.page.Page;
import com.wcc.service.IStudentService;
import com.wcc.service.IUserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("login")
public class UserHandler {
    private IUserService userService;
    public UserHandler(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        this.userService = (IUserService) ac.getBean("userService");
    }

    @RequestMapping("/first")
    public String doFirst(String username, String password,String flag, Model model, HttpSession session) throws Exception {

        if(username!=null&&password==null||password==""){
            session.removeAttribute("error2");//移除密码提示的session
            session.removeAttribute("error1");//移除登录错误提示的session
            System.out.println("执行忘记密码操作");
            User user1 = userService.selectByusername(username);
            session.setAttribute("error2", "你的密码是:"+user1.getPassword());
        }else {
            session.removeAttribute("error2");//移除密码提示的session
            session.removeAttribute("error1");//移除登录错误提示的session
            User user = userService.queryUser(username, password);
            if (user != null && user.getFlag().equals(flag)) {
                session.setAttribute("username", user.getUsername());
                session.setAttribute("user", user);
                if ("系统管理员".equals(user.getFlag())) {
                    return "admin";
                } else if ("宿舍管理员".equals(user.getFlag())) {
                    return "dormManage";
                } else if ("学生".equals(user.getFlag())) {
                    return "student";
                }

            } else if (user != null && !user.getFlag().equals(flag)) {
                session.setAttribute("error1", "用户类型选择错误");
            } else {
                session.setAttribute("error1", "账号或密码输入错误");
            }
        }
        return "forward:/index.jsp";
    }
//    @RequestMapping("/forget")
//    public String doforget(String username, String password,String flag,  Model model, HttpSession session) throws Exception {
//
//        System.out.println("忘记密码接受到的数据username="+username);
//        System.out.println("忘记密码接受到的数据password="+password);
//        System.out.println("忘记密码接受到的数据flag="+flag);
//        if(username!=null){
//        User user = userService.selectByusername(username);
//        if(username!=user.getUsername()||username == user.getUsername()&&flag!=user.getFlag()){
//            session.setAttribute("error2", "对不起，没有查到此用户!");
//        }else {
//            session.setAttribute("error2", "你的密码是:" + user.getPassword());
//        }
//
//        }
//        return "forward:/index.jsp";
//    }
    @RequestMapping("/register")
    public String doRegister(User user, Model model, HttpSession session) throws Exception {
        
        System.out.println("注册用户接受到的数据"+user);
        //查找所以用户
        List<User> users=userService.findAllUser();
        //查找所有用户中有没有和当前注册用户有相同的
        for(User u:users){
            if(user.getUsername().equals(u.getUsername())){
                session.setAttribute("rsg","你注册的账号已被使用，请重新选择一个账号!");
                return "forward:/jsp2/register.jsp";
            }
        }
        //如果没有相同的则添加用户
        userService.addUser(user);
        //返回登录页面
        return "forward:/index.jsp";
    }
    @RequestMapping("/loss")
    public String doLoss(String username, Model model, HttpSession session) throws Exception {

        System.out.println("username=========="+username);
        //按username查找用户

        session.setAttribute("error2","你的密码为:");

        return "forward:/index.jsp";
    }
    @RequestMapping("/update")
    public String doUpdate(@RequestParam Map<String,Object> map, Model model, HttpSession session) throws Exception {


        String oldpassword = (String) map.get("oldPassword");
        String newPassword = (String) map.get("newPassword");
        String rpassword = (String) map.get("rPassword");
        System.out.println("注册用户接受到的数据"+oldpassword+" "+newPassword+" "+" "+rpassword);
        User user = new User();
        User user1= (User) session.getAttribute("user");
        user.setUsername(user1.getUsername());
        user.setPassword(newPassword);
        //修改密码
        userService.updateUser(user);

        return "forward:/index.jsp";
    }
    @RequestMapping("/quit")
    public String doQuit(HttpSession session) throws Exception {
            session.removeAttribute("user");
        return "forward:/index.jsp";
    }
    @RequestMapping("/preupdatepassage")
    public String doprepassage(Model model, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();

        request.setAttribute("mainPage", "/jsp1/update_password.jsp");
        //设置响应视图
        User user = (User) request.getSession().getAttribute("user");
        //将用户信息传递给修改密码页面
        request.setAttribute("user",user);
        if ("系统管理员".equals(user.getFlag())) {
            return "admin";
        } else if ("宿舍管理员".equals(user.getFlag())) {
            return "dormManage";
        }else{
            return "student";
        }
    }
    @RequestMapping("/authority")
    public String authority(@RequestParam(defaultValue = "1") int pagenum, HttpServletRequest request, String pagenum1) {

        Page<User> page = userService.findCurrentPage(pagenum);

        System.out.println("pagenum1="+pagenum1);
        if(pagenum1!=null&&pagenum1!=""){
            pagenum=Integer.parseInt(pagenum1);
            if(pagenum>page.getTotalPages()){
                pagenum=page.getTotalPages();
            }
            System.out.println("pagenum========="+pagenum);
            page = userService.findCurrentPage(pagenum);
        }

        System.out.println("pageStartIndex=" + page.getPageStartIndex());
        request.getSession().setAttribute("pageStartIndex", page.getPageStartIndex());
        System.out.println("查询学生当前页1");
        for (User u : page.getDatas()) {
            System.out.println(u);
        }
        System.out.println("查询学生当前页2");
        //将list存放到request域中
        request.setAttribute("contactorList", page.getDatas());
        request.getSession().setAttribute("page",page);
        request.setAttribute("mainPage", "/jsp1/user_view.jsp");

        User user = (User) request.getSession().getAttribute("user");
        if ("系统管理员".equals(user.getFlag())) {
            return "admin";
        } else if ("宿舍管理员".equals(user.getFlag())) {
            return "dormManage";
        }else{
            return "student";
        }

    }

    @RequestMapping("/compound")
    public String doCompound(User user1, HttpServletRequest request,int pageStartIndex,int pagenum) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("复合查询-------------------接收到的数据");
        System.out.println("user="+user1);

        request.setAttribute("user1",user1);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("复合查询-------------------接收到的数据");

        //执行查询业务
        List<User> list = userService.selectCompound1(user1,pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        //返回当前页数据
        Page<User> page = userService.findCurrentPage(pagenum);
        request.setAttribute("page", page);
        request.setAttribute("mainPage", "/jsp1/user_view.jsp");


        User user = (User) request.getSession().getAttribute("user");
        if ("系统管理员".equals(user.getFlag())) {
            return "admin";
        } else if ("宿舍管理员".equals(user.getFlag())) {
            return "dormManage";
        }else{
            return "student";
        }
    }
    @RequestMapping("/preAdd")
    public String dothird(HttpServletRequest request,int pageStartIndex) throws Exception {


        System.out.println("pageStartIndex="+pageStartIndex);
        request.setAttribute("pageStartIndex",pageStartIndex);

        //权限更改
        String username=null;
        username = request.getParameter("username");
        System.out.println("username=_="+username);
        User user1 = new User();
        if(username!=null){
            user1 = userService.findUserById(username);
            request.setAttribute("user",user1);
        }
        request.setAttribute("mainPage", "/jsp1/user_add.jsp");

        User user = (User) request.getSession().getAttribute("user");
        System.out.println("user---------------"+user);
        if ("系统管理员".equals(user.getFlag())) {
            return "admin";
        } else if ("宿舍管理员".equals(user.getFlag())) {
            return "dormManage";
        }else{
            return "student";
        }
    }
    @RequestMapping("/add")
    public String doAdd(User user1, Model model, HttpServletRequest request,int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("添加修改-------------------接收到的数据");
        System.out.println("user1="+user1);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("添加修改-------------------接收到的数据");

            int row = userService.modifyUser(user1);
            if(row>0) {
                System.out.println("修改成功");
            }else{
                System.out.println("修改失败");
            }


        //执行查询业务
        List<User> list = userService.findAllUser2(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        //跳转到查询全部学生页面
        request.setAttribute("mainPage", "/jsp1/user_view.jsp");
        //设置响应视图
        User user = (User) request.getSession().getAttribute("user");
        if ("系统管理员".equals(user.getFlag())) {
            return "admin";
        } else if ("宿舍管理员".equals(user.getFlag())) {
            return "dormManage";
        }else{
            return "student";
        }
    }


    @RequestMapping("/delete")
    public String doDelete(Model model, HttpServletRequest request,int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("删除接收pageStartIndex="+pageStartIndex);
        //执行删除操作
        String username = request.getParameter("username");
        userService.removeUser(username);

        //执行查询业务
        List<User> list = userService.findAllUser2(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        request.setAttribute("mainPage", "/jsp1/user_view.jsp");

        User user = (User) request.getSession().getAttribute("user");
        if ("系统管理员".equals(user.getFlag())) {
            return "admin";
        } else if ("宿舍管理员".equals(user.getFlag())) {
            return "dormManage";
        }else{
            return "student";
        }
    }
}
