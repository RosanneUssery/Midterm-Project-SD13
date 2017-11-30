package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.ActivityDAO;
import data.AddressDAO;
import data.ItemDAO;
import data.UserDAO;

@Controller
public class MainController {

	
		@Autowired
		private ActivityDAO activityDAO;
		private AddressDAO addressDAO;
		private ItemDAO itemDAO;
		private UserDAO userDAO;

		@RequestMapping(path = "hello.do", method = RequestMethod.GET)
		public String hello() {
			return "HomePage.jsp";
		}
		
//		@RequestMapping(path = "actor.do", method = RequestMethod.GET)
//		public ModelAndView actors(@RequestParam("aid") int aid) {
//			ModelAndView mv = new ModelAndView();
//			Actor actor = actorDAO.show(aid);
//			mv.addObject("actor", actor);
//			mv.setViewName("hw.jsp");
//			return mv;
//			
//		}
//		@RequestMapping(path = "actors.do", method = RequestMethod.GET)
//		public ModelAndView allActors() {
//			ModelAndView mv = new ModelAndView();
//			List<Actor> actors = actorDAO.getAllActors();
//			mv.addObject("actors", actors);
//			mv.setViewName("hw.jsp");
//			return mv;
//			
//		}
//		
//		@RequestMapping(path = "film.do", method = RequestMethod.GET)
//		public ModelAndView film(@RequestParam("fid") int fid) {
//			ModelAndView mv = new ModelAndView();
//			Film film = filmdao.show(fid);
//			mv.addObject("film", film);
//			mv.setViewName("index.jsp");
//			return mv;
//			
//		}
//		@RequestMapping(path = "films.do", method = RequestMethod.GET)
//		public ModelAndView allFilms() {
//			ModelAndView mv = new ModelAndView();
//			List<Film> films = filmdao.getAllFilms();
//			mv.addObject("films", films);
//			mv.setViewName("index.jsp");
//			return mv;
//			
//		}
	 
	}


