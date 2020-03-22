package com.JuneHua.test;

/*
* 对mapper进行单元测试
* 使用spring整合junit进行自动IOC
* */

import com.JuneHua.dao.DepartmentMapper;
import com.JuneHua.dao.EmployeeMapper;
import com.JuneHua.domain.Department;
import com.JuneHua.domain.Employee;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void testCRUD(){
        System.out.println(departmentMapper);
//        departmentMapper.insert(new Department(5,"保卫处"));
        System.out.println(employeeMapper);
        employeeMapper.insert(new Employee(1,"JuneHua","M","june2hua@qq.com",1));

    }

}
