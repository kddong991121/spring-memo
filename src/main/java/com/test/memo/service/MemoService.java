package com.test.memo.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;

import com.test.memo.model.CategoryDto;
import com.test.memo.model.MemoDto;
import com.test.memo.repository.MemoDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemoService {
	private final MemoDao dao;

	public List<MemoDto> list() {
		
		List<MemoDto> list = dao.list();

		Calendar now = Calendar.getInstance();
		
		for(MemoDto dto : list) {
//			String regdate = dto.getRegdate().substring(0,10);
//			dto.setRegdate(regdate);
			
			//오늘 메모 or 어제 이전 메모
			// - 작성날짜가 오늘인지? 아닌지?
			if(dto.getRegdate().startsWith(String.format("%tF", now))) {
				//오늘
				String regdate = dto.getRegdate().substring(11);
				dto.setRegdate(regdate);
			}else {
				//어제이전
				String regdate = dto.getRegdate().substring(0,10);
				dto.setRegdate(regdate);
			}
			
			//개행문자 처리
			dto.setMemo(dto.getMemo().replace("\r\n", "<br>"));
			
		}
		
		return list;
	}

	public List<CategoryDto> clist() {
		
		
		return dao.clist();
	}

	public int add(MemoDto mdto) {
		// TODO Auto-generated method stub
		return dao.add(mdto);
	}

	public MemoDto getMemo(String seq) {
		// TODO Auto-generated method stub
		return dao.getMemo(seq);
	}

	public int edit(MemoDto dto) {
		// TODO Auto-generated method stub
		return dao.edit(dto);
	}

	public int del(String seq) {
		// TODO Auto-generated method stub
		return dao.del(seq);
	}
}
