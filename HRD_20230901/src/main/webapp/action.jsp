<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");
String mode =request.getParameter("mode");


String id = request.getParameter("id");
String name = request.getParameter("name");
String credit = request.getParameter("credit");
String lecturer = request.getParameter("lecturer");
String week = request.getParameter("week");
String start_hour = request.getParameter("start_hour");
String end_hour = request.getParameter("end_hour");

try{
	
	Connection conn = Util.getConnection();
	// insert, update, delete 총 세개의 sql이 필요하다.
	// 나눠주기위해 여기선 변수 설정만하고 조건문으로 세개 나눠준다.
	String sql=""; 
	PreparedStatement pstmt = null;
	
	switch(mode){
	
	case "insert" : 
		sql="insert into course_tbl values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,name);
		pstmt.setString(3,credit);
		pstmt.setString(4,lecturer);
		pstmt.setString(5,week);
		pstmt.setString(6,start_hour);
		pstmt.setString(7,end_hour);
		
		pstmt.executeUpdate();
		%>
		
		<jsp:forward page="insert.jsp"></jsp:forward>
		<%
		break;
		
	case "modify" :
		sql="update course_tbl set name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,credit);
		pstmt.setString(3,lecturer);
		pstmt.setString(4,week);
		pstmt.setString(5,start_hour);
		pstmt.setString(6,end_hour);
		pstmt.setString(7,id);
		pstmt.executeUpdate();
		%>
		
		<jsp:forward page="modify.jsp"></jsp:forward>
		<%
		
		break;
		
	case "delete" :
		sql="delete from course_tbl where id=?";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="list.jsp"></jsp:forward>
		<%
		break;
	
	}
	
	
	
	
	
	
}catch(Exception e){
	e.printStackTrace();
}

%>