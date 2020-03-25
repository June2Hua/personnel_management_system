package com.JuneHua.service;

import com.JuneHua.dao.EmployeeMapper;
import com.JuneHua.domain.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements IEmployeeService{

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public List<Employee> findAll() {
        System.out.println("public class EmployeeServiceImpl implements IEmployeeService-----------");
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        System.out.println("List<Employee> employees = employeeMapper.selectByExampleWithDept(null);");
        return employees;
    }
}
