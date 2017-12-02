package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import data.ActivityDAO;
import data.AddressDAO;
import data.ItemDAO;
import data.UserDAO;
import entities.Activity;
import entities.Item;
import entities.User;

@Controller
@SessionAttributes({"authenticatedUser", "loggedIn"})
public class UserController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	AddressDAO addressDAO;

	@Autowired
	ActivityDAO activityDAO;
	
	@Autowired
	ItemDAO itemDAO;
	
	/**
	 * initializes anonymous user into session
	 * user has no other attributes set
	 * @return
	 */
	@ModelAttribute("authenticatedUser")
	public User initAuthenticatedUser() {
		User u = new User();
		u.setPermissionLevel(0);
		return u;
	}
	
	/**
	 * initializes loggedIn boolean to false
	 * @return false
	 */
	@ModelAttribute("loggedIn")
	public boolean initLoggedIn() {
		return false;
	}

	/**
	 * Shows the index page
	 * TODO--1+ users should see if they have new requests
	 * @return
	 */
	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView showIndex() {
		ModelAndView mv = new ModelAndView("HomePage");
		return mv;
	}

	/**
	 * Shows the login page
	 * @return
	 */

	@RequestMapping(path = "showLogin.do", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpSession session) {
		
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

	/**
	 * Checks user login
	 * if successful, redirects to index, changes authUser and loggedIn
	 * @param userEmail		-- user email passed in from form
	 * @param userPass		-- user pw passed in from form
	 * @param session		-- used to add user to session if successful
	 * @return				-- the ModelAndView object
	 */
	@RequestMapping(path = "completeLogin.do", method = RequestMethod.POST)
	public ModelAndView completeLogin(@RequestParam("userEmail") String userEmail,
			@RequestParam("userPass") String userPass,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = userDAO.userLogin(userEmail, userPass);
		if (u != null) {										//user logged in successfully
			session.setAttribute("authenticatedUser", u);	//add to session as authenticatedUser
			session.setAttribute("loggedIn", true);			//change loggedIn to true to hide login button
			mv.setViewName("redirect:index.do");				//redirect to index view
		}
		else {												//login not successful
			mv.addObject("loginFail", true);					//add boolean to model indicating such
			mv.setViewName("login");
		}
		return mv;
	}
	
	/**
	 * logs out active user, hopefully, but tbh i don't really know yet TODO
	 * @param status		-- used to clear session
	 * @return			-- the ModelAndView object
	 */
	@RequestMapping(path = "userLogout.do", method = RequestMethod.GET)
	public ModelAndView userLogout(SessionStatus status) {
		ModelAndView mv = new ModelAndView("logout");
		status.setComplete();
		return mv;
	}

	/**
	 * Shows a user page with a list of their items
	 * level 0 users are only shown user first name
	 * level 1+ users are given full user info
	 * @param id			-- used to get the user out of the database
	 * @param session	-- used to check authUser permissions
	 * @return			-- the ModelAndView object
	 */
	@RequestMapping(path = "userDetail.do", method = RequestMethod.GET)
	public ModelAndView userDetail(@RequestParam("userId") int id,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("userDetail");
		User authUser = (User) session.getAttribute("authenticatedUser");
		User requestedUser = userDAO.getUserById(id);
		List<Item> requestedUserItems = itemDAO.getOfferedItemsByUserId(requestedUser.getId());
		requestedUserItems.size();
		if (authUser.getPermissionLevel() > 0) {		//user is allowed to see all the things
			mv.addObject("authUserHasPermission", true);
			mv.addObject("requestedUser", requestedUser);
		}
		else {		//they're only allowed to see first name
			mv.addObject("authUserHasPermission", false);
			mv.addObject("requestedUserFirstName", requestedUser.getFirstName());
		}
		mv.addObject("requestedUserItems", requestedUserItems);
		return mv;
	}
	
	/**
	 * show a user page with all their past activity
	 * TODO--0 users can't see anything, 1 users can see their own, 2 users can see anyone's
	 */
	public ModelAndView userActivityDetail(@RequestParam("userId") int id,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("userActivityDetail");
		User requestedUser = userDAO.getUserById(id);
		List<Activity> requestedUserActivity = activityDAO.viewActivityByUser(requestedUser);
		requestedUserActivity.size();
		session.setAttribute("requestedUser", requestedUser);
		session.setAttribute("requestedUserActivity", requestedUserActivity);
		return mv;
	}
	
	/**
	 * shows a page with all requests that user has been sent
	 * TODO--0 users get redirected to login, 1+ users see their info
	 */
//	public ModelAndView getRequestsSentToUser(
//			@ModelAttribute("authenticatedUser") User authenticatedUser,
//			HttpSession session) {
//		ModelAndView mv = new ModelAndView("userRequestDetail");
//		List<Activity> receivedRequests = activityDAO.getNewRequestsByUser(authenticatedUser);
//		receivedRequests.size();
//		session.setAttribute("receivedRequests", receivedRequests);
//		return mv;
//	}
	

	// show a page where a user can register -- POST REDIRECT
		//TODO--should only be available to 0 users
		// sign up completed page

	// show a page to update user info -- POST REDIRECT
		//TODO-- 1+ user level
		// update completed page
}
