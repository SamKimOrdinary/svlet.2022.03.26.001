<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	final String driver = "oracle.jdbc.driver.OracleDriver";
	final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	final String user = "student";
	final String pwd = "1234";

	Connection conn;
	Statement stmt;
	ResultSet rs;
	try {
		Class.forName(driver);
		System.out.println("Oracle 드라이버 로딩 성공");

		conn = DriverManager.getConnection(url, user, pwd);
		System.out.println("Connection 생성 성공");

		stmt = conn.createStatement();
		System.out.println("Statement 생성 성공");

		String query = "INSERT INTO member VALUES ( '유돌이' , '165', '45' , 18 , '여' )";
		System.out.println(query);
		stmt.executeUpdate(query);

		String query2 = "SELECT * FROM member";
		System.out.println(query2);
		rs = stmt.executeQuery(query2);
		while (rs.next()) {
			System.out.print("이름 >" + rs.getString("name"));
			System.out.print(" 키 >" + rs.getString("height"));
			System.out.print(" 체중 >" + rs.getString("weight"));
			System.out.print(" 나이 >" + rs.getInt("age"));
			System.out.println(" 성별 >" + rs.getString("sex"));
		}

		rs.close();
		stmt.close();
		conn.close();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html language="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<hr>
	<h1>JDBC 날것 테스트</h1>
</body>
</html>