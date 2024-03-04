<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
// 	String name = request.getParameter("name");

%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" 
	user="c##market" password="c##market" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT name FROM MEMBER WHERE ID=? and password=?
   <sql:param value="<%=id%>" />
    <sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
<c:set var="name" value="${row['name'] }">
	
</c:set>
	<%
		String name=(String)pageContext.getAttribute("name");
	
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionName", name);
	%>
	<c:redirect url="../products.jsp" />
</c:forEach>

<c:redirect url="loginMember.jsp?error=1" />
