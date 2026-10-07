package com.test.memo.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.test.memo.model.CategoryDto;
import com.test.memo.model.MemoDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemoDao {
	
	private final SqlSessionTemplate template;

	public List<MemoDto> list() {
		
		return template.selectList("memo.list");
	}

	public List<CategoryDto> clist() {
		// TODO Auto-generated method stub
		return template.selectList("memo.clist");
	}

	public int add(MemoDto mdto) {
		// TODO Auto-generated method stub
		return template.insert("memo.add",mdto);
	}

	public MemoDto getMemo(String seq) {
		// TODO Auto-generated method stub
		return template.selectOne("memo.getMemo",seq);
	}

	public int edit(MemoDto dto) {
		// TODO Auto-generated method stub
		return template.update("memo.edit", dto);
	}

	public int del(String seq) {
		// TODO Auto-generated method stub
		return template.delete("memo.del",seq);
	}
}
