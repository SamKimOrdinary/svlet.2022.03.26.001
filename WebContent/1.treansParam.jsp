<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 	Context ctx = new InitialContext();
// 	DataSource dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/test");

// 	System.out.println("dataFactory:" + dataFactory.toString());
%>
<!DOCTYPE html>
<html language="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- =========================================================== -->
	<hr>
	<h1 style="color:red">Parameter를 서블릿으로 보낸다.</h1>
	<hr>
	<h2>Method Get</h2>
	<form method="get" action="/svlet.2022.03.26.001/Transfer">
		name : <input name="name"> 
		<input type="submit">
	</form>
	<hr>	
	<h2>Method POST</h2>
	<form method="post" action="/svlet.2022.03.26.001/Transfer">
		name : <input name="name"> 
		<input type="submit">
	</form>
	
	<!-- =========================================================== -->
	<hr>
	<h1 style="color:red">Parameter를 JSP로 보낸다.</h1>
	<hr>
	<h2>Method Get</h2>
	<form method="get" action="/svlet.2022.03.26.001/trans/get.jsp">
		name : <input name="name"> 
		<input type="submit">
	</form>
	<hr>
	<h2>Method POST</h2>
	<form method="post" action="/svlet.2022.03.26.001/trans/post.jsp">
		name : <input name="name"> 
		<input type="submit">
	</form>
	
</body>
</html>