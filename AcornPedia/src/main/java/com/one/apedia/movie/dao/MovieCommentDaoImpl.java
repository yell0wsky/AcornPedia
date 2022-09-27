package com.one.apedia.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.one.apedia.movie.dto.MovieCommentDto;

@Repository
public class MovieCommentDaoImpl implements MovieCommentDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MovieCommentDto> getList(MovieCommentDto dto) {
		
		return session.selectList("movieComment.getList", dto);
	}

	@Override
	public void delete(int num) {
		session.update("movieComment.delete", num);
	}

	@Override
	public void insert(MovieCommentDto dto) {
		session.insert("movieComment.insert", dto);
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("movieComment.getSequence");
	}

	@Override
	public void update(MovieCommentDto dto) {
		session.update("movieComment.update", dto);
	}

	@Override
	public MovieCommentDto getData(int num) {
		
		return session.selectOne("movieComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		
		return session.selectOne("movieComment.getCount", ref_group);
	}

}
