function addCheck(){
	
	/* 아이디가 입력되지 않았을때 오류메세지 출력하자. */
	
	/*폼(frm)의 있는 id의 값의 길이가 0이면*/
	if(frm.id.value.length == 0){
		alert("교과목 코드가 입력되지 않았습니다.");
		frm.id.focus();
		return false;
	}else if(frm.name.value.length == 0){
		alert("과목명이 입력되지 않았습니다.");
		frm.name.focus();
		return false;
	}else if(frm.credit.value.length == 0){
		alert("학점이 입력되지 않았습니다.");
		frm.credit.focus();
		return false;
	}else if(frm.lecturer.value == 0){
		alert("담당강사가 선택되지 않았습니다.");
		frm.lecturer.focus();
		return false;
	}else if(frm.week[0].checked==false && frm.week[1].checked==false && frm.week[2].checked==false && frm.week[3].checked==false && frm.week[4].checked==false){ //요일이 체크가 안됬으면
		alert("요일 선택되지 않았습니다.");
		frm.week.focus();
		return false;
	}else if(frm.start_hour.value.length == 0){
		alert("시작시간이 입력되지 않았습니다.");
		frm.start_hour.focus();
		return false;
	}else if(frm.end_hour.value.length == 0){
		alert("종료시간이 입력되지 않았습니다.");
		frm.end_hour.focus();
		return false;
	}else{
		//모든 항목을 다 입력 했을때 
		alert("교과목 등록이 완료되었습니다!");
		
		document.frm.submit();
		return true;
	}

}

function search(){
	window.location="list.jsp";
}

function modify(){
	alert("수정이 완료되었습니다.");
	document.frm.submit();
}

function res(){
	alert("취소되었습니다.");
	document.frm.reset();
}