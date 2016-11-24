<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="/repo/images/favicon.ico">
	<title>xwlj</title>
	<link href="/repo/css/bootstrap.min.css" rel="stylesheet">
	<link href="/repo/css/font-awesome.min.css" rel="stylesheet">
	<link href="/repo/css/style.css" rel="stylesheet">
	<style type="text/css">


	</style>
</head>

<body>
<jsp:include page="/repo/commonPage/header.jsp" flush="true" />
<div id="content" class="container">
	<div class="row">

		<div class="col-xs-12 col-md-9">

			<div type="button" class="btn btn-success">微信登录</div>
			<div id="code"></div>
			<div id="win" class="login-wrapper" style="display: none;margin: 300px;">
				<%request.getAttribute("code");%>
				<form method="post" id="loginForm">
				<div class="alert alert-error hide error-msg"></div>
				<input type="text" name="username" placeholder="账号">
				<input type="password" name="password" placeholder="密码">
				<div class="btns">
					<button id="loginBtn" type="button" class="button button-flat-primary"> 进入系统</button>
				</div>
				</form>
			</div>
				<%--<div id="content" style="background-color:#EEEEEE;height:200px;width:400px;float:left;">
                内容在这里</div>--%>
		</div>
		<div class="col-xs-6 col-md-3">

				<h1> ${sessionScope.currUser.username}</h1>
					<img src="${sessionScope.currUser.avatar}">

		</div>
	</div>

</div>
<jsp:include page="/repo/commonPage/footer.jsp" flush="true" />
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
<script src="/repo/js/jquery-1.11.3.min.js"></script>
<script src="/repo/js/jquery-qrcode.js" type="text/javascript"></script>
<script src="/repo/js/bootstrap.js"></script>
<script src="/repo/js/wechat.js"></script>
<script type="text/javascript">
	$(function() {
		var str1 =  newGuid();
		$("#navbar ul li").click(function () {
			$("#navbar ul li").removeClass();
			$(this).addClass("active");
		});
		$(".btn-success").hover(function() {
			var str = toUtf8(str1);
			$("#code").qrcode({
				render: "table",
				width: 200,
				height: 200,
				text: str
			})
		},function () {
			$("#code").empty();
		});
		$("#login").click(function () {
			$("#win").css("display","block");
	});
		$("#loginBtn").click(function () {
			$("#loginForm").submit();
		});
		<c:if test="${code==1000}">
		$(".error-msg").fadeIn(200).text("账号或密码错误");
		</c:if>
		$(".login-wrapper input").focus(function () {
			$(".error-msg").fadeOut(50).text("");
		});
	});
</script>
</body>
</html>
