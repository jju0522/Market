<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>

<%
	String producId = request.getParameter("id");
	
	String sql = "SELECT * FROM product";
	PreparedStatement pstmt = null;
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = null;
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		sql = "DELETE FROM product WHERE p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, producId);
		pstmt.executeUpdate();
	} else{
		out.println("일치하는 상품이 없습니다.");
	}
	
	if (rs != null) {
	rs.close();
	}
	if (pstmt != null) {
	pstmt.close();
	}
	if (conn != null) {
	conn.close();
	}
	
	response.sendRedirect("editProduct.jsp?edit=delete");
%>
</body>
</html>