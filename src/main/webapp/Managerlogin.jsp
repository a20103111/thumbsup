<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="<%=basePath%>assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>后台管理系统</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    
    
    <!-- Bootstrap core CSS     -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
        
    <!--  Light Bootstrap Dashboard core CSS    -->
    <link href="<%=basePath%>css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="<%=basePath%>css/demo.css" rel="stylesheet" />
    
        
    <!--     Fonts and icons     -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
    <link href='<%=basePath%>css/685fd913f1e14aebad0cc9d3713ee469.css' rel='stylesheet' type='text/css'>
    <link href="<%=basePath%>css/pe-icon-7-stroke.css" rel="stylesheet" />
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
    <script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/jquery-ui.min.js" type="text/javascript"></script> 
	<script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
	
	
	<!--  Forms Validations Plugin -->
	<script src="<%=basePath%>js/jquery.validate.min.js"></script>
	
	<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
	<script src="<%=basePath%>js/moment.min.js"></script>
	
    <!--  Date Time Picker Plugin is included in this js file -->
    <script src="<%=basePath%>js/bootstrap-datetimepicker.js"></script>
    
    <!--  Select Picker Plugin -->
    <script src="<%=basePath%>js/bootstrap-selectpicker.js"></script>
    
	<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
	<script src="<%=basePath%>js/bootstrap-checkbox-radio-switch-tags.js"></script>
	
	<!--  Charts Plugin -->
	<script src="<%=basePath%>js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="<%=basePath%>js/bootstrap-notify.js"></script>
    
    <!-- Sweet Alert 2 plugin -->
	<script src="<%=basePath%>js/sweetalert2.js"></script>
        
    <!-- Vector Map plugin -->
	<script src="<%=basePath%>js/jquery-jvectormap.js"></script>
	
    <!--  Google Maps Plugin    -->
    <script src="<%=basePath%>js/aa743e8f448a4792bad10d201a7080f6.js"></script>
	
	<!-- Wizard Plugin    -->
    <script src="<%=basePath%>js/jquery.bootstrap.wizard.min.js"></script>

    <!--  Datatable Plugin    -->
    <script src="<%=basePath%>js/bootstrap-table.js"></script>
    
    <!--  Full Calendar Plugin    -->
    <script src="<%=basePath%>js/fullcalendar.min.js"></script>
    
    <!-- Light Bootstrap Dashboard Core javascript and methods -->
	<script src="<%=basePath%>js/light-bootstrap-dashboard.js"></script>
	
	<!--   Sharrre Library    -->
    <script src="<%=basePath%>js/jquery.sharrre.js"></script>
	
	<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
	<script src="<%=basePath%>js/demo.js"></script>
	
	  <script type="text/javascript" src="<%=basePath%>layer/layer.js"></script> 
	  
	
</head>
<body> 

<nav class="navbar navbar-transparent navbar-absolute">
    <div class="container">    
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">班主任点赞系统后台</a>
        </div>
        <div class="collapse navbar-collapse">       
            
            <ul class="nav navbar-nav navbar-right">
                <li>
                   <a href="register.html">
                      	  注册
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
 

<div class="wrapper wrapper-full-page">
    <div class="full-page login-page" data-color="blue" data-image="<%=basePath%>picture/full-screen-image-1.jpg">   
        
    <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        <div class="content">
            <div class="container">
                <div class="row">                   
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                        <form method="post" action="ManagerLogin.do">
                            
                        <!--   if you want to have the card without animation please remove the ".card-hidden" class   -->
                            <div class="card card-hidden">
                                <div class="header text-center">登录</div>
                                <div class="content">
                                    <div class="form-group">
                                        <label>帐号</label>
                                        <input type="text" placeholder="请输入帐号" name="userName" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>密码</label>
                                        <input type="password" placeholder="请输入密码" name="passWord" class="form-control">
                                    </div>                                    
                                   
                                    <div class="form-group">
                                      <div class="col-sm-10">
                                      			
                                                <label class="radio radio-inline" style="margin-bottom: 0px;margin-top: 0px;">
                                                    <span class="icons"><span class="first-icon fa fa-square-o"></span><span class="second-icon fa fa-check-square-o"></span></span><input type="radio" name="type"  value="1" data-toggle="radio">老师
                                                </label>
                                                
												<label class="radio radio-inline" style="margin-bottom: 0px;">
                                                    <span class="icons"><span class="first-icon fa fa-square-o"></span><span class="second-icon fa fa-check-square-o"></span></span><input type="radio" name="type" value="2" data-toggle="radio">管理员
                                                </label>
                                                
                                           </div>
                     
                                    </div>
                                    
                                </div>
                                <div class="footer text-center" style="margin-top: 10px;">
                                    <button type="submit" class="btn btn-fill btn-info btn-wd">登录</button>
                                </div>
                            </div>
                                
                        </form>
                                
                    </div>                    
                </div>
            </div>
        </div>
    	
    	

    </div>                             
       
</div>
  <c:if test="${not empty msg}">
		<script>
		var msg = '${msg}';
		 //提示
		 console.log(msg);
		 
		   layer.msg(msg);
	</script>

	</c:if>



</body>
    
    
    <script type="text/javascript">
        $().ready(function(){
            lbd.checkFullPageBackgroundImage();
            
            setTimeout(function(){
                // after 1000 ms we add the class animated to the login/register card
                $('.card').removeClass('card-hidden');
            }, 700)
        });
    </script>
    
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    
      ga('create', 'UA-46172202-1', 'auto');
      ga('send', 'pageview');
    
    </script>
   
    
</html>