<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
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
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body onload="init()">
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정</h1>
		</div>
	</div>

	<c:forEach var="row" items="${resultSet.rows}">
		<c:set var="mail" value="${row.mail}" />
		<c:set var="mail1" value="${mail.split('@')[0]}" />
		<c:set var="mail2" value="${mail.split('@')[1]}" />

		<c:set var="phone" value="${row.phone }" />
		<c:set var="phone1" value="${phone.split('-')[0]}" />
		<c:set var="phone2" value="${phone.split('-')[1]}" />
		<c:set var="phone3" value="${phone.split('-')[2]}" />

		<div class="container">
			<form name="newMember" class="form-horizontal"
				action="processUpdateMember.jsp" method="post"
				onsubmit="return checkForm()">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3 input-group">
						<input name="id" type="text" class="form-control" placeholder="id"
							value="<c:out value='${row.id }'/>">
						<div class="input-group-append">
							&nbsp
							<button type="button" class="btn btn-secondary">중복확인</button>
						</div>
					</div>
				</div>

				<div class="form-group  row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input name="password" type="text" class="form-control"
							placeholder="password" value="<c:out value='${row.password }'/>">
					</div>
				</div>
				<div class="form-group  row">
					<label class="col-sm-2">비밀번호확인</label>
					<div class="col-sm-3">
						<input name="password_confirm" type="text" class="form-control"
							placeholder="password_confirm">
					</div>
				</div>
				<div class="form-group  row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input name="name" type="text" class="form-control"
							placeholder="name" value="<c:out value='${row.name }'/>">
					</div>
				</div>
				<div class="form-group  row">
					<label class="col-sm-2">닉네임</label>
					<div class="col-sm-3">
						<input name="nickname" type="text" class="form-control"
							placeholder="nickname" value="<c:out value='${row.nickname }'/>">
					</div>
				</div>
				<div class="form-group  row ">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<input type="text" name="mail1" maxlength="50" value="${mail1}">@
						<select name="mail2" id="mail2">
							<option value="naver.com"
								${mail2 eq 'naver.com' ? 'selected' : ''}>naver.com</option>
							<option value="daum.net" ${mail2 eq 'daum.net' ? 'selected' : ''}>daum.net</option>
							<option value="gmail.com"
								${mail2 eq 'gmail.com' ? 'selected' : ''}>gmail.com</option>
							<option value="nate.com" ${mail2 eq 'nate.com' ? 'selected' : ''}>nate.com</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">휴대전화</label>
					<div class="col-sm-5">
						<select name="phone1">
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
				<div class="form-group  row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-primary" value="회원수정">
						<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
					</div>
				</div>
			</form>
		</div>
	</c:forEach>
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboPhoneValue("${phone2}");
		setComboPhoneValue("${phone3}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true;
				break;
			}
		}
	}
	function setComboPhoneValue(val, phoneFieldId) {
		var selectPhone = document.getElementById(phoneFieldId);
		for (i = 0, j = selectPhone.length; i < j; i++) {
			if (selectPhone.options[i].value == val) {
				selectPhone.options[i].selected = true;
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>