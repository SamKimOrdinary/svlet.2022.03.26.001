
<%@page import="jdbc.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//DAO 객체 생성
	MemberDao memberDao = new MemberDao();

	//Get Connection
	memberDao.getConnection();
%>
<!DOCTYPE html>
<html language="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<hr>
	<h1>JDBC DAO 테스트 1</h1>
	<%
		// Insert Data
		int nRet = memberDao.setData("김첨지", 180, 79, 19, "남");
		out.println(nRet + "건의 Transaction이 발생했습니다.<br>");
		nRet = memberDao.setData("이첨지", 180, 79, 19, "남");
		out.println(nRet + "건의 Transaction이 발생했습니다.");
		memberDao.getData();
	%>
</body>
</html>
<%
	//Close Connection
	memberDao.closeConnection();
%>
