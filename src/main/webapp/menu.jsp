<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionName = (String) session.getAttribute("sessionName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			response.sendRedirect("./member/loginMember.jsp");
			return false;
		}
	}
</script>
</head>
<body>
    <nav class="navbar navbar-expand navbar-dark bg-dark">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/Market/products.jsp">Home</a>
            </div>
            <div>
            	<ul class="navbar-nav mr-auto">
            		<li class="nav-item"><a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a></li>
            		<li class="nav-item"><a class="nav-link" href="<c:url value="/cart.jsp" />" onclick="checkForm()">장바구니</a></li>
            		<%-- "admin"인 경우에만 표시되는 메뉴들 --%>
            		<% if ("admin".equals(sessionId)) { %>
            			<li class="nav-item"><a class="nav-link" href="<c:url value="/addProduct.jsp"/>">상품등록</a></li>
            		<% } %>
            		<c:choose>
            			<c:when test="${empty sessionId }">
							<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp" />">로그인</a></li>
            			</c:when>
            			<c:otherwise>
            				<li class="nav-item"><a class="nav-link" href="<c:url value="/member/updateMember.jsp" />" style="padding-top: 7px; color:white; text-decoration: underline;">[<%= sessionName %>님]</a></li>
            				<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp" />">로그아웃</a></li>
            			</c:otherwise>
            		</c:choose>
            	</ul>
            </div>
        </div>
    </nav>
</body>
</html>
