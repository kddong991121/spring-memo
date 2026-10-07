package com.test.memo.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemoDto {
	private String seq;
	private String memo;
	private String regdate;
	private String cseq;
	
	private String category;
	private String color;
}
