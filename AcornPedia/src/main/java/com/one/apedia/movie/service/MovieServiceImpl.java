package com.one.apedia.movie.service;

import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.one.apedia.cafe.dto.CafeDto;
import com.one.apedia.movie.dao.MovieDao;
import com.one.apedia.movie.dto.MovieDto;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao dao;

	// 갤러리 이미지 list
	public void getList(HttpServletRequest request) {

		MovieDto dto = new MovieDto();
		MovieDto dto2 = new MovieDto();

		// MovieDao 객체를 이용해서 회원 목록을 얻어온다.
		List<MovieDto> list = dao.getList(dto);
		List<MovieDto> list2 = dao.getList2(dto2);

		// request 영역에 담아주기
		request.setAttribute("list", list); // movie list
		request.setAttribute("list2", list2); // movie list

	}

	@Override
	public void insert(MovieDto dto, HttpServletRequest request) {
		dao.insert(dto);
	}

	// 갤러리 detail 페이지에 필요한 data를 ModelAndView 에 저장
	@Override
	public void getDetail(ModelAndView mView, int num) {
		// dao 로 해당 게시글 num 에 해당하는 데이터(dto)를 가져온다.

		MovieDto dto = dao.getData(num);
		mView.addObject("dto", dto);

	}

	// 갤러리의 num에 해당하는 번호 사진게시글 삭제
	@Override
	public void delete(ModelAndView mView, int num) {
		dao.delete(num);

	}

	@Override
	public void addStars(String id, int num, int star) {
		dao.addStars(id, num, star);
	}

	@Override
	public Integer getStars(String id, int num) {
		return dao.getStars(id, num);

	}

	@Override
	public void updateStars(String id, int num, int star) {
		dao.updateStars(id, num, star);

	}

	@Override
	public void addHeart(String id, int num, String heart) {
		dao.addHeart(id, num, heart);

	}

	@Override
	public Integer getHeart(String id, int num) {
		return dao.getHeart(id, num);
	}

	@Override
	public void updateHeart(String id, int num, String heart) {
		dao.updateHeart(id, num, heart);
	}

	@Override
	public void getSearch(MovieDto dto, HttpServletRequest request) {
		// TODO Auto-generated method stub
		/*
		 * [ 검색 키워드에 관련된 처리 ] -검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.
		 */
		String keyword = request.getParameter("keyword");

		// 만일 키워드가 넘어오지 않는다면
		if (keyword == null) {
			// 키워드와 검색 조건에 빈 문자열을 넣어준다.
			// 클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서
			keyword = "";
		}

		// 만일 검색 키워드가 넘어온다면
		if (!keyword.equals("")) {
			dto.setTitle(keyword);

		}

		List<MovieDto> list = dao.getSearch(dto);
		request.setAttribute("list", list); // movie list

	}
}
