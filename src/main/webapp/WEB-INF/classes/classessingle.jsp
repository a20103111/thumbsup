<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
    

    <div class="main-panel">
       


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    
                    <div class="col-md-6">
                        <div class="card card-user">
                            <div class="image">
                                <img src="<%=basePath%>picture/full-screen-image-3.jpg" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" src="<%=basePath%>picture/computer.png" alt="..."/>

                                      <h4 class="title">  ${classes.tclass.className} <br />
                                         <small>共&nbsp;${classes.tclass.classNumbers}&nbsp;人</small>
                                      </h4>
                                    </a>
                                </div>
                                <p class="description text-center"> 开课时间：${classes.tclass.classCreatetime}<br>
                                                 	   结课时间： ${classes.tclass.classEndtime} <br>
                                                 	   班级类型： ${classes.tclasstype.typeName} <br>
                                                   
                                </p>
                            </div>
                            <hr>
                            
                        </div>
                    </div>

                </div>
            </div>
        </div>


       

    </div>
</div>
</body>
</html>