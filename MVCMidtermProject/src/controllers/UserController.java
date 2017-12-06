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
import data.NewUserDTO;
import data.UserDAO;
import entities.Activity;
import entities.Address;
import entities.Item;
import entities.Login;
import entities.User;

@Controller
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
			mv.setViewName("HomePage"); // redirect to index view
		} else { // login not successful
			mv.addObject("loginFail", true); // add boolean to model indicating such
			mv.setViewName("login");
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
	public ModelAndView userLogout(HttpSession session) {
		ModelAndView mv = new ModelAndView("logout");
		session.setAttribute("loggedIn", false);
		User u = new User();
		u.setPermissionLevel(0);
		session.setAttribute("authenticatedUser", u);
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

	/**
	 * Shows a page with all requests that user has been sent
	 * Returns them to login page if they do not have permissions
	 * @param session 	-- used to get auth user out of the session
	 * @return 			-- used to return received requests and display them
	 */
	@RequestMapping(path = "getRequestsSentToUser.do", method = RequestMethod.GET)
	public ModelAndView getRequestsSentToUser(HttpSession session) {
		ModelAndView mv = new ModelAndView("userRequest");
		User authUser = (User) session.getAttribute("authenticatedUser");
		if (authUser.getPermissionLevel() > 0) {
			List<Activity> userBorrows = activityDAO.viewActivityByUser(authUser);
			List<Activity> userLends = activityDAO.getNewRequestsByUser(authUser);
			mv.addObject("userBorrows", userBorrows);
			mv.addObject("userLends", userLends);
		} else {
			mv.setViewName("redirect:showLogin.do");
		}
		return mv;
	}
	
	@RequestMapping(path ="join.do", method = RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView("join");
		
		return mv;
	}
	
	/**
	 * Shows a page where a user can enter login info (email/pw), beginning registration process
	 * First mapping in user registration sequence
	 * @return			-- the ModelAndView object
	 */
	@RequestMapping(path = "getNewUser.do", method = RequestMethod.GET)
	public ModelAndView getNewUser() {
		ModelAndView mv = new ModelAndView("join");
		mv.addObject("newUserDTO", new NewUserDTO());
		return mv;
	}
	
	@RequestMapping(path = "processJoin.do", method = RequestMethod.POST)
	public ModelAndView processJoin(NewUserDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView("HomePage");
		User newUser = userDAO.createUser(dto);
		session.setAttribute("authenticatedUser", newUser);
		session.setAttribute("loggedIn", true);
		return mv;
	}
	
	@RequestMapping(path = "error.do", method = RequestMethod.GET)
	public ModelAndView userHasErrorLoggingIn() {
		ModelAndView mv = new ModelAndView("error");
		return mv;
	}
	
	@RequestMapping(path = "showAdminPage.do", method = RequestMethod.GET)
	public ModelAndView showAdminPage() {
		ModelAndView mv = new ModelAndView("admin");
		return mv;
	}
	
	@RequestMapping(path = "adminUpdateUser.do", method = RequestMethod.GET)
	public ModelAndView adminUpdateUser(HttpSession session,
			@RequestParam("userId") int id) {
		ModelAndView mv = new ModelAndView();
		User requestedUser = userDAO.getUserById(id);
		List<Item> requestedUserItems = itemDAO.getOfferedItemsByUserId(requestedUser.getId());
		requestedUserItems.size();
		mv.addObject("requestedUser", requestedUser);
		mv.addObject("requestedUserItems", requestedUserItems);
		return mv;
	}
}
