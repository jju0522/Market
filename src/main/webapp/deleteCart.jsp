<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.dto.Product"%>
<%@ page import="com.dao.ProductRepository"%>

<%
	String id = request.getParameter("cartId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}

	// 세션에 저장된 모든 데이터를 삭제
// 	session.invalidate();
	
	// 세션에서 장바구니 정보를 삭제
    session.removeAttribute("cartlist");
	
	response.sendRedirect("cart.jsp");
%>
