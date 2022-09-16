package com.one.AcornPedia.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.AcornPedia.notice.dto.noticeCommentDto;

@Repository
public class NoticeCommentDaoImpl implements NoticeCommentDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<noticeCommentDto> getList(noticeCommentDto dto) {
		
		return session.selectList("noticeComment.getList", dto);
	}

	@Override
	public void delete(int num) {
		session.update("noticeComment.delete", num);
	}

	@Override
	public void insert(noticeCommentDto dto) {
		session.insert("noticeComment.insert", dto);
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("noticeComment.getSequence");
	}

	@Override
	public void update(noticeCommentDto dto) {
		session.update("noticeComment.update", dto);
	}

	@Override
	public noticeCommentDto getData(int num) {
		
		return session.selectOne("noticeComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		
		return session.selectOne("noticeComment.getCount", ref_group);
	}

}
