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
import helpers.GoogleAddressHelper;

@Controller
public class ItemController {
	
	@Autowired
	ItemDAO itemDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	GoogleAddressHelper gmap;
	
	/**
	 * returns a view of all available items
	 * @return	-- the ModelAndView object
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
	 * @return -- the ModelAndView object
	 */
	@RequestMapping(path = "showSearchPage.do", method = RequestMethod.GET)
	public ModelAndView showSearchPage() {
		return new ModelAndView("searchpage");
	}
	
	/**
	 * shows a list of items filtered by title
	 * @param equipmentType	-- needed to get results
	 * @return				-- the ModelAndView object
	 */
	@RequestMapping(path = "searchResults.do", method = RequestMethod.GET)
	public ModelAndView searchResults(@RequestParam("EquipmentType") String equipmentType, @RequestParam("EquipmentZip") String equipmentZip) {
		ModelAndView mv = new ModelAndView("searchpage");
		List<Item> searchResults = itemDAO.getOfferedItemsByTitle(equipmentType);
		mv.addObject("searchResults", searchResults);
		mv.addObject("map", gmap.gMapsEmbedFormatter(searchResults.get(0).getOwner().getAddress().formatAddress()));
		return mv;
	}
	
	/**
	 * shows detailed item view, also some user info based on currentUser permission level
	 * if user is permission level 1+, adds item owner info
	 * if user owns item, adds boolean indicating so
	 * @param itemId		-- pass in like so: "itemDetail.do?itemId=${item.id}" 
	 * @param session	-- needed to check user permissions
	 * @return			-- the ModelAndView object
	 */
	@RequestMapping(path = "itemDetail.do", method = RequestMethod.GET)
	public ModelAndView itemDetail(@RequestParam("itemId") int itemId,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("itemDetail");
		Item itemDetail = itemDAO.getItemById(itemId);
		mv.addObject("itemDetail", itemDetail);
		User authUser = (User) session.getAttribute("authenticatedUser");
		
		if (authUser.getPermissionLevel() > 0) {		//they're are logged in and can see stuff
			User itemOwner = userDAO.getUserById(itemDetail.getOwner().getId());
			mv.addObject("itemOwner", itemOwner);
		}
		if (authUser.equals(itemDetail.getOwner())) {	//they're the owner of the item, so they can update it
			mv.addObject("authUserIsItemOwner", true);	//add a boolean to indicate that, so view can create an update link
		}
		return mv;
	}
	
	/**
	 * send user to a page where they can update an item
	 * expect that user is allowed to update item, because they were directed here correctly
	 * @param itemId		-- pass in like so: "showUpdateItem.do?itemId=${item.id}" 
	 * @return			-- the ModelAndView object
	 */
	@RequestMapping(path = "showUpdateItem.do", method = RequestMethod.GET)
	public ModelAndView showUpdateItem(@RequestParam("itemId") int itemId) {
		ModelAndView mv = new ModelAndView("updateItem");
		Item itemToUpdate = itemDAO.getItemById(itemId);
		mv.addObject("itemToUpdate", itemToUpdate);
		return mv;
	}
	
	/**
	 * processes item update and redirects to itemDetail.do
	 * @param updatedItem	-- command item created from spring form in updateItem view
	 * @param redir			-- to add flash attribute for redirect
	 * @return				-- the ModelAndView object
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
		Item modelItem = new Item();
		mv.addObject("modelItem", modelItem);
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
	public ModelAndView processAddItem(Item addedItem, HttpSession session) {
		ModelAndView mv = new ModelAndView("itemDetail");
		User authUser = (User) session.getAttribute("authenticatedUser");
		addedItem.setOwner(authUser);
		addedItem = itemDAO.createItem(addedItem);
		mv.addObject("itemDetail", addedItem);
		return mv;
	}
	
}
