package com.homet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.homet.model.PageDto;
import com.homet.model.Videos;

@Mapper
public interface VideosMapper {
	List<Videos> getAll();
	Videos getOne(int vidx);
	int categoryCount(Videos video);
	List<Videos> getPageList(PageDto dto);
	int listCount();
	int insert(Videos video);
	int update(Videos video);
	int updateReadCnt(int vidx);
	int delete(int vidx);
}
