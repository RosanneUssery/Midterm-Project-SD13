package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.ItemDAO;
import entities.Item;

@Controller
public class ItemController {
	
	@Autowired
	ItemDAO itemDAO;
	
	//return a view of all available items -- GET
	/**
	 * returns a view of all available items
	 */
	
	
	/**
	 * returns a list of items filtered by title
	 */
	@RequestMapping(path = "search.do", method = RequestMethod.GET)
	public ModelAndView searchResults(@RequestParam("EquipmentType") String equipmentType,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("searchpage");
		List<Item> searchResults = itemDAO.getOfferedItemsByTitle(equipmentType);
		mv.addObject("searchResults", searchResults);
		return mv;
	}
	
	//return a view with single item detail -- GET
	
	//send user to page where they can add an item -- POST REDIRECT
		//send user to page with added item
	
	//return a page with a user and all their items -- GET
	
	//send user to page where they can update item --POST REDIRECT
		//send user to page with updated item
	
}
