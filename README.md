# practice2
### 수강신청 도우미 사이트






📌과목정보 테이블 생성

    Create table course_tbl(
        id varchar2(5) not null,
        name varchar2(40),
        credit number(6),
        lecturer varchar2(10),
        week number(2),
        start_hour number(4),
        end_hour number(4),
        primary key(id)
    );

📌강사정보 테이블 생성

    Create table lecturer_tbl(

        idx number(6) not null,
        name varchar2(10),
        major varchar2(40),
        primary key(idx)

    );
    

📌과목정보 데이터 저장


        insert into course_tbl values('10001','애플리케이션 배포',2,'1',1,0900,1100);
        insert into course_tbl values('10002','프로그래밍 언어 활용',2,'2',2,0900,1200);
        insert into course_tbl values('10003','응용SW기초기술 활용',3,'6',3,0900,1200);
        insert into course_tbl values('10004','화면구현',3,'4',4,0900,1200);
        insert into course_tbl values('20001','애플리케이션 테스트 수행',2,'5',1,1300,1600);
        insert into course_tbl values('20002','SQL 활용',3,'5',2,1500,1800);
        insert into course_tbl values('20003','UI 테스트',3,'6',3,1330,1630);
        insert into course_tbl values('30001','화면 설계',2,'3',4,1330,1530);
        insert into course_tbl values('30002','네트워크 프로그래밍 구현',3,'3',5,0900,1200);
        insert into course_tbl values('40001','스마트문화앱구현',3,'2',5,1300,1600);


    
📌강사정보 데이터 저장 
        
        insert into lecturer_tbl values(1,'김교수','소프트웨어공학');
        insert into lecturer_tbl values(2,'이교수','프로그래밍');
        insert into lecturer_tbl values(3,'박교수','네트워크');
        insert into lecturer_tbl values(4,'우교수','운영체제');
        insert into lecturer_tbl values(5,'최교수','자료구조');
        insert into lecturer_tbl values(6,'임교수','인공지능');


        commit;
      

📌테이블 조회

        SELECT * FROM course_tbl;
        SELECT * FROM lecturer_tbl;

        -- 테이블 삭제
        DROP TABLE COURSE_TBL;
        DROP TABLE LECTURER_TBL;
