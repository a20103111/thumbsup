<%@ page language="java" import="java.sql.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>登录</title>
	<link rel="stylesheet" href="<%=basePath %>thumbsupPage/css/style.css">
	<link href="<%=basePath %>thumbsupPage/css/popup-box.css" rel="stylesheet" type="text/css" media="all" />
	<!--<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
-->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Sign In And Sign Up Forms  Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

	<script src="<%=basePath %>thumbsupPage/js/jquery.min.js"></script>
<script src="<%=basePath %>thumbsupPage/js/jquery.magnific-popup.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath %>thumbsupPage/js/modernizr.custom.53451.js"></script> 
<script type="text/javascript" src="<%=basePath %>layer/mobile/layer.js"></script> 
 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
						
						
					
</script>	
		<script type="text/javascript">
		
	    /*changP():刷新验证码*/
		function changeP() {
			var checkCodeImg = $("#checkCodeImg");
			checkCodeImg.src = "<%=basePath%>checkCode.jsp";
		}
		
		
		</script>
</head>
<body>

	<h1>登录</h1>
	
	<c:if test="${not empty msg}">
		<script>
		 //提示
		  layer.open({
		    content: '${msg}'
		    ,skin: 'msg'
		    ,time: 1.5 //2秒后自动关闭
		  });
	</script>


	</c:if>
		<div class="w3layouts">
		<div class="signin-agile" >
			<form action="Studentlogin.do" method="post">
				<input type="text" name="userName" class="username" placeholder="用户名" required="required">
				<input type="password" name="passWord" class="password" placeholder="密码" required="required">
				<div><input type="text" name="code" class="name" placeholder="验证码" required="required" style="width: 30%;">
				<img  id="checkCodeImg" src="<%=basePath%>checkCode.jsp" onclick="changeP()"></div>
				<div class="clear"></div>
				<input type="submit" value="登录">
				
				
			
			</form>
		</div>
		
		
	</div>

<body>
</html>