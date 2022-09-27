package com.one.apedia.movie.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.one.apedia.movie.dto.MovieDto;
import com.one.apedia.movie.service.MovieService;
import com.one.apedia.users.service.UsersService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService service;
	
	@Autowired
	private UsersService uservice;
	
	//movie list 페이지로 이동
	@RequestMapping(value = "/movie/list")
	public ModelAndView getList(ModelAndView mView, HttpSession session, HttpServletRequest request) {
		//view 페이지에 사용될 데이터는 request 영역에 담는다.
		service.getList(request);
		int count=uservice.count();
		session.setAttribute("count", count);
		mView.setViewName("movie/list");
		
		return mView;
	}
	
	//movie 게시글의 num이 parameter get 방식으로 넘어온다.
	//detail 페이지
	@RequestMapping(value = "/movie/detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, HttpSession session, @RequestParam int num) {
		String id=(String)session.getAttribute("id");
		//갤러리 detail 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView, num);
		int stars=0;
		if (id!=null) {
			if(service.getStars(id, num)!=null){
				stars=service.getStars(id, num);
			} 
		}
		mView.addObject("stars", stars);
		mView.setViewName("movie/detail");
		
		return mView;
	}
		
	@RequestMapping("/movie/runStars")
	public ModelAndView runStars(HttpSession session, HttpServletRequest request) {
		//get 방식으로 받아온 num에 해당하는 영화에 star만큼의 별점을 올린다.
		
		String id=(String)session.getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
		int star;
		if(request.getParameter("rating")!=null) {
			star=Integer.parseInt(request.getParameter("rating"));
		}else {
			star=0;
		}
		
		if(service.getStars(id, num)!=null) {
			service.updateStars(id, num, star);
		}else {
			service.addStars(id, num, star);
			uservice.addpoint(id);
		}	

		return new ModelAndView("redirect:/movie/detail.do?num="+num);
	}
		

}
