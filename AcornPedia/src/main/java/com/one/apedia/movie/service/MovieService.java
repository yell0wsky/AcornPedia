package com.one.apedia.movie.service;


import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.one.apedia.movie.dto.MovieDto;

public interface MovieService {
	//갤러리의 list 가져오기
	public void getList(HttpServletRequest request);
	//갤러리에 사진 upload & DB 저장하기
	public void insert(MovieDto dto, HttpServletRequest request);
	//갤러리 detail 페이지에 필요한 data를 ModelAndView 에 저장
	public void getDetail(ModelAndView mView, int num);
	//갤러리에 num에 해당하는 사진 데이터 삭제
	public void delete(ModelAndView mView, int num);
	//영화에 별점추가하기
	public void addStars(String id,int num, int star);
	//영화 별점 확인하기
	public Integer getStars(String id, int num);
	//영화 별점 변경하기
	public void updateStars(String id, int num, int star);

}
