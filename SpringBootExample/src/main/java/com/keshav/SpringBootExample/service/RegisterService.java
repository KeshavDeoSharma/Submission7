package com.keshav.SpringBootExample.service;

import com.keshav.SpringBootExample.model.Register;

public interface RegisterService {

	Register insert(Register register);

	Register authenticate(Register register);

	Register getUser(String name);

	void updateUser(Register register);

	Register checkEmail(String username);

}