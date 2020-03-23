package com.JuneHua.test;

/*
* 对mapper进行单元测试
* 使用spring整合junit进行自动IOC
* */

import com.JuneHua.dao.DepartmentMapper;
import com.JuneHua.dao.EmployeeMapper;
import com.JuneHua.domain.Department;
import com.JuneHua.domain.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testInsert(){
        System.out.println(departmentMapper);
        departmentMapper.insert(new Department(7,"招生处"));
        System.out.println(employeeMapper);
//        employeeMapper.insert(new Employee(1,"JuneHua","M","june2hua@qq.com",1));
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        批量删除
//        for (int i=0;i<30;i++){
//            String uid= UUID.randomUUID().toString().substring(0,6)+i;
//            mapper.insertSelective(new Employee(null,uid,"F",uid+"@gmail.com",2));
//        }
//        System.out.println("success");
    }

    @Test
    public void testSelect(){
        Employee employee = employeeMapper.selectByPrimaryKey(1);
        Department department = departmentMapper.selectByPrimaryKey(7);
        System.out.println(employee);
        System.out.println(department);
    }

    @Test
    public void testUpdate(){
        employeeMapper.updateByPrimaryKey(new Employee(1,"June2Hua","M","junehuazh@163.com",null));;
    }

    @Test
    public void testDelete(){
        employeeMapper.deleteByPrimaryKey(41);
    }



}
