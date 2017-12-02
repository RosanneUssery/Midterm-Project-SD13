package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import data.ItemDAO;
import data.UserDAO;
import entities.Item;
import entities.User;

@Controller
public class ItemController {
	
	@Autowired
	ItemDAO itemDAO;
	
	@Autowired
	UserDAO userDAO;
	
	/**
	 * returns a view of all available items
	 */
	@RequestMapping(path = "viewAllItems.do", method = RequestMethod.GET)
	public ModelAndView viewAllItems() {
		ModelAndView mv = new ModelAndView("searchPage");
		
		List<Item> allItems = itemDAO.getAllItems();
		mv.addObject("allItems", allItems);		
		
		return mv;
		
	}
	
	/**
	 * directs user to search page
	 */
	@RequestMapping(path = "showSearchPage.do", method = RequestMethod.GET)
	public ModelAndView showSearchPage() {
		return new ModelAndView("searchpage");
	}
	
	
	/**
	 * returns a list of items filtered by title
	 */
	@RequestMapping(path = "searchResults.do", method = RequestMethod.GET)
	public ModelAndView searchResults(@RequestParam("EquipmentType") String equipmentType,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("searchpage");
		List<Item> searchResults = itemDAO.getOfferedItemsByTitle(equipmentType);
		mv.addObject("searchResults", searchResults);
		return mv;
	}
	
	/**
	 * shows detailed item view, also some user info based on currentUser permission level
	 * @param itemId
	 * @param session
	 * @return
	 */
	@RequestMapping(path = "itemDetail.do", method = RequestMethod.GET)
	public ModelAndView itemDetail(@RequestParam("itemId") int itemId,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("itemDetail");
		Item itemDetail = itemDAO.getItemById(itemId);
		mv.addObject("itemDetail", itemDetail);
		User authUser = (User) session.getAttribute("authenticatedUser");
		
		if (authUser.getPermissionLevel() > 0) {		//they're are logged in and can see stuff
			User itemOwner = userDAO.getUserById(itemDetail.getOwnerId().getId());
			mv.addObject("itemOwner", itemOwner);
		}
		if (authUser.equals(itemDetail.getOwnerId())) {	//they're the owner of the item, so they can update it
			mv.addObject("authUserIsItemOwner", true);	//add a boolean to indicate that, so view can create an update link
		}
		return mv;
	}
	
	/**
	 * send user to a page where they can update an item
	 * expect that user is allowed to update item, because they were directed here correctly
	 * @return
	 */
	@RequestMapping(path = "showUpdateItem.do", method = RequestMethod.GET)
	public ModelAndView showUpdateItem(@RequestParam("itemId") int itemId,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("updateItem");
		User authUser = (User) session.getAttribute("authenticatedUser");
		Item itemToUpdate = itemDAO.getItemById(itemId);
		mv.addObject("itemToUpdate", itemToUpdate);
		return mv;
	}
	
	/**
	 * processes item update and redirects to itemDetail.do
	 */
	@RequestMapping(path = "processItemUpdate.do", method = RequestMethod.POST)
	public ModelAndView processItemUpdate(Item updatedItem, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView("redirect:itemDetail.do");
		updatedItem = itemDAO.updateItem(updatedItem);
		redir.addFlashAttribute("itemId", updatedItem.getId());
		return mv;
	}
	
	/**
	 * sends user to page where they can add an item
	 * @return
	 */
	@RequestMapping(path = "showAddItem.do", method = RequestMethod.GET)
	public ModelAndView showAddItem() {
		ModelAndView mv = new ModelAndView("addItem");
		return mv;
	}
	
	/**
	 * processes add item, redirects to itemDetail.do with item id in flash attributes
	 * @param addedItem	-- command item created from spring form in addItem view
	 * @param session	-- TODO -- needed to set added item's user, unless it's done in spring form
	 * @param redir		-- to add the flash attribute for redirect
	 * @return			-- the ModelAndView object
	 */
	@RequestMapping(path = "processAddItem.do", method = RequestMethod.POST)
	public ModelAndView processAddItem(Item addedItem, HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView("redirect:itemDetail.do");
		addedItem.setOwnerId((User) session.getAttribute("authenticatedUser"));
		addedItem = itemDAO.createItem(addedItem);
		redir.addFlashAttribute("itemId", addedItem.getId());
		return mv;
	}
	
	//return a page with a user and all their items -- GET
	
	
}
