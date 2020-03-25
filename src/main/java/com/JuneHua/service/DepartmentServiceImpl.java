package com.JuneHua.service;

import com.JuneHua.dao.DepartmentMapper;
import com.JuneHua.domain.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements IDepartmentService{

    @Autowired
    DepartmentMapper mapper;

    @Override
    public List<Department> findAll() {
        System.out.println("public class DepartmentServiceImpl============");
        return mapper.selectByExample(null);
    }
}
