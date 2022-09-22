package com.one.apedia.movie.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.one.apedia.movie.dao.MovieDao;
import com.one.apedia.movie.dto.MovieDto;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao dao;
	
	//갤러리 이미지 list
	public void getList(HttpServletRequest request) {
		
		MovieDto dto = new MovieDto();
	
		//MovieDao 객체를 이용해서 회원 목록을 얻어온다.
		List<MovieDto> list = dao.getList(dto);
	   
		//request 영역에 담아주기
		request.setAttribute("list", list);	//movie list
		
	}
		
	@Override
	public void insert(MovieDto dto, HttpServletRequest request) {

		dao.insert(dto);
		
	}
	
	//갤러리 detail 페이지에 필요한 data를 ModelAndView 에 저장
	@Override
	public void getDetail(ModelAndView mView, int num) {
		//dao 로 해당 게시글 num 에 해당하는 데이터(dto)를 가져온다.
		MovieDto dto = dao.getData(num);
		//ModelAndView 에 가져온 MovieDto 를 담는다.
		mView.addObject("dto", dto);

	}
	
	//갤러리의 num에 해당하는 번호 사진게시글 삭제
	@Override
	public void delete(ModelAndView mView, int num) {
		dao.delete(num);

	}
}
