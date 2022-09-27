package com.one.apedia.movie.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.one.apedia.movie.dto.MovieCommentDto;
import com.one.apedia.movie.dao.MovieCommentDao;
import com.one.apedia.exception.NotDeleteException;
import com.one.apedia.movie.dao.MovieDao;
import com.one.apedia.movie.dto.MovieDto;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao dao;
	@Autowired 
	private MovieCommentDao movieCommentDao;

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
	public void addHeart(String id, int num) {
		dao.addHeart(id, num);

	}

	@Override
	public String getHeart(String id, int num) {
		return dao.getHeart(id, num);
	}

	@Override
	public void deleteHeart(String id, int num) {
		dao.deleteHeart(id, num);
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		// 폼 전송되는 파라미터 추출
		int ref_group = Integer.parseInt(request.getParameter("ref_group"));
		String target_id = request.getParameter("target_id");
		String content = request.getParameter("content");
		/*
		 * 원글의 댓글은 comment_group 번호가 전송이 안되고 댓글의 댓글은 comment_group 번호가 전송이 된다. 따라서 null
		 * 여부를 조사하면 원글의 댓글인지 댓글의 댓글인지 판단할수 있다.
		 */
		String comment_group = request.getParameter("comment_group");

		// 댓글 작성자는 session 영역에서 얻어내기
		String writer = (String) request.getSession().getAttribute("id");
		// 댓글의 시퀀스 번호 미리 얻어내기
		int seq = movieCommentDao.getSequence();
		// 저장할 댓글의 정보를 dto 에 담기
		MovieCommentDto dto = new MovieCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		// 원글의 댓글인경우
		if (comment_group == null) {
			// 댓글의 글번호를 comment_group 번호로 사용한다.
			dto.setComment_group(seq);
		} else {
			// 전송된 comment_group 번호를 숫자로 바꾸서 dto 에 넣어준다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		// 댓글 정보를 DB 에 저장하기
		movieCommentDao.insert(dto);

	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		// 삭제할 댓글 정보를 읽어와서
		MovieCommentDto dto = movieCommentDao.getData(num);
		String id = (String) request.getSession().getAttribute("id");
		// 글 작성자와 로그인된 아이디와 일치하지 않으면
		if (!dto.getWriter().equals(id)) {
			throw new NotDeleteException("남의 댓글 지우면 혼난당!");
		}

		movieCommentDao.delete(num);

	}

	@Override
	public void updateComment(MovieCommentDto dto) {
		movieCommentDao.update(dto);

	}

	@Override
	public void moreCommentList(HttpServletRequest request) {
		// 로그인된 아이디
		String id = (String) request.getSession().getAttribute("id");
		// ajax 요청 파라미터로 넘어오는 댓글의 페이지 번호를 읽어낸다
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		// ajax 요청 파라미터로 넘어오는 원글의 글 번호를 읽어낸다
		int num = Integer.parseInt(request.getParameter("num"));
		/*
		 * [ 댓글 페이징 처리에 관련된 로직 ]
		 */
		// 한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 10;

		// 보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		// 원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		MovieCommentDto commentDto = new MovieCommentDto();
		commentDto.setRef_group(num);
		// 1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);

		// pageNum에 해당하는 댓글 목록만 select 되도록 한다.
		List<MovieCommentDto> commentList = movieCommentDao.getList(commentDto);
		// 원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow = movieCommentDao.getCount(num);
		// 댓글 전체 페이지의 갯수
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		// view page 에 필요한 값 request 에 담아주기
		request.setAttribute("commentList", commentList);
		request.setAttribute("num", num); // 원글의 글번호
		request.setAttribute("pageNum", pageNum); // 댓글의 페이지 번호

	}

}
