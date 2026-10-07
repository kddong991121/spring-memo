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
.list {
	display: flex;
	flex-wrap: wrap;
}

.item {
	border: 1px solid gray;
	width: 240px;
	margin: 7px;
	height: 250px;
	position: relative;
}

.item .memo {
	margin-top: 30px;
	margin-left: 10px;
	margin-right: 10px;
	height: 190px;
	overflow: auto;
}

.item .info {
	position: absolute;
	right: 3px;
	bottom: 0px;
}

.item .info span:first-child {
	font-size: 14px;
}

.item .info span:last-child {
	font-size: 12px;
	color: #7777777;
}

.item .btns {
	position: absolute;
	right: 5px;
	top: 8px;
}

.item .btns span {
	cursor: pointer;
}

#btnAdd{
	font-size: .8rem;
	padding: 10px;
	height: 18px;
}

body > div > h2{
	display: flex;
	justify-content: space-between;
}
.item .category{
	position: absolute;
	left: 5px;
	top: 5px;
}
</style>
</head>
<body>
	<!-- template.jsp -->

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<div>

		<h2>

			<span> List </span>
			<button type="button" id="btnAdd" onclick="location.href='/memo/add.do';">쓰기</button>

		</h2>

		<div class="list">
			<c:forEach items="${list}" var="mdto">
				<div class="item" style="outline: 5px solid ${mdto.color}">
					<div class="category">${mdto.category }</div>
					<div class="memo">${mdto.memo }</div>
					<div class="info">
						<span>홍길동</span> <span>(${mdto.regdate })</span>
					</div>
					<div class="btns">
						<span><a href="/memo/edit.do?seq=${mdto.seq}">✒️</a></span> 
						<span><a href="/memo/del.do?seq=${mdto.seq}">🗑️</a></span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





