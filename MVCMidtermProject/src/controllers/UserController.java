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
import data.UserDAO;
import entities.Activity;
import entities.Item;
import entities.User;

@Controller
@SessionAttributes({"authenticatedUser", "requestedUser", "requestedUserItems", "requestedUserActivity", "userReceivedRequests"})
public class UserController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	AddressDAO addressDAO;

	@Autowired
	ActivityDAO activityDAO;

	/**
	 * Shows the index page
	 * 
	 * @return
	 */

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView showIndex(@ModelAttribute("authenticatedUser") User authenticatedUser,
			HttpSession session) {
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
	 * Completes login and redirects to index
	 */
	@RequestMapping(path = "completeLogin.do", method = RequestMethod.POST)
	public ModelAndView completeLogin(@RequestParam("userEmail") String userEmail,
			@RequestParam("userPass") String userPass,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = userDAO.userLogin(userEmail, userPass);
		if (u != null) {
			session.setAttribute("authenticatedUser", u);
			mv.setViewName("redirect:index.do");
		}
		else {
			session.setAttribute("loginFail", true);
			mv.setViewName("login");
		}
		
		return mv;
	}
	
	/**
	 * logs out active user, hopefully
	 */
	public ModelAndView userLogout(SessionStatus status) {
		ModelAndView mv = new ModelAndView("logout");
		status.setComplete();
		return mv;
	}

	/**
	 * Shows a user page with a list of their items
	 */
	public ModelAndView userItemsDetail(@RequestParam("userId") int id,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("userItemsDetail");
		User requestedUser = userDAO.getUserById(id);
		List<Item> userItems = requestedUser.getItems();
		userItems.size();
		session.setAttribute("requestedUser", requestedUser);
		session.setAttribute("requestedUserItems", userItems);
		return mv;
	}
	
	/**
	 * show a user page with all their past activity
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
	 */
	public ModelAndView getRequestsSentToUser(@ModelAttribute("authenticatedUser") User authenticatedUser,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("userRequestDetail");
		List<Activity> receivedRequests = activityDAO.getNewRequestsByUser(authenticatedUser);
		receivedRequests.size();
		session.setAttribute("receivedRequests", receivedRequests);
		return mv;
	}
	
	// show a page with all requests for that user

	// show a page where a user can register -- POST REDIRECT
		// sign up completed page

	// show a page to update user info -- POST REDIRECT
		// update completed page
}
