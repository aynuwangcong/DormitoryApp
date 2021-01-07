package com.wcc.handler;

import com.wcc.beans.Absence;
import com.wcc.beans.User;
import com.wcc.page.Page;
import com.wcc.service.IAbsenceService;
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
@RequestMapping("absence")
public class AbsenceHandler {
    private IAbsenceService absenceService;
    public AbsenceHandler(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        this.absenceService = (IAbsenceService) ac.getBean("absenceService");
    }
    @RequestMapping("/querystudent")
    public String querystudent(@RequestParam(defaultValue = "1") int pagenum, HttpServletRequest request,String pagenum1){

        Page<Absence> page = absenceService.findCurrentPage(pagenum);

        System.out.println("pagenum1="+pagenum1);
        if(pagenum1!=null&&pagenum1!=""){
            pagenum=Integer.parseInt(pagenum1);
            if(pagenum>page.getTotalPages()){
                pagenum=page.getTotalPages();
            }
            System.out.println("pagenum========="+pagenum);
            page = absenceService.findCurrentPage(pagenum);
        }

        System.out.println("pageStartIndex="+page.getPageStartIndex());
        request.getSession().setAttribute("pageStartIndex",page.getPageStartIndex());
        System.out.println("查询学生当前页1");
        for(Absence a:page.getDatas()){
            System.out.println(a);
        }
        System.out.println("查询学生当前页2");
        //将list存放到request域中
        request.setAttribute("contactorList", page.getDatas());
//        request.setAttribute("page",page);
        request.getSession().setAttribute("page",page);
        User user = (User) request.getSession().getAttribute("user");
        if("学生".equals(user.getFlag())){
            request.setAttribute("mainPage", "/jsp1/student_absence_view.jsp");
        }else {
            request.setAttribute("mainPage", "/jsp1/absence_view.jsp");
        }
        if ("系统管理员".equals(user.getFlag())) {
            return "admin";
        } else if ("宿舍管理员".equals(user.getFlag())) {
            return "dormManage";
        }else{
            return "student";
        }
    }
    @RequestMapping("/redo")
    public String queryRedo(@RequestParam(defaultValue = "1") int pagenum, HttpServletRequest request,String pagenum1){

        Page<Absence> page = absenceService.findCurrentPage1(pagenum);//查询absence表中所有未请假的人员

        System.out.println("pagenum1="+pagenum1);
        if(pagenum1!=null&&pagenum1!=""){
            pagenum=Integer.parseInt(pagenum1);
            if(pagenum>page.getTotalPages()){
                pagenum=page.getTotalPages();
            }
            System.out.println("pagenum========="+pagenum);
            page = absenceService.findCurrentPage1(pagenum);
        }

        System.out.println("pageStartIndex="+page.getPageStartIndex());
        request.getSession().setAttribute("pageStartIndex",page.getPageStartIndex());
        System.out.println("查询学生当前页1");
        for(Absence a:page.getDatas()){
            System.out.println(a);
        }
        System.out.println("查询学生当前页2");
        //将list存放到request域中
        request.setAttribute("contactorList3", page.getDatas());
//        request.setAttribute("page",page);
        request.getSession().setAttribute("page",page);
        request.setAttribute("mainPage", "/jsp1/redo.jsp");
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
    public String doCompound(Absence absence, @RequestParam("searchType") String searchType, HttpServletRequest request, int pageStartIndex,int pagenum) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("复合查询-------------------接收到的数据");
        System.out.println("absence="+absence);
        System.out.println("searchType="+searchType);
        if(!"查询所有楼栋".equals(searchType)){
            absence.setApartment_name(searchType);
        }

        System.out.println("最终组合的student="+absence);
        request.setAttribute("absence1",absence);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("复合查询-------------------接收到的数据");

        //执行查询业务
        List<Absence> list = absenceService.selectCompound1(absence,pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);

        //返回当前页的数据
        Page<Absence> page = absenceService.findCurrentPage(pagenum);
        request.setAttribute("page",page);


        User user1 = (User) request.getSession().getAttribute("user");
        if("学生".equals(user1.getFlag())){
            request.setAttribute("mainPage", "/jsp1/student_absence_view.jsp");
        }else {
            request.setAttribute("mainPage", "/jsp1/absence_view.jsp");
        }
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
    @RequestMapping("/compoundabsence")
    public String doCompoundabsence(Absence absence, @RequestParam("searchType") String searchType, HttpServletRequest request, int pageStartIndex,int pagenum) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("复合查询-------------------接收到的数据");
        System.out.println(absence);
        System.out.println("searchType="+searchType);
        if(!"查询所有楼栋".equals(searchType)){
            absence.setApartment_name(searchType);
        }

        System.out.println("最终组合的student="+absence);
        request.setAttribute("absence1",absence);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("复合查询-------------------接收到的数据");

        //执行查询业务
        List<Absence> list = absenceService.selectCompound2(absence,pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList3", list);
        //返回当前页的数据
        Page<Absence> page = absenceService.findCurrentPage1(pagenum);
        request.setAttribute("page",page);
        request.setAttribute("mainPage", "/jsp1/redo.jsp");

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
    @RequestMapping("/preAdd")//学生补假预修改
    public String dothird(Model model, HttpServletRequest request, int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();

        System.out.println("预添加修改接收的数据 pageStartIndex="+pageStartIndex);
        request.setAttribute("pageStartIndex",pageStartIndex);

        //修改
        String student_id=null;
        student_id = request.getParameter("student_id");
        Absence absence = new Absence();
        if(student_id!=null){
            absence = absenceService.findAbsenceById(student_id);
            request.setAttribute("absence",absence);
        }
        request.setAttribute("mainPage", "/jsp1/absence_add.jsp");
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
    @RequestMapping("/preAdd1")//学生补假
    public String dothird1(Model model, HttpServletRequest request, int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();

        System.out.println("预添加修改接收的数据 pageStartIndex="+pageStartIndex);
        request.setAttribute("pageStartIndex",pageStartIndex);

        //查找当前缺勤学生的信息并放在域中
        String student_id=null;
        student_id = request.getParameter("student_id");
        Absence absence = new Absence();
        if(student_id!=null){
            absence = absenceService.findAbsenceById(student_id);
            request.setAttribute("absence",absence);
        }
        request.setAttribute("mainPage", "/jsp1/redo_add.jsp");
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
    public String doAdd(Absence absence, Model model, HttpServletRequest request,int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("添加修改-------------------接收到的数据");
        System.out.println("absence="+absence);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("添加修改-------------------接收到的数据");
        //判断是添加还是修改
        //获取隐藏字段method的值，并把它转换为int型
        String id="";
        id = request.getParameter("method");
        System.out.println("method="+request.getParameter("method"));
        System.out.println("id="+id);
        if(id=="") {
            int row = absenceService.addAbsence(absence);
            if (row > 0) {
                System.out.println("插入成功");
            } else {
                System.out.println("插入失败");
            }
        }
        else{

            int row = absenceService.modifyAbsence(absence);
            if(row>0) {
                System.out.println("修改成功");
            }else{
                System.out.println("修改失败");
            }
        }

        //执行查询业务
        List<Absence> list = absenceService.findAllAbsence2(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        //跳转到查询全部学生页面
        request.setAttribute("mainPage", "/jsp1/absence_view.jsp");
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
    @RequestMapping("/add1")
    public String doAdd1(Absence absence, Model model, HttpServletRequest request,int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("添加修改-------------------接收到的数据");
        System.out.println("absence="+absence);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("添加修改-------------------接收到的数据");

            int row = absenceService.modifyAbsence1(absence);
            if(row>0) {
                System.out.println("更新成功");
            }else{
                System.out.println("更新失败");
            }


        //执行查询业务
        List<Absence> list = absenceService.findAllAbsence(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList3", list);
        //跳转到查询全部学生页面
        request.setAttribute("mainPage", "/jsp1/redo.jsp");

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
        String student_id = request.getParameter("student_id");
        absenceService.removeAbsence(student_id);

        //执行查询业务
        List<Absence> list = absenceService.findAllAbsence2(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        request.setAttribute("mainPage", "/jsp1/absence_view.jsp");
        System.out.println(list.size());

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
