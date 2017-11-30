package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import data.ItemDAO;

@Controller
public class ItemController {
	
	@Autowired
	ItemDAO itemDAO;
	
}
