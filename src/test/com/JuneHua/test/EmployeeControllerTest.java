package com.JuneHua.test;


import com.JuneHua.domain.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;


//单元测试
//创建SpringMVC的IOC容器
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springMVC.xml"})
public class EmployeeControllerTest {

//    自动注入springMVC的IOC容器
    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testGetEmps() throws Exception{
        System.out.println("1");
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "3"))
                .andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("PageInfo");
        System.out.println(pageInfo.getPageSize());
        System.out.println(pageInfo.getEndRow());
        System.out.println(pageInfo.getPrePage());
        System.out.println(pageInfo.getTotal());
        List<Employee> list = pageInfo.getList();
        for(Employee employee:list){
            System.out.println(employee.getdId());
            System.out.println(employee.getEmpName());
            System.out.println(employee.getEmail());
        }
    }
}
