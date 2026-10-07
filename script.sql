create table tblCategory(
    seq number primary key,
    category varchar2(100) not null,
    color char(7) not null
);

create table tblMemo(
    seq number primary key,
    memo varchar2(2000) not null,
    regdate date default sysdate not null,
    cseq number not null references tblCategory(seq)
);

create sequence seqMemo;

insert into tblCategory values(1,'운동','#6495ed');
insert into tblCategory values(2,'여행','#7fffd4');
insert into tblCategory values(3,'코딩','#8fbc8f');
insert into tblCategory values(4,'휴식','#ffd700');
insert into tblCategory values(5,'학업','#ffc0cb');

insert into tblMemo values(seqMemo.nextVal, '메모장1',sysdate-5.1, 1);
insert into tblMemo values(seqMemo.nextVal, '메모장2',sysdate-4.2, 2);
insert into tblMemo values(seqMemo.nextVal, '메모장3',sysdate-3.3, 5);
insert into tblMemo values(seqMemo.nextVal, '메모장4',sysdate-2.4, 1);
insert into tblMemo values(seqMemo.nextVal, '메모장5',sysdate-1.5, 4);
insert into tblMemo values(seqMemo.nextVal, '메모장6',sysdate,3 );

insert into tblMemo values(seqMemo.nextVal, '메모장7',sysdate,3 );

		select
            m.seq,
            m.memo,
            m.regdate,
            c.category,
            c.color
		from tblMemo m
        inner join tblcategory c
            on m.cseq = c.seq
		order by m.seq
		desc;

commit;
