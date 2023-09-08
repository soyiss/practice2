<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<section style="position:fixed; top:70px; left:0px; height:100%; width:100%; background-color: lightgray;">
<h2 style="text-align:center">수강신청 관리 프로그램</h2>

<form action="action.jsp" method="post" style="display:flex; align-items:center; justify-content: center; text-align:center">
<table border="1">
<tr>
	<td>과목코드</td>
	<td>과목명</td>
	<td>학점</td>
	<td>담당강사</td>
	<td>요일</td>
	<td>시작시간</td>
	<td>종료시간</td>
	<td>삭제</td>
	
</tr>
<%

request.setCharacterEncoding("UTF-8");
try{
	Connection conn = Util.getConnection();
	String sql = "SELECT co.id, co.name cname, co.credit, le.name lname, co.week, co.start_hour, co.end_hour FROM course_tbl co, lecturer_tbl le WHERE co.lecturer = le.idx ORDER BY co.id";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
		

		String week = rs.getString(5);
		switch (week) {
		    case "1":
		        week = "월요일";
		        break;
		    case "2":
		        week = "화요일";
		        break;
		    case "3":
		        week = "수요일";
		        break;
		    case "4":
		        week = "목요일";
		        break;
		    case "5":
		        week = "금요일";
		        break;
		}

		String start_hour = rs.getString(6);
		while(start_hour.length()<4){
			start_hour = "0"+start_hour;
		}
		String start = start_hour.substring(0,2)+ "시"+start_hour.substring(2,4)+"분";
		
		String end_hour = rs.getString(7);
		while(end_hour.length()<4){
			end_hour = "0"+end_hour;
		}
		String end = end_hour.substring(0,2)+ "시"+end_hour.substring(2,4)+"분";
		
		
%>

		<tr>
		<td><a href="modify.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=week %></td>
		<td><%=start %></td>
		<td><%=end %></td>
		<td><a href="action.jsp?id=<%=rs.getString(1) %>&mode=delete">삭제</a></td>
		
	</tr>
	
	
	
<%
		
		
	}
	
}catch(Exception e){
	e.printStackTrace();
}



%>



</table>
</form>


</section>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>