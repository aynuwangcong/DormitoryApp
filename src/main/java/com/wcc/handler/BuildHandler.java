package com.wcc.handler;

import com.wcc.beans.Build;
import com.wcc.beans.User;
import com.wcc.page.Page;
import com.wcc.service.IBuildService;
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
@RequestMapping("build")
public class BuildHandler {
    private IBuildService buildService;
    public BuildHandler(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        this.buildService = (IBuildService) ac.getBean("buildService");
    }
    @RequestMapping("/querystudent")
    public String querystudent(@RequestParam(defaultValue = "1") int pagenum, HttpServletRequest request, String pagenum1){

        Page<Build> page = buildService.findCurrentPage(pagenum);

        System.out.println("pagenum1="+pagenum1);
        if(pagenum1!=null&&pagenum1!=""){
            pagenum=Integer.parseInt(pagenum1);
            if(pagenum>page.getTotalPages()){
                pagenum=page.getTotalPages();
            }
            System.out.println("pagenum========="+pagenum);
            page = buildService.findCurrentPage(pagenum);
        }

        System.out.println("pageStartIndex="+page.getPageStartIndex());
        request.getSession().setAttribute("pageStartIndex",page.getPageStartIndex());
        System.out.println("查询学生当前页1");
        for(Build b:page.getDatas()){
            System.out.println(b);
        }
        System.out.println("查询学生当前页2");
        //将list存放到request域中
        request.setAttribute("contactorList", page.getDatas());
//        request.setAttribute("page",page);
        request.getSession().setAttribute("page",page);
        request.setAttribute("mainPage", "/jsp1/build_view.jsp");

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
    public String doCompound(Build build, @RequestParam("searchType") String searchType, @RequestParam("Text") String Text, HttpServletRequest request, int pageStartIndex,int pagenum) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("复合查询-------------------接收到的数据");
        System.out.println(build);
        System.out.println("searchType="+searchType);
        System.out.println("Text="+Text);

        request.setAttribute("Text",Text);

        if(("apartment_id").equals(searchType)){
            build.setApartment_id(Text);
        }else if("apartment_name".equals(searchType)){
            build.setApartment_name(Text);
        }else if("apartment_nature".equals(searchType)){
            build.setApartment_nature(Text);
        }
        System.out.println("最终组合的student="+build);
        request.setAttribute("build1",build);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("复合查询-------------------接收到的数据");

        //执行查询业务
        List<Build> list = buildService.selectCompound1(build,pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        //返回当前页数据
        Page<Build> page = buildService.findCurrentPage(pagenum);
        request.setAttribute("page",page);

        request.setAttribute("mainPage", "/jsp1/build_view.jsp");
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
        String apartment_id=null;
        apartment_id = request.getParameter("apartment_id");
        Build build = new Build();
        if(apartment_id!=null){
            build = buildService.findBuildById(apartment_id);
            request.setAttribute("build",build);
        }
        request.setAttribute("mainPage", "/jsp1/build_add.jsp");
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
    public String doAdd(Build build, Model model, HttpServletRequest request,int pageStartIndex) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("添加修改-------------------接收到的数据");
        System.out.println("build="+build);

        System.out.println("pageStartIndex="+pageStartIndex);
        System.out.println("添加修改-------------------接收到的数据");

        //判断是添加还是修改
        //获取隐藏字段method的值，并把它转换为int型
        String id="";
        id = request.getParameter("method");
        System.out.println("method="+request.getParameter("method"));
        System.out.println("id="+id);
        if(id=="") {
            int row =buildService.addBuild(build);
            if (row > 0) {
                System.out.println("插入成功");
            } else {
                System.out.println("插入失败");
            }
        }
        else{


            int row = buildService.modifyBuild(build);
            if(row>0) {
                System.out.println("修改成功");
            }else{
                System.out.println("修改失败");
            }
        }

        //执行查询业务
        List<Build> list = buildService.findAllBuild2(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        //跳转到查询全部学生页面
        request.setAttribute("mainPage", "/jsp1/build_view.jsp");
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
        String apartment_id = request.getParameter("apartment_id");
        buildService.removeBuild(apartment_id);

        //执行查询业务
        List<Build> list = buildService.findAllBuild2(pageStartIndex);
        //将list存放到request域中
        request.setAttribute("contactorList", list);
        request.setAttribute("mainPage", "/jsp1/build_view.jsp");
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
