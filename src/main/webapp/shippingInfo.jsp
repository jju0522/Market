<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="c##market"
	password="c##market" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>
<title>배송 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>

	
	<c:forEach var="row" items="${resultSet.rows}">
		<c:set var="phone" value="${row.phone }" />
		<c:set var="phone1" value="${phone.split('-')[0]}" />
		<c:set var="phone2" value="${phone.split('-')[1]}" />
		<c:set var="phone3" value="${phone.split('-')[2]}" />

		<div class="container">
			<form  name="shippingForm" action="./processShippingInfo.jsp" class="form-horizontal"
				method="post">
				<input type="hidden" name="cartId"
					value="<%=request.getParameter("cartId")%>" />
				<div class="form-group row">
	 				<label class="col-sm-2">주문일자</label>
	 				<div class="col-sm-3">
	 					<input name="shippingDate" type="text" class="form-control" id="shippingDate" readonly />(yyyy/mm/dd)
	 				</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-5">
						<input name="name" type="text" class="form-control"
							style="width: 100%;" placeholder="이름"
							value="<c:out value='${row.name }'/>">
					</div>
				</div>
<!-- 			<div class="form-group row">
					<label class="col-sm-2">국가명</label>
					<div class="col-sm-3">
						<input name="country" type="text" class="form-control" />
					</div>
				</div> -->
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">휴대전화</label>
					<div class="col-sm-5">
						<select name="phone1" style="width: 30%;">
							<option value="010" ${phone1 eq '010' ? 'selected' : ''}>010</option>
							<option value="011" ${phone1 eq '011' ? 'selected' : ''}>011</option>
							<option value="016" ${phone1 eq '016' ? 'selected' : ''}>016</option>
							<option value="017" ${phone1 eq '017' ? 'selected' : ''}>017</option>
							<option value="018" ${phone1 eq '018' ? 'selected' : ''}>018</option>
							<option value="019" ${phone1 eq '019' ? 'selected' : ''}>019</option>
						</select> - <input type="text" name="phone2" maxlength="4" size="4"
							value="${phone2}"> - <input type="text" name="phone3"
							maxlength="4" size="4" value="${phone3}">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-5 d-flex">
						<input name="zipCode" type="text" class="form-control mr-1"
							style="width: 30%;" placeholder="우편번호"> 
						<input
							name="addressName" type="text" class="form-control"
							style="width: 70%;" placeholder="주소">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-form-label">배송요청사항</label>
					<div class="col-sm-5">
						<textarea rows="2" name="deliveryNotes" style="width: 100%;"
							class="form-control" placeholder="배송요청사항을 입력해주세요."></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">결제수단</label>
					<div class="col-sm-5">
						<select name="paymentMethod" class="form-control">
							<option value="신용카드">신용카드</option>
							<option value="무통장">무통장</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>"
							class="btn btn-secondary" role="button"> 이전</a> 
							<input type="button" class="btn btn-primary" 
                                onclick="if(validateForm()) document.shippingForm.submit();" value="등록" /> 
							<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소</a>
					</div>
				</div>
			</form>
		</div>
	</c:forEach>
	<script>
		// 현재 날짜를 가져오는 함수
		function getCurrentDate() {
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var day = today.getDate();
			if (month < 10) {
				month = '0' + month;
			}
			if (day < 10) {
				day = '0' + day;
			}
			return year + '-' + month + '-' + day;
		}

		// 현재 날짜를 shippingDate input 필드에 입력하는 코드
		document.getElementById("shippingDate").value = getCurrentDate();

		// 주문 확인 함수
        function confirmOrder() {
            var zipCode = document.forms["shippingForm"]["zipCode"].value;
            var addressName = document.forms["shippingForm"]["addressName"].value;

            if (zipCode == "") {
                alert("우편번호를 입력해주세요.");
                document.forms["shippingForm"]["zipCode"].focus();
                return false;
            }

            if (addressName == "") {
                alert("주소를 입력해주세요.");
                document.forms["shippingForm"]["addressName"].focus();
                return false;
            }
            
//             if (zipCode != "" && addressName != "") {
//                 var confirmation = confirm("주문 하시겠습니까?");
//                 if (confirmation) {
//                     document.shippingForm.submit();
//                 }
//             }

            return true;
        }
    </script>
</body>
</html>