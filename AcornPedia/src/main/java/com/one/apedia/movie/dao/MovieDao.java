package com.one.apedia.movie.dao;

import java.util.List;

import com.one.apedia.movie.dto.MovieDto;

public interface MovieDao {
	//Movie 리스트 가져오기
	public List<MovieDto> getList(MovieDto dto);
	//모든 ROW 의 개수
	public int getCount();
	//갤러리에 사진 저장하기
	public void insert(MovieDto dto);
	//pk num 에 해당하는 DB 에서 Movie 게시글 하나의 data 가져오기
	public MovieDto getData(int num);
	
}
