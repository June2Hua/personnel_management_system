package com.JuneHua.controller;

import com.JuneHua.domain.Department;
import com.JuneHua.domain.Msg;
import com.JuneHua.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    IDepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public Msg getDepts(){
        System.out.println("public class DepartmentController ===========");
        return Msg.success().add("depts", departmentService.findAll());
    }

}
