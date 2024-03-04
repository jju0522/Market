<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="mvc.model.MemberDto"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List<MemberDto> list = (List<MemberDto>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>관리자</title>
<script type="text/javascript">
	function deleteMember(id) {
	}
</script>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">관리자</h1>
		</div>
	</div>
	<div class="container">
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<!-- 					<th>No.</th> -->
					<th>ID</th>
					<th>Name</th>
					<th>닉네임</th>
					<th>가입일자</th>
					<th>정보조회</th>
					<th>회원삭제</th>
				</tr>
				<%
				if (list != null && !list.isEmpty()) {
					for (MemberDto dto : list) {
				%>
				<tr>
					<td><%=dto.getId()%></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getNickname()%></td>
					<td><%=dto.getRegist_day()%></td>
					<td><button onclick="viewMember(<%=dto.getId()%>);">조회</button></td>
					<td><button class="btn btn-danger py-0" onclick="deleteUser(<%=dto.getId()%>);">삭제하기</button></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="5">회원 목록이 없습니다.</td>
				</tr>
				<%
				}
				%>

			</table>
		</div>
		<hr>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>