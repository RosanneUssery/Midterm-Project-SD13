package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import data.ActivityDAO;
import data.AddressDAO;
import data.UserDAO;

@Controller
public class UserController {

	@Autowired
	UserDAO userDAO;
	
	@Autowired
	AddressDAO addressDAO;
	
	@Autowired
	ActivityDAO activityDAO;
	
	//show a user page with a list of their items
	
	//show a user page with all their past activity
	
	//show a page with all requests for that user
	
	//show a page where a user can register -- POST REDIRECT
		//sign up completed page
	
	//show a page to update user info -- POST REDIRECT
		//update completed page
}
