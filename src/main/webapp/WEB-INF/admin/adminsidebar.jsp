<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String pages = request.getParameter("pages");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="sidebar" data-color="blue" >
        <!--

            Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
            Tip 2: you can also add an image using data-image tag

        -->

        <div class="logo">
            <a href="#" class="logo-text">
               			管理员后台
            </a>
        </div>
		<div class="logo logo-mini">
			<a href="#" class="logo-text">
				Ct
			</a>
		</div>

    	<div class="sidebar-wrapper">
            <div class="user">
                <div class="photo">
                    <img src="picture/default-avatar.png" />
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                        ${sessionScope.Admin.adminName }
                        <b class="caret"></b>
                    </a>
                    <div class="collapse" id="collapseExample">
                        <ul class="nav">
                            <li><a href="#">注销</a></li>
                            
                        </ul>
                    </div>
                </div>
            </div>

            <ul class="nav">
            
           
                <li  <%if("index".equals(pages)){ %>class="active"<%} %>>
                
                
                    <a href="login.do">
                        <i class="pe-7s-graph"></i>
                        <p>首页</p>
                    </a>
                </li>
                <li <%if("teacher".equals(pages)){ %>class="active"<%} %>>
                    <a  href="toTeahcer.do">
                        <i class="pe-7s-plugin"></i>
                        <p>班主任管理
                          
                        </p>
                    </a>
                    
                </li>

                <li <%if("thumbs".equals(pages)){ %>class="active"<%} %>>
                    <a  href="toadminThumbup.do">
                        <i class="pe-7s-note2"></i>
                        <p>点赞管理
                         
                        </p>
                    </a>
                    
                </li>

                <li <%if("comments".equals(pages)){ %>class="active"<%} %>>
                    <a  href="toadminComments.do">
                        <i class="pe-7s-news-paper"></i>
                        <p>留言管理
                           
                        </p>
                    </a>
                    
                </li>

             


               
            </ul>
    	</div>
    </div>
</body>
</html>