<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="com.dto.Product"%>
<%@ page import="com.dao.ProductRepository"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<jsp:useBean id="productDAO" class="com.dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type="text/javascript">

	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			response.sendRedirect("./member/loginMember.jsp");
			return false;
		}
	}
	
	function addToCart() {
	    if (confirm("장바구니에 추가하시겠습니까?")) {
	        if (${sessionId==null}) {
	        	alert("로그인 해주세요.");
	            window.location.href = "./member/loginMember.jsp";
	            return false;
	        } else {
	            // 여기에 상품을 장바구니에 추가하는 코드를 넣으세요
	            // 추가된 후 메세지를 띄워주세요
	            document.addForm.submit();
	            alert("장바구니에 추가되었습니다.");
	        }
	    } else {
	        // 사용자가 확인을 취소한 경우
	        document.addForm.reset();
	    }
	}

	function deleteProduct(productName, productId) {
		if (confirm('< ' + productName + ' > 상품을 삭제하시겠습니까?')) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE) {
					if (xhr.status == 200) {
						alert("삭제하였습니다.");
						window.location.href = "./products.jsp";
					} else {
						alert("삭제에 실패하였습니다.");
					}
				}
			};
			xhr.open("GET", "<c:url value='/deleteProduct.jsp'/>?id="
					+ productId, true);
			xhr.send();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>

	<%
		String id = request.getParameter("id"); // 요청 파라미터 id=P~
		//         ProductRepository dao = ProductRepository.getInstance();
		//         Product product = dao.getProductById(id);
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM product WHERE p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload2/<%=rs.getString("p_fileName")%>"
					style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%></p>
				<p>
					<b>상품 코드 : </b><span class="badge badge-danger"><%=rs.getString("p_id")%></span>
				</p>
				<p>
					<b>재고 수</b> :
					<%=rs.getLong("p_unitsInStock")%></p>
				<p><%=rs.getInt("p_unitPrice")%>원
				</p>
				<p>
				<h4>
					<span class="badge badge-primary"><%=rs.getString("p_condition")%></span>
				</h4>
				<c:choose>
					<c:when test="${sessionId eq 'admin'}">
						<!-- id가 "admin"인 경우 -->
						<a
							href="<c:url value='/updateProduct.jsp'/>?id=<%=rs.getString("p_id")%>"
							class="btn btn-success">상품수정 &raquo;</a>
						<a href="#"
							onclick="deleteProduct('<%=rs.getString("p_name")%>', '<%=rs.getString("p_id")%>')"
							class="btn btn-danger"> 상품삭제 &raquo;</a>
						<a href="./products.jsp" class="btn btn-secondary">상품목록&raquo;</a>
					</c:when>

					<c:otherwise>
						<!-- 관리자가 아닌 경우 -->
						<form name="addForm"
							action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
							<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a> 
							<a href="./cart.jsp" class="btn btn-warning" onclick="checkForm()">장바구니&raquo;</a>
							<a href="./products.jsp" class="btn btn-secondary">상품목록
								&raquo;</a>
						</form>
					</c:otherwise>
				</c:choose>

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
