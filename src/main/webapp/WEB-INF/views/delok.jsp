<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
<style>
</style>
</head>
<body>
	<!-- delok.jsp -->

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<div>
		<h2>del</h2>
	</div>

	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		<c:if test="${result ==1 }">
			alert('메모 삭제 성공!');
			location.href = '/memo';
		</c:if>
		<c:if test="${result ==0 }">
			alert('메모 삭제 실패!');
			location.href = '/memo/del.do?seq=${seq}';
		</c:if>
	</script>
</body>
</html>





