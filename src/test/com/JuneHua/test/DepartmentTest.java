package com.JuneHua.test;


import com.JuneHua.dao.DepartmentMapper;
import com.JuneHua.domain.Department;
import com.JuneHua.service.IDepartmentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springMVC.xml"})
public class DepartmentTest {

    @Autowired
    IDepartmentService departmentService;

    @Test
    public void testFindAll(){
        List<Department> list = departmentService.findAll();
        for(Department department:list)
            System.out.println(department);
    }
}
