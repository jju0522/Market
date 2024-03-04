<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%-- <%@ page import="java.util.ArrayList" %> --%>
<%-- <%@ page import="com.dto.Product" %> --%>
<%-- <%@ page import="com.dao.ProductRepository" %> --%>
<%-- <jsp:useBean id="productDAO" class="com.dao.ProductRepository" scope="session" /> --%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>

	<%-- <%
        ProductRepository dao = ProductRepository.getInstance();
        ArrayList<Product> listOfProducts = dao.getAllProducts();
    %> --%>

	<div class="container">
		<div class="row" align="center">

			<%-- <%
                for(int i = 0; i < listOfProducts.size(); i++){
                    Product product = listOfProducts.get(i);
            %> --%>

			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM product ORDER BY p_id ASC";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>

			<div class="col-md-4">
			<a href="./product.jsp?id=<%=rs.getString("p_id")%>">
				<img src="./upload2/<%=rs.getString("p_fileName")%>"
					style="width: 100%"> </a>
				<h3>
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>"> <%=rs.getString("p_name")%></a>
				</h3>
				<p><%=rs.getString("p_unitPrice")%>원
				</p>
			</div>
			<%
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
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
