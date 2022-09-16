package com.one.AcornPedia.notice.dao;

import java.util.List;

import com.one.AcornPedia.notice.dto.noticeDto;

public interface NoticeDao {
	//글목록
	public List<noticeDto> getList(noticeDto dto);
	//글의 갯수
	public int getCount(noticeDto dto);
	//글 추가
	public void insert(noticeDto dto);
	//글정보 얻어오기
	public noticeDto getData(int num);
	//키워드를 활용한 글정보 얻어오기
	public noticeDto getData(noticeDto dto);
	//조회수 증가 시키기
	public void addViewCount(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(noticeDto dto);
}
