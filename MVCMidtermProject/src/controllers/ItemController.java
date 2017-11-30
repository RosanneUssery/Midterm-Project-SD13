package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import data.ItemDAO;

@Controller
public class ItemController {
	
	@Autowired
	ItemDAO itemDAO;
	
	//return a view of all available items -- GET
	
	//return a view with filtered list of items -- GET
	
	//return a view with single item detail -- GET
	
	//send user to page where they can add an item -- POST REDIRECT
		//send user to page with added item
	
	//return a page with a user and all their items -- GET
	
	//send user to page where they can update item --POST REDIRECT
		//send user to page with updated item
	
}
