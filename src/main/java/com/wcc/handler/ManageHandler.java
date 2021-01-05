package com.wcc.handler;

import com.wcc.beans.Manage;
import com.wcc.beans.User;
import com.wcc.page.Page;
import com.wcc.service.IManageService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("manage")
public class ManageHandler {
    private IManageService manageService;
    public ManageHandler(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        this.manageService = (IManageService) ac.getBean("manageService");
    }
    @RequestMapping("/querystudent")
    public String querystudent(@RequestParam(defaultValue = "1") int pagenum, HttpServletRequest request,String pagenum1){

        Page<Manage> page = manageService.findCurrentPage(pagenum);
        System.out.println("pagenum1="+pagenum1);
        if(pagenum1!=null&&pagenum1!=""){
            pagenum=Integer.parseInt(pagenum1);
            if(pagenum>page.getTotalPages()){
                pagenum=page.getTotalPages();
            }
            System.out.println("pagenum========="+pagenum);
            page = manageService.findCurrentPage(pagenum);
        }


        System.out.println("pageStartIndex="+page.getPageStartIndex());
        request.getSession().setAttribute("pageStartIndex",page.getPageStartIndex());
        System.out.println("查询学生当前页1");
        for(Manage m:page.getDatas()){
            System.out.println(m);
        }
        System.out.println("查询学生当前页2");
        //将list存放到request域中
        request.setAttribute("contactorList", page.getDatas());
//        request.setAttribute("page",page);
        request.getSession().setAttribute("page",page);
        request.setAttribute("mainPage", "/jsp1/manage_view.jsp");

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
    public String doCompound(Manage manage, @RequestParam("searchType") String searchType, @RequestParam("Text") String Text, HttpServletRequest request, int pageStartIndex,int pagenum) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("复合查询-------------------接收到的数据");
        System.out.println(manage);
        System.out.println("searchType="+searchType);
        System.out.println("Text="+Text);
        request.setAttribute("Text",Text);

        if(("manage_name").equals(searchType)){
            manage.setManage_name(Text);
        }else if("apartment".equals(searchType)){
            manage.setApartment(Text);
        }else if("nature".equals(searchType)){
            manage.setNature(Text);
        }
        System.out.println("最终组合的student="+manage);
        request.setAttribute("manage1",manage);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("复合查询-------------------接收到的数据");

        //执行查询业务
        List<Manage> list = manageService.selectCompound1(manage,pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        //返回当前页数据
        Page<Manage> page = manageService.findCurrentPage(pagenum);
        request.setAttribute("page",page);

        request.setAttribute("mainPage", "/jsp1/manage_view.jsp");

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
    @RequestMapping("/preAdd")
    public String dothird(Model model, HttpServletRequest request, int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();

        System.out.println("预添加修改接收的数据 pageStartIndex="+pageStartIndex);
        request.setAttribute("pageStartIndex",pageStartIndex);

        //辨别是修改还是添加
        String manage_id=null;
        manage_id = request.getParameter("manage_id");
        Manage manage = new Manage();
        if(manage_id!=null){
            manage = manageService.findManageById(manage_id);
            request.setAttribute("manage",manage);
        }
        request.setAttribute("mainPage", "/jsp1/manage_add.jsp");
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
    @RequestMapping("/add")
    public String doAdd(Manage manage, Model model, HttpServletRequest request,int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("添加修改-------------------接收到的数据");
        System.out.println("manage="+manage);
        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("添加修改-------------------接收到的数据");

        //判断是添加还是修改
        //获取隐藏字段method的值，并把它转换为int型
        String id="";
        id = request.getParameter("method");
        System.out.println("method="+request.getParameter("method"));
        System.out.println("id="+id);
        if(id=="") {
            int row = manageService.addManage(manage);
            if (row > 0) {
                System.out.println("插入成功");
            } else {
                System.out.println("插入失败");
            }
        }
        else{
            manage.setId(Integer.parseInt(request.getParameter("method")));
            System.out.println("要修改的数据----------------"+manage);
            int row = manageService.modifyManage(manage);
            if(row>0) {
                System.out.println("修改成功");
            }else{
                System.out.println("修改失败");
            }
        }

        //执行查询业务
        List<Manage> list = manageService.findAllManage2(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        //跳转到查询全部学生页面
        request.setAttribute("mainPage", "/jsp1/manage_view.jsp");
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
        String manage_id = request.getParameter("manage_id");
        manageService.removeManage(manage_id);

        //执行查询业务
        List<Manage> list = manageService.findAllManage2(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        request.setAttribute("mainPage", "/jsp1/manage_view.jsp");

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
    @RequestMapping("/manage")
    public String doManage(Model model, HttpServletRequest request,String apartment_id) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("apartment_id="+apartment_id);
        request.setAttribute("apartment_id",apartment_id);

        //执行查询业务
        List<Manage> list1 = manageService.findAllManage();                   //查找所有管理员
        List<Manage> list2 = manageService.selectByapartment_id(apartment_id);//以apartment_id查找管理员
        //将list存放到request域中
        request.getSession().setAttribute("contactorList6",list1);
        request.setAttribute("contactorList2", list2);
        request.setAttribute("mainPage", "/jsp1/build_manage.jsp");
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
    @RequestMapping("/addmanage")
    public String doAddmanage(Model model, HttpServletRequest request,String searchType,String apartment_id) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("searchType=============="+searchType);
        System.out.println("apartment_id="+apartment_id);
        String manage_name=searchType;

        int row = manageService.modifyManage1(manage_name,apartment_id);//修改管理员表中的apartment_id
        if(row>0) {
            System.out.println("添加管理员成功");
        }
        //执行查询业务
        List<Manage> list2 = manageService.selectByapartment_id(apartment_id);//以apartment_id查找管理员
        //将list存放到request域中
        request.setAttribute("contactorList2", list2);
        request.setAttribute("mainPage", "/jsp1/build_manage.jsp");
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
    @RequestMapping("/removeApartment_id")
    public String doRemove(Model model, HttpServletRequest request,String manage_id,String apartment_id) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("manage_id="+manage_id);

        int row = manageService.modifyManage2(manage_id);//修改管理员表中的apartment_id
        if(row>0) {
            System.out.println("修改管理员成功");
        }
        //执行查询业务
        List<Manage> list2 = manageService.selectByapartment_id(apartment_id);//以apartment_id查找管理员
        //将list存放到request域中
        request.setAttribute("contactorList2", list2);
        request.setAttribute("mainPage", "/jsp1/build_manage.jsp");
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
}
