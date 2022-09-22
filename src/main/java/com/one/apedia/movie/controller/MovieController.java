package com.one.apedia.movie.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	//movie 사진 업로드 form 페이지로 이동
	@RequestMapping(value = "/movie/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("movie/upload_form");
	}
	
	//movie 사진 업로드 & DB 저장
	@RequestMapping(value = "/movie/upload")
	public ModelAndView authUpload(MovieDto dto, HttpServletRequest request) {
		//form 에서 dto 로 데이터 받아옴
		//dto : caption, MultipartFile image 를 가지고 있다.
		//request :  imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		service.saveImage(dto, request);
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("movie/upload");
		
		if (dto.getImage().getSize()==0) {
			mv.addObject("file",false);
		}
		return mv;
		
	}
	
	//movie 사진 업로드 form - ajax form
	@RequestMapping(value = "/movie/ajax_form")
	public ModelAndView authAjaxForm(HttpServletRequest request) {
		
		return new ModelAndView("movie/ajax_form");
	}

	//movie 사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/movie/ajax_upload")
	@ResponseBody
	public Map<String, Object> authAjaxUpload(MovieDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
	}
	
	//imagePath 구성 X -> dto 로 imagePath 를 받아서 DB 에 저장하기
	@RequestMapping(value = "/movie/insert")
	public ModelAndView authInsert(MovieDto dto, HttpServletRequest request) {
		//dto : caption, imagePath 가지고 있다.
		//request : dto 에 writer(id) 추가
		service.insert(dto, request);
		
		return new ModelAndView("movie/upload");
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
	
}
