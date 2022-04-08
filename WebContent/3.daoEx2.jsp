
<%@page import="jdbc.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="jdbc.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// DAO 객체 생성
	MemberDao memberDao = new MemberDao();

	// Get Connection
	memberDao.getConnection();

	// Insert Data
	int nRet = memberDao.setData("김첨지", 180, 79, 19, "남");
	System.out.println(nRet + "건의 Transaction이 발생했습니다.");

	nRet = memberDao.setData("이첨지", 180, 79, 19, "남");
	System.out.println(nRet + "건의 Transaction이 발생했습니다.");

	MemberDto sndDto = new MemberDto();
	sndDto.setName("너구리");
	sndDto.setHeight(170);
	sndDto.setWeight(100);
	sndDto.setAge(55);
	sndDto.setSex("여");
	nRet = memberDao.setData(sndDto);
	System.out.println(nRet + "건의 Transaction이 발생했습니다.");

	// Read Data
	memberDao.getData();
%>
<!DOCTYPE html>
<html language="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<hr>
	<h1>JDBC DAO 테스트 2</h1>
	<%
		List list = memberDao.getListData();
		for (int i = 0; i < list.size(); i++) {
			//System.out.println(list.get(i));
			//out.println(list.get(i));
	%>
	<%=list.get(i)%><br>
	<%
		}
	%>
</body>
</html>
<%
	//Close Connection
	memberDao.closeConnection();
%>
