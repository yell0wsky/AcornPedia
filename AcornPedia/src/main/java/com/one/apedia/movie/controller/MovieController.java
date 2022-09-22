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

@Controller
public class MovieController {
	
	@Autowired
	private MovieService service;
	
	//movie list 페이지로 이동
	@RequestMapping(value = "/movie/list")
	public String getList(HttpServletRequest request) {
		//view 페이지에 사용될 데이터는 request 영역에 담는다.
		service.getList(request);
		
		return "movie/list";
	}
	
	//movie 게시글의 num이 parameter get 방식으로 넘어온다.
	//detail 페이지
	@RequestMapping(value = "/movie/detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, @RequestParam int num) {
		//갤러리 detail 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView, num);
		mView.setViewName("movie/detail");
		
		return mView;
	}
	
	//movie 게시글의 num이 parameter get 방식으로 넘어온다.
	//delete 페이지
	@RequestMapping(value = "/movie/delete", method = RequestMethod.GET)
	public ModelAndView authDelete(ModelAndView mView, @RequestParam int num) {
		//get방식으로 받아온 num에 해당하는 갤러리 게시글을 삭제한다.
		service.delete(mView, num);
		mView.setViewName("movie/delete");
		
		return mView;
		
	}
	@RequestMapping("/movie/getStars")
	public ModelAndView getStars(HttpSession session, HttpServletRequest request) {
		//get 방식으로 받아온 num에 해당하는 영화에 star만큼의 별점을 올린다.
		
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("redirectURI", referer);
		String id=(String)session.getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
		int star=Integer.parseInt(request.getParameter("rating"));
		int result=service.getStars(id, num);
		if(result==0) {
			service.addStars(id, num, star);
		}

		return new ModelAndView("movie/detail");
	}
}
