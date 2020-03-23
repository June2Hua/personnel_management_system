package com.JuneHua.controller;

import com.JuneHua.domain.Employee;
import com.JuneHua.service.IEmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EmployeeController {

//    自动注入EmployeeService
    @Autowired
    IEmployeeService employeeService;

//    pn代表页数，默认为第一页
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //引入分页插件pageHelper,从第pn页开始，每一页5条记录
        PageHelper.startPage(pn, 5);
        //查询
        List<Employee> employees = employeeService.findAll();
        //封装查询结果信息
        PageInfo pageInfo=new PageInfo(employees);
        //存入响应体中
        model.addAttribute("PageInfo", pageInfo);
        System.out.println("@RequestMapping(\"/emps\")");
        //跳转到list.jsp页面中
        return "/list";
    }

}
