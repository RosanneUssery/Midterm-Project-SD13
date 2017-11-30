package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import data.AddressDAO;

@Controller
public class AddressController {
	
	@Autowired
	AddressDAO addressDAO;
	
	

}
