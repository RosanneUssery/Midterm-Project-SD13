package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.ActivityDAO;
import data.AddressDAO;
import data.UserDAO;
import entities.User;

@Controller
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
	public ModelAndView showIndex() {
		ModelAndView mv = new ModelAndView("/views/HomePage.jsp");
		return mv;
	}

	/**
	 * Shows the login page
	 * 
	 * @return
	 */

	@RequestMapping(path = "showLogin.do", method = RequestMethod.GET)
	public ModelAndView showLogin() {
		ModelAndView mv = new ModelAndView("login.jsp");
		return mv;
	}

	/**
	 * Completes login and redirects to index
	 */
	public ModelAndView completeLogin(@RequestParam("userEmail") String userEmail,
			@RequestParam("userPass") String userPass,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = userDAO.userLogin(userEmail, userPass);
		if (u != null) {
			session.setAttribute("authenticatedUser", u);
			mv.setViewName("HomePage.jsp");
		}
		else {
			session.setAttribute("loginFail", true);
			mv.setViewName("login.jsp");
		}
		
		return mv;
	}

	/**
	 * Shows a user page with a list of their items
	 */
	public ModelAndView userDetail(@RequestParam("user") User user) {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	
	// show a user page with all their past activity

	// show a page with all requests for that user

	// show a page where a user can register -- POST REDIRECT
	// sign up completed page

	// show a page to update user info -- POST REDIRECT
	// update completed page
}
