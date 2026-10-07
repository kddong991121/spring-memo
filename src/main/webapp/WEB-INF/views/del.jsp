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
	<!-- template.jsp -->

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<div>
		<h2>del</h2>
		<form method="POST" action="/memo/delok.do">
			<div>
				<button type="submit">삭제</button>
				<button type="button" onclick="location.href='/memo'">돌아가기</button>
			</div>
			<input type="hidden" name="seq" value="${seq}">
			
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





