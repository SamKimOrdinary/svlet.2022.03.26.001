<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Context ctx = new InitialContext();
	DataSource dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/test");

	System.out.println("dataFactory:" + dataFactory.toString());
%>
<!DOCTYPE html>
<html language="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello World</h1>
</body>
</html>