<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dto.Product"%>
<%-- <%@ page import="com.dao.ProductRepository"%> --%>
<%@ include file="dbconn.jsp"%>

<%
	String id = request.getParameter("id");
	
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}

// 	ProductRepository dao = ProductRepository.getInstance();

	Product product = null;	// DB연결
	
// 	Product product = dao.getProductById(id);

	try {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    
        // 아래 코드에서 product를 초기화해야 함
        product = new Product();
    
        String sql = "select * from product where p_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            product.setProductId(rs.getString("p_id"));
            product.setPname(rs.getString("p_name"));
            product.setUnitPrice(rs.getInt("p_unitprice"));
            product.setDescription(rs.getString("p_description"));
            product.setUnitsInStock(rs.getLong("p_unitsInStock"));
            product.setCondition(rs.getString("p_condition"));
            product.setFilename(rs.getString("p_filename"));
        } else {
            response.sendRedirect("exceptionNoProductId.jsp");
            return;
        }
    } catch (SQLException e) {
        // SQL 예외 처리
        e.printStackTrace();
    } finally {
        // 연결, 문장 및 결과 집합 닫기
    }

	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
