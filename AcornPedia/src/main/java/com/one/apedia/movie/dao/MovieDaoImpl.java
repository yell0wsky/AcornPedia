package com.one.apedia.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.apedia.movie.dto.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private SqlSession session;
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : getList
	 * parameterType : MovieDto
	 * resultType : MovieDto
	 */
	//movie 의 모든 리스트 가져오기
	@Override
	public List<MovieDto> getList(MovieDto dto) {
		
		return session.selectList("movie.getList", dto);
	}
	
	public List<MovieDto> getList2(MovieDto dto2) {
		
		return session.selectList("movie.getList2", dto2);
	}
	
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : getCount
	 * resultType : int
	 */
	//row 의 총 개수 구하기
	@Override
	public int getCount() {
		return session.selectOne("movie.getCount");
	}
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : insert
	 * parameterType : MovieDto
	 */
	@Override
	public void insert(MovieDto dto) {
		session.insert("movie.insert", dto);
	}
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : getData
	 * parameterType : int
	 * resultType : MovieDto
	 */
	@Override
	public MovieDto getData(int num) {
		return session.selectOne("movie.getData", num);
	}
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : delete
	 * parameterType : int 
	 */
	@Override
	public void delete(int num) {
		session.delete("movie.delete", num);
	}

	@Override
	public void addStars(String id, int num, int star) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);
		parameters.put("num", num);
		parameters.put("star", star);		
		session.insert("movie.addStars", parameters);
	}
	
	public int getStars(String id, int num) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);
		parameters.put("num", num);
		return session.selectOne("movie.getStars", parameters);
	}
	
}
