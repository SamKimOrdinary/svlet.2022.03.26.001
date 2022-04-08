<%@page import="jdbc.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); //요청 관련 인코딩 처리
	response.setContentType("text/html;charset=utf-8"); //응답 관련 인코딩 처리

	String name = request.getParameter("name");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	String age = request.getParameter("age");
	String sex = request.getParameter("sex");

	// DAO 객체 생성
	MemberDao memberDao = new MemberDao();

	// Get Connection
	memberDao.getConnection();

	// Insert Data
	int nHeight = Integer.parseInt(height);
	int nWeight = Integer.parseInt(weight);
	int nAge = Integer.parseInt(age);

	int nRet = memberDao.setData(name, nHeight, nWeight, nAge, sex);
	System.out.println(nRet + "건의 Transaction이 발생했습니다.");
%>
<!DOCTYPE html>
<html language="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<hr>
	<h1>4.1.insert.jsp</h1>
	<%=name%>님의 신상정보가
	<%=nRet%>건 입력되었습니다.

	<br>
	<br>
	<a href="3.daoEx2.jsp">전체보기</a>
</body>
</html>
<%
	// Close Connection
	memberDao.closeConnection();
%>