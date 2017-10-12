<%@ page language="java" import="java.sql.*" pageEncoding="utf-8" isELIgnored="false"%>
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
	<link rel="icon" type="image/png" href="../assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>班主任点赞</title>

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

</head>
<body>

<div class="wrapper">
    <jsp:include page="adminsidebar.jsp">
    <jsp:param value="index" name="pages"/>
    </jsp:include>

    <div class="main-panel">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-minimize">
					<button id="minimizeSidebar" class="btn btn-warning btn-fill btn-round btn-icon">
						<i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i>
						<i class="fa fa-navicon visible-on-sidebar-mini"></i>
					</button>
				</div>
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">首页</a>
				</div>
				<div class="collapse navbar-collapse">

					

					<ul class="nav navbar-nav navbar-right">
						

						

					

						<li class="dropdown dropdown-with-icons">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-list"></i>
								<p class="hidden-md hidden-lg">
									More
									<b class="caret"></b>
								</p>
							</a>
							<ul class="dropdown-menu dropdown-with-icons">
								
								
								<li>
									<a href="Teacherlogout.do" class="text-danger">
										<i class="pe-7s-close-circle"></i>
										注销
									</a>
								</li>
							</ul>
						</li>

					</ul>
				</div>
			</div>
		</nav>

        <div class="content">
            <div class="container-fluid">

                <div class="container-fluid">
                <div class="animated fadeIn">
								<div class="jumbotron">
				<h1>你好,  ${sessionScope.Admin.adminName }  </h1>
				<h1>欢迎进入管理员后台</h1>
				
				<p>
					<a class="btn btn-primary btn-lg" href="#" role="button">进入个人中心</a>
				</p>
			</div>
               
                </div>
                

            </div>
        </div>


       

    </div>
</div>

<div class="fixed-plugin">
    
</div>

</body>
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

    <!--  Bootstrap Table Plugin    -->
    <script src="<%=basePath%>js/bootstrap-table.js"></script>

	<!--  Plugin for DataTables.net  -->
    <script src="<%=basePath%>js/jquery.datatables.js"></script>


    <!--  Full Calendar Plugin    -->
    <script src="<%=basePath%>js/fullcalendar.min.js"></script>

    <!-- Light Bootstrap Dashboard Core javascript and methods -->
	<script src="<%=basePath%>js/light-bootstrap-dashboard.js"></script>

	<!--   Sharrre Library    -->
    <script src="<%=basePath%>js/jquery.sharrre.js"></script>

	<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
	<script src="<%=basePath%>js/demo.js"></script>

	

	<script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-46172202-1', 'auto');
      ga('send', 'pageview');

    </script>

</html>
