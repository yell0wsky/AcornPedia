package com.one.apedia.movie.dao;

import java.util.List;

import com.one.apedia.movie.dto.MovieDto;

public interface MovieDao {
	//gallery 리스트 가져오기
	public List<MovieDto> getList(MovieDto dto);
	public List<MovieDto> getList2(MovieDto dto);
	//모든 ROW 의 개수
	public int getCount();
	//갤러리에 사진 저장하기
	public void insert(MovieDto dto);
	//pk num 에 해당하는 DB 에서 gallery 게시글 하나의 data 가져오기
	public MovieDto getData(int num);
	//num번 게시글을 DB에서 삭제하기
	public void delete(int num);
	//영화에 별점 추가하기
	public void addStars(String id, int num, int star);
	//영화 별점 확인
	public Integer getStars(String id, int num);
	//영화 별점 변경
	public void updateStars(String id, int num, int star);
	//영화 하트 추가
	public void addHeart(String id, int num, String heart);
	//영화 하트 확인
	public String getHeart(String id, int num);
	//영화 하트 변경
	public void updateHeart(String id, int num, String heart);

}
