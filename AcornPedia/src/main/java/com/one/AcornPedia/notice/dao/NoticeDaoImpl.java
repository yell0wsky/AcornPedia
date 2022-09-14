package com.one.AcornPedia.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.AcornPedia.notice.dto.noticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<noticeDto> getList(noticeDto dto) {
		
		return session.selectList("notice.getList", dto);
	}

	@Override
	public int getCount(noticeDto dto) {
		
		return session.selectOne("notice.getCount", dto);
	}

	@Override
	public void insert(noticeDto dto) {
		session.insert("notice.insert", dto);
	}

	@Override
	public noticeDto getData(int num) {
		
		return session.selectOne("notice.getData", num);
	}

	@Override
	public noticeDto getData(noticeDto dto) {
		
		return session.selectOne("notice.getData2", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("notice.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("notice.delete", num);
	}

	@Override
	public void update(noticeDto dto) {
		session.update("notice.update", dto);
	}

}
