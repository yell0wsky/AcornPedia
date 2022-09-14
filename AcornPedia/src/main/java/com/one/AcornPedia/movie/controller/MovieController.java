package com.one.AcornPedia.movie.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.one.AcornPedia.movie.dto.MovieDto;
import com.one.AcornPedia.movie.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService service;
	
	//Movie list 페이지로 이동
	@RequestMapping(value = "/Movie/list")
	public String getList(HttpServletRequest request) {
		//view 페이지에 사용될 데이터는 request 영역에 담는다.
		service.getList(request);
		
		return "Movie/list";
	}
	
	//Movie 사진 업로드 form 페이지로 이동
	@RequestMapping(value = "/Movie/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("Movie/upload_form");
	}
	
	//Movie 사진 업로드 & DB 저장
	@RequestMapping(value = "/Movie/upload")
	public ModelAndView authUpload(MovieDto dto, HttpServletRequest request) {
		//form 에서 dto 로 데이터 받아옴
		//dto : caption, MultipartFile image 를 가지고 있다.
		//request :  imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		service.saveImage(dto, request);
		
		return new ModelAndView("Movie/upload");
	}
	
	//Movie 사진 업로드 form - ajax form
	@RequestMapping(value = "/Movie/ajax_form")
	public ModelAndView authAjaxForm(HttpServletRequest request) {
		
		return new ModelAndView("Movie/ajax_form");
	}

	//Movie 사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/Movie/ajax_upload")
	@ResponseBody
	public Map<String, Object> authAjaxUpload(MovieDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
	}
	
	//imagePath 구성 X -> dto 로 imagePath 를 받아서 DB 에 저장하기
	@RequestMapping(value = "/Movie/insert")
	public ModelAndView authInsert(MovieDto dto, HttpServletRequest request) {
		//dto : caption, imagePath 가지고 있다.
		//request : dto 에 writer(id) 추가
		service.insert(dto, request);
		
		return new ModelAndView("Movie/upload");
	}
	
	//Movie 게시글의 num 이 parameter get 방식으로 넘어온다.
	//detail 페이지
	@RequestMapping(value = "/Movie/detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, @RequestParam int num) {
		//갤러리 detail 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView, num);
		mView.setViewName("Movie/detail");
		
		return mView;
	}
	
}
