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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import data.ActivityDAO;
import data.AddressDAO;
import data.ItemDAO;
import data.UserDAO;
import entities.Activity;
import entities.Address;
import entities.Item;
import entities.Login;
import entities.User;

@Controller
@SessionAttributes({ "authenticatedUser", "loggedIn" })
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
	 * initializes anonymous user into session user has no other attributes set
	 * 
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
	 * 
	 * @return false
	 */
	@ModelAttribute("loggedIn")
	public boolean initLoggedIn() {
		return false;
	}

	/**
	 * Shows the index page TODO--1+ users should see if they have new requests
	 * 
	 * @return
	 */
	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView showIndex() {
		ModelAndView mv = new ModelAndView("HomePage");
		return mv;
	}

	/**
	 * Shows the login page
	 * 
	 * @return
	 */
	@RequestMapping(path = "showLogin.do", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpSession session) {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

	/**
	 * Checks user login if successful, redirects to index, changes authUser and
	 * loggedIn
	 * 
	 * @param userEmail
	 *            -- user email passed in from form
	 * @param userPass
	 *            -- user pw passed in from form
	 * @param session
	 *            -- used to add user to session if successful
	 * @return -- the ModelAndView object
	 */
	@RequestMapping(path = "completeLogin.do", method = RequestMethod.POST)
	public ModelAndView completeLogin(@RequestParam("userEmail") String userEmail,
			@RequestParam("userPass") String userPass, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = userDAO.userLogin(userEmail, userPass);
		if (u != null) { // user logged in successfully
			session.setAttribute("authenticatedUser", u); // add to session as authenticatedUser
			session.setAttribute("loggedIn", true); // change loggedIn to true to hide login button
			mv.setViewName("redirect:index.do"); // redirect to index view
		} else { // login not successful
			mv.addObject("loginFail", true); // add boolean to model indicating such
			mv.setViewName("showlogin.do");
		}
		return mv;
	}

	/**
	 * logs out active user, hopefully, but tbh i don't really know yet TODO
	 * 
	 * @param status
	 *            -- used to clear session
	 * @return -- the ModelAndView object
	 */
	@RequestMapping(path = "userLogout.do", method = RequestMethod.GET)
	public ModelAndView userLogout(SessionStatus status) {
		ModelAndView mv = new ModelAndView("logout");
		status.setComplete();
		return mv;
	}

	/**
	 * Shows a user page with a list of their items level 0 users are only shown
	 * user first name level 1+ users are given full user info
	 * 
	 * @param id
	 *            -- used to get the user out of the database
	 * @param session
	 *            -- used to check authUser permissions
	 * @return -- the ModelAndView object
	 */
	@RequestMapping(path = "userDetail.do", method = RequestMethod.GET)
	public ModelAndView userDetail(@RequestParam("userId") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView("userDetail");
		User authUser = (User) session.getAttribute("authenticatedUser");
		User requestedUser = userDAO.getUserById(id);
		List<Item> requestedUserItems = itemDAO.getOfferedItemsByUserId(requestedUser.getId());
		requestedUserItems.size();
		if (authUser.getPermissionLevel() > 0) { // user is allowed to see all the things
			mv.addObject("authUserHasPermission", true);
			mv.addObject("requestedUser", requestedUser);
		} else { // they're only allowed to see first name
			mv.addObject("authUserHasPermission", false);
			mv.addObject("requestedUserFirstName", requestedUser.getFirstName());
		}
		mv.addObject("requestedUserItems", requestedUserItems);
		return mv;
	}

	/**
	 * show a user page with all their past activity assume that if user is sent
	 * here, they have permission to see the requested user's activity
	 * 
	 * @param userId
	 *            -- used to get the user and user activity out of the database
	 * @return -- the ModelAndView object
	 */
	public ModelAndView userActivityDetail(@RequestParam("userId") int userId) {
		ModelAndView mv = new ModelAndView("userActivityDetail");
		User requestedUser = userDAO.getUserById(userId);
		List<Activity> requestedUserActivity = activityDAO.viewActivityByUser(requestedUser);
		requestedUserActivity.size();
		mv.addObject("requestedUser", requestedUser);
		mv.addObject("requestedUserActivity", requestedUserActivity);
		return mv;
	}

	/*
	 * Need a way to display a list of users. Need a way to show a filtered list of
	 * users. -->do this last
	 */

	/**
	 * Shows a page with all requests that user has been sent
	 * Returns them to login page if they do not have permissions
	 * @param session 	-- used to get auth user out of the session
	 * @return 			-- used to return received requests and display them
	 */
	@RequestMapping(path = "getRequestsSentToUser.do", method = RequestMethod.GET)
	public ModelAndView getRequestsSentToUser(HttpSession session) {
		ModelAndView mv = new ModelAndView("userRequestDetail");
		User user = (User) session.getAttribute("authenticatedUser");
		if (user.getPermissionLevel() > 0) {

			List<Activity> receivedRequests = activityDAO.getNewRequestsByUser(user);
			receivedRequests.size();
			mv.addObject("receivedRequests", receivedRequests);
			return mv;
		} else {
			mv.setViewName("redirect:showLogin.do");
			return mv;
		}
	}
	
	/**
	 * Shows a page where a user can register
	 * 
	 * @return			-- used to take user to process page and log them in
	 */
	@RequestMapping(path = "getNewUser.do", method = RequestMethod.GET)
	public ModelAndView getNewUser() {
		ModelAndView mv = new ModelAndView("join");
		Login modelLogin = new Login();
		mv.addObject("modelLogin", modelLogin);
		return mv;
	}

	
	@RequestMapping(path = "processJoinEmail.do", method = RequestMethod.POST)
	public ModelAndView processJoinEmail(Login userLogin, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView("redirect:join.do");
		User modelUser = new User();
		redir.addFlashAttribute("modelUser", modelUser);
		redir.addFlashAttribute("userLogin", userLogin);
		return mv;
	}
	
	@RequestMapping(path = "processJoinUser.do", method = RequestMethod.POST)
	public ModelAndView processJoinUser(User userInfo, RedirectAttributes redir, @ModelAttribute("userLogin") Login userLogin) {
		ModelAndView mv = new ModelAndView("redirect:join.do");
		Address modelAddress = new Address();
		redir.addFlashAttribute("modelAddress", modelAddress);
		redir.addFlashAttribute("userInfo", userInfo);
		redir.addFlashAttribute("userLogin", userLogin);
		return mv;
	}
	
	
	@RequestMapping(path = "processJoinAddress.do", method = RequestMethod.POST) 
	public ModelAndView processJoinAddress(Address userAddress, RedirectAttributes redir, @ModelAttribute("userLogin") Login userLogin, 
			@ModelAttribute("userInfo") User userInfo) {
		ModelAndView mv = new ModelAndView("redirect:join.do");
		userAddress = addressDAO.createAddress(userAddress);
//		userLogin = //stuff goes here;
		userInfo = userDAO.createUser(userInfo);
		
		return mv;
		
	}
	
//	public ModelAndView userCreated( ) {
//		
//	}
	// show a page where a user can register -- POST REDIRECT
	// TODO--should only be available to 0 users
	// sign up completed page

	// show a page to update user info -- POST REDIRECT
	// TODO-- 1+ user level
	// update completed page
}
