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
		<h2>Edit</h2>
		<form method="POST" action="/memo/editok.do">
			<table class="vertical content">
				<tr>
					<th>메모</th>
					<td><textarea name="memo" class="full" required>${mdto.memo}</textarea></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="cseq">
							<c:forEach items="${clist }" var="cdto">
							<option value="${cdto.seq }" 
							<c:if test="${mdto.cseq == cdto.seq}">selected</c:if>
							>${cdto.category }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">수정하기</button>
				<button type="button" onclick="location.href='/memo'">돌아가기</button>
			</div>
			<input type="hidden" name="seq" value="${mdto.seq}">
			
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





