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
<title>点赞</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>thumbsupPage/assets/css/bootstrap.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=basePath%>thumbsupPage/assets/css/main.css" rel="stylesheet">
<link href="<%=basePath%>thumbsupPage/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=basePath%>thumbsupPage/assets/css/animate-custom.css" rel="stylesheet">
<script src="<%=basePath%>thumbsupPage/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>thumbsupPage/assets/js/modernizr.custom.js"></script>
<script type="text/javascript" src="<%=basePath %>rating/dist/jquery.emojiRatings.min.js"></script>
<script type="text/javascript" src="<%=basePath %>layer/mobile/layer.js"></script>
<script type="text/javascript">
	
	function confirm(){
		
		
		layer.open({
		    content: '您确定要提交评分和留言吗？'
		    ,btn: ['确定', '取消']
		    ,yes: function(index){
		    	
		    	
		    	
		    	if($("input[name='score']").val()==undefined){
		    		
		    		 layer.open({
		    			    content: '评分不能为空'
		    			    ,skin: 'msg'
		    			    ,time: 2 //2秒后自动关闭
		    			  });
		    		
		    		 console.log(1);
		    	}else{
		    	
		    		$("#comment").submit();
		    	}
		    	
		    	
		    	}
		    	
		    
		  });
		
		
	}
	


  
    // Defaults
   
    
    
    
  
      

</script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body data-spy="scroll" data-offset="0" data-target="#navbar-main">


<div id="team" name="team">
  <div class="container">
    <div class="row centered" style="">
      <h2 class="centered">您的班主任</h2>
      <hr>
      <div class="col-lg-12 centered"> <img class="img img-circle" src="<%=basePath%>thumbsupPage/assets/img/team/team01.jpg" height="120px" width="120px" alt="">
        <h4>${teacher.teacherName}</h4>
        <p> ${teacher.teacherInfo}</p>
        <form  action="InsertComment.do?teacherId=${teacher.teacherId}" method="post" class="form" id="comment">
       <div >
       <h4>评分</h4>
       
       <div id="element"></div>
        </div>
  
     
     <div style="margin-top: 5%;" id="returnComment">
          <textarea class="form-control"  name="comment"  placeholder="留言给班主任" rows="5"></textarea>
          <div class="row" >
            <div class="col-xs-12 col-md-112" style="margin-top: 5%;">
              <button class="btn  btn-warning btn-md" type="button" onclick="confirm()">&nbsp;提交&nbsp;</button>
            </div>
          </div>
           </div>
        </form>
     
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
<script>

var options = {
        emoji: 'U+2764',
        count: 10,
        fontSize: 16,
        inputName: 'score',
        rating:5
    };   
    $('#element').emojiRating(options);
    
</script>
</html>
