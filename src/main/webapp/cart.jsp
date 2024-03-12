<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dto.Product"%>
<%@ page import="com.dao.ProductRepository"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
    // 로그인 여부 확인
    String sessionId = (String) session.getAttribute("sessionId");
    if (sessionId == null) {
        // 로그인되지 않은 상태라면 로그인 페이지로 리디렉션
        response.sendRedirect("./member/loginMember.jsp");
        return; // 리디렉션 후에는 더 이상 코드가 실행되지 않도록 return을 추가합니다.
    }

    String cartId = session.getId();
%>
<script>
	function confirmDelete() {
	    // 사용자에게 확인 대화상자 표시
	    var confirmation = confirm("장바구니를 비우시겠습니까?");
	    
	    // 사용자가 확인을 눌렀을 때만 삭제 작업 수행
	    if (confirmation) {
	        // JavaScript를 사용하여 삭제 작업 수행 후 페이지 이동
	        window.location.href = "./deleteCart.jsp?cartId=<%=cartId%>";
	    } else {
	        // 사용자가 취소를 눌렀을 때는 아무 작업도 수행하지 않음
	        return;
	    }
	}
</script>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="#" class="btn btn-danger" onclick="confirmDelete()">전체삭제</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%				
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Product>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=product.getProductId()%> - <%=product.getPname()%></td>
					<td><%=product.getUnitPrice()%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
