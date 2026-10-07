package com.test.memo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.memo.model.CategoryDto;
import com.test.memo.model.MemoDto;
import com.test.memo.service.MemoService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemoController {
	private final MemoService service;

	@GetMapping("/")
	public String index(Model model) {

		// 목록보기
		// 1. db조회 > select
		// 2. service에게 위임 > dao한테 위임
		// 3. 결과 반환
		// 4. jsp 호출하기

		// 1. + 2.
		List<MemoDto> list = service.list();

		// 3.
		model.addAttribute("list", list);

		return "index";
	}

	@GetMapping("/add.do")
	public String add(Model model) {

		// 쓰기
		// 1. db조회 > select
		// 2. service에게 위임 > dao한테 위임
		// 3. 결과 반환
		// 4. jsp 호출하기

		List<CategoryDto> clist = service.clist();

		model.addAttribute("clist", clist);

		return "add";
	}

	@PostMapping("/addok.do")
	public String addok(Model model, MemoDto mdto) {

		// 쓰기처리
		// 1. 데이터 가져오기
		// 2. db처리 > insert
		// 3. 매무리

		int result = service.add(mdto);

		model.addAttribute("result", result);

		return "addok";
//		if(result ==1) {
//			return "redirect:/";
//		} else {
//			return "redirect:/add.do";
//		}
	}

	@GetMapping("/edit.do")
	public String edit(Model model, @RequestParam("seq") String seq) {

		//수정하기
		//1. 카테고리 select
		//2. 데이터 가져오기(seq)
		//3. db 조회 > select
		//4. 결과 반환
		//5. jsp호출 + 결과 전달
		
		List<CategoryDto> clist = service.clist();
		
		MemoDto mdto = service.getMemo(seq);

		model.addAttribute("clist", clist);
		model.addAttribute("mdto",mdto);
		
		return "edit";
	}

	@PostMapping("/editok.do")
	public String editok(Model model, MemoDto dto) {
		//수정 처리하기
		// 1. 데이터 가져오기
		// 2. DB 수정 > UPDATE
		// 3. 마무리
		
		int result = service.edit(dto);
		
		model.addAttribute("result",result);
		model.addAttribute("seq",dto.getSeq());
		
		return "editok";
	}

	@GetMapping("/del.do")
	public String del(Model model, @RequestParam("seq") String seq) {
		
		//메모 삭제하기
		//1. 데이터가져오기(seq)
		//2. jsp호출 + 번호전달
		
		model.addAttribute("seq",seq);
		
		return "del";
	}

	@PostMapping("/delok.do")
	public String delok(Model model, @RequestParam("seq") String seq) {
		//메모 삭제처리하기
		//1. 데이터가져오기(seq)
		//2. db삭제 > delete
		//3. 매무리
		
		int result = service.del(seq);
		
		model.addAttribute("result",result);
		model.addAttribute("seq",seq);
		return "delok";
	}

	@GetMapping("/template.do")
	public String template(Model model) {

		return "template";
	}

}
