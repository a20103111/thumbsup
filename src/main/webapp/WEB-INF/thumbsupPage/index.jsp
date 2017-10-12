<%@ page language="java" import="java.sql.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>班主任点赞</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>thumbsupPage/assets/css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>thumbsupPage/assets/css/main.css" rel="stylesheet">
<link href="<%=basePath%>thumbsupPage/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=basePath%>thumbsupPage/assets/css/animate-custom.css" rel="stylesheet">
<script src="<%=basePath%>thumbsupPage/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>thumbsupPage/assets/js/modernizr.custom.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
<div id="navbar-main"> 
  <!-- Fixed navbar -->
  <div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a class="navbar-brand" href="#home"><i class="fa fa-location-arrow"></i> 班主任点赞</a> </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#home" class="smoothScroll">首页</a></li>
      
        </ul>
      </div>
      <!--/.nav-collapse --> 
    </div>
  </div>
</div>

<!-- ==== HEADERWRAP ==== -->
<div id="headerwrap" name="home">
  <header class="clearfix">
  
    <h1>亲爱的同学，为你的班主任点赞吧！</h1>
    <p>如果你已经有账号，你可以点击下方登录按钮，登录后为你的班主任点赞，如果想浏览其他信息可以通过下拉浏览</p>
    <a href="toStudentLogin.do" class="smoothScroll btn btn-lg">登录点赞</a> </header>
    <a href="#about">向下滑动</a>
</div>
<!-- /headerwrap --> 

<!-- ==== ABOUT ==== -->
<div id="about" name="about">
  <div class="container">
    <div class="row white">
      <div class="col-md-6"> <img class="img-responsive" src="<%=basePath%>thumbsupPage/assets/img/about/about1.jpg" align=""> </div>
      <div class="col-md-6">
        <h3>如何为你的班主任点赞？</h3>
        <p>你可以通过手机扫描二维码或者通过电脑端访问我们的网站主页:<a>班主任点赞</a> 来为你的班主任点赞，我们为移动端和电脑端都提供了支持！</p>
      </div>
    </div>
    <!-- row --> 
  </div>
</div>
<!-- container --> 

<!-- ==== SERVICES ==== -->

<!-- container --> 

<!-- ==== PORTFOLIO ==== -->

<!-- /container --> 

<!-- ==== TEAM MEMBERS ==== -->
<div id="team" name="team">
  <div class="container">
    <div class="row centered">
      <h2 class="centered">获赞最多的班主任</h2>
      <hr>
      <div class="col-lg-3 centered"> <img class="img img-circle" src="<%=basePath%>thumbsupPage/assets/img/team/team01.jpg" height="120px" width="120px" alt="">
        <h4>林日杰</h4>
        <p>来自 电信九十九班</p>
         <a href="#"><i class="fa fa-linkedin"></i></a> 99</div>
     
    </div>
  </div>
  <!-- row --> 
</div>
<!-- container --> 

<!-- ==== CONTACT ==== -->

<!-- container -->



<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 

<script type="text/javascript" src="<%=basePath%>thumbsupPage/assets/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>thumbsupPage/assets/js/retina.js"></script> 
<script type="text/javascript" src="<%=basePath%>thumbsupPage/assets/js/jquery.easing.1.3.js"></script> 
<script type="text/javascript" src="<%=basePath%>thumbsupPage/assets/js/smoothscroll.js"></script> 
<script type="text/javascript" src="<%=basePath%>thumbsupPage/assets/js/jquery-func.js"></script>
</body>
</html>
