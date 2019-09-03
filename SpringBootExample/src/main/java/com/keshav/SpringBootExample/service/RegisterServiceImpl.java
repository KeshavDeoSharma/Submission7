package com.keshav.SpringBootExample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keshav.SpringBootExample.dao.RegisterDao;
import com.keshav.SpringBootExample.model.Register;

@Service
public class RegisterServiceImpl implements RegisterService {
	@Autowired
	RegisterDao registerDao;
	
	@Override
	public Register insert(Register register)
	{
		return registerDao.save(register);
	}
	@Override
	public Register authenticate(Register register)
	{
		System.out.println(register.getUsername());
		System.out.println(register.getPassword());
		return  registerDao.findByUsername(register.getUsername());
		
	}
	@Override
	public Register getUser(String name)
	{
		return registerDao.findByUsername(name);
		
	}
	@Override
	public void updateUser(Register register) {
		registerDao.saveAndFlush(register);
	}
	@Override
	public Register checkEmail(String username)
	{
		return registerDao.findByUsername(username);
	}

}
