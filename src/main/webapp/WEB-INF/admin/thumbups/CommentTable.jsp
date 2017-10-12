<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	String date = sdf.format(new Date());
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>班级数据</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- Bootstrap core CSS     -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />

<!--  Light Bootstrap Dashboard core CSS    -->
<link href="<%=basePath%>css/light-bootstrap-dashboard.css"
	rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="<%=basePath%>css/demo.css" rel="stylesheet" />
<link href="<%=basePath%>time/css/lq.datetimepick.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
<link href='<%=basePath%>css/685fd913f1e14aebad0cc9d3713ee469.css'
	rel='stylesheet' type='text/css'>
<link href="<%=basePath%>css/pe-icon-7-stroke.css" rel="stylesheet" />

<link href="<%=basePath%>css/comment.css" rel="stylesheet" />
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
<script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath%>layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath%>js/sweetalert2.js" type="text/javascript"></script>
<script src="<%=basePath%>tbumbjs/echarts.min.js" type="text/javascript"></script>
<script src="<%=basePath%>tbumbjs/radialIndicator.js"
	type="text/javascript"></script>
	<!--  Date Time Picker Plugin is included in this js file -->
<script>
var pageinitNum=1;


function pagePre(pageNum){
	var pagenum=pageNum-1;
	
	return pagenum;
	
	
}

function pageNext(pageNum){
	var pagenum=pageNum+1;
	
	return pagenum;
}


function pageUtil(){
	
	
	$.ajax({
		
		async:true,
		type:"post",
		url:"getCommentsPageSession.do",
		dataType:"json",
		success:function(json){
			var p="";
			pageinitNum=json.pageNum;
			
			if(json.hasPreviousPage==true){
				
				p+="<li ><a onclick='getAllComments("+pagePre(json.pageNum)+")' href='#'>«</a></li>";
				
				
			}
			else{
			p+="<li  class='disabled'><a  href='#'>«</a></li>";
			}
			
		
			
			for(var i=1;i<=json.pages;i++){
				
				if(i==json.pageNum){
					p+= "<li class='active'>"
						+"<a onclick='getAllComments("+i+")' href='#'>"
						+i
						+"</a></li>";
						continue;
				}
					
				p+= "<li>"
					+"<a onclick='getAllComments("+i+")' href='#'>"
					+i
					+"</a></li>";
				
			}
		
		if(json.hasNextPage==true){
				p+="<li><a onclick='getAllComments("+pageNext(json.pageNum)+")' href='#'>»</a></li>";
			}
			else{
				p+="<li class='disabled'><a  href='#'>»</a></li>";
				
			}
		
			$("#pageul").html(p);
		}
	});
	
	
	
}

function remove(CommentId){
	
	//删除确认提示
	swal({  title: "确定要删除该留言信息吗？",
	    text: "删除留言信息后无法恢复",
	    type: "warning",
	    showCancelButton: true,
	    confirmButtonText: "删除",
	    cancelButtonText: "取消",
	    closeOnConfirm: false,
	    closeOnCancel: false
    },function(isConfirm){
        if (isConfirm){
        	
        	$.ajax({

        		async:true,
        		type:"post",
        		url:"deleteCommentByPK.do",
        		data:{CommentId:CommentId},
        		dataType:"json",
        		success:function(data){
        	
        			if(data=="020"){
        				
        				swal("删除成功", "", "success");
        				getAllComments(pageinitNum);
        			}
        			if(data=="021"){
        				
        				swal("删除失败", "", "error");	
        				getAllComments(pageinitNum);
        			}
        			
        			
        		},
        		error:function(msg){
        			alert("ajax失败！");
        		}
        		
        });
        	 
        }else{
            swal("已取消", "", "error");
        }
    });

}	

function check(commentid){
	
	layer.open({
		  type: 2,
		  title: '查看留言信息',
		  skin: 'layui-layer-lan',
		  maxmin: true,
		  shadeClose: true, //点击遮罩关闭层
		  area : ['750px' , '620px'],
		  content: 'getCommentByPk.do?CommentId='+commentid
		  });
	
	
	
}


function getAllComments(pageNum){
	
	$("#commentsbody").empty();
	$("#pageul").html("");
	
	$.ajax({

		async:true,
		type:"post",
		url:"getComments.do",
		data:{pageNum:pageNum},
		dataType:"json",
		success:function(json){
			//var tbody = $("#home").children().children();
			//var tbody = place;
			var comments;
			
			
			$.each(json,function(index,content){
			
				comments+="<tr>"
                            +"<td class='text-center'>"+content.studentName+"</td>"
                            				   +"<td>"+content.studentFromclassid+"</td>"
                            				   +"<td>"+content.studentPhone+"</td>"
                            				   +"<td style='white-space: nowrap;overflow: hidden;text-overflow: ellipsis;'>"+content.comment+"</td>"
		                                       +"<td class='td-actions'>"
		                                       +"<a id='check' onclick='check("+content.id+")' href='#' rel='tooltip' title='查看留言' class='btn btn-info btn-simple btn-xs'>"
                                               +" <i class='fa fa-user'></i>"
                                         	   +"  </a>"
	                                           +"<a href='#' rel='tooltip' onclick='remove("+content.id+")' title='删除留言信息' class='btn btn-danger btn-simple btn-xs'>"
	                                                   +"<i class='fa fa-times'></i>"
	                                           +"</a>"
	                                           +"</td>"  	
                                    +"</tr>";
			});
			
			$("#commentsbody").html(comments);
			pageUtil();
	}
		
});
}
		
		getAllComments(1);

</script>

</head>

<body>

	<c:if test="${not empty msg}">
		<script>
	if("${msg}"=="009"){
		
		swal({ title: '修改成功',
		 	  type: "success",
		 	   timer: 1500,
		 	   showConfirmButton: false
		     });
	}
	
	
	</script>


	</c:if>
	<div class="wrapper">
		<jsp:include page="../adminsidebar.jsp">
		<jsp:param value="comments" name="pages"/>
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
					<a class="navbar-brand" href="#">留言信息管理</a>
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
									<a href="Adminlogout.do" class="text-danger">
										<i class="pe-7s-close-circle"></i>
										注销
									</a>
								</li>
							</ul>
						</li>

					</ul>
					</nav>
			<div class="content">
				<div class="container-fluid">
					
					

				<div class="row">
					<div class="col-md-12">

						<div class="card">
							<div class="header">
								<h4 class="title">留言信息</h4>
								<p class="category">以下为留言信息表格</p>
							</div>
							<div class="content table-responsive table-full-width">
								<table class="table" style="table-layout: fixed;">
									<thead>
										<tr>
											<th class="text-center">学生姓名</th>
											<th>班号</th>
											<th>手机号码</th>
											<th>留言内容</th>
											<th>操作</th>
										
										</tr>
									</thead>
									<tbody id="commentsbody">

									</tbody>
								</table>
								<div align="center">

									<!--
                                                color-classes: "pagination-blue", "pagination-azure", "pagination-orange", "pagination-red", "pagination-green"
                                            -->

									<ul class="pagination" id="pageul">


									</ul>
								</div>
							</div>
						</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
			</div>
		</div>
</div>
</div>
		<footer class="footer">
			<div class="container-fluid">
				<nav class="pull-left">
					<ul>
						<li><a href="#"> Home </a></li>
						<li><a href="#"> Company </a></li>
						<li><a href="#"> Portfolio </a></li>
						<li><a href="#"> Blog </a></li>
					</ul>
				</nav>
				<p class="copyright pull-right">
					&copy; 2016 <a href=""#">Creative Tim</a>, made with love for a
					better web
				</p>
			</div>
		</footer>
	</div>
</body>



<!--  Forms Validations Plugin -->
<script src="<%=basePath%>js/jquery.validate.min.js"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="<%=basePath%>js/moment.min.js"></script>



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
<!--  Date Time Picker Plugin is included in this js file -->


<script type="text/javascript">
        $().ready(function(){

            var $validator = $("#wizardForm").validate({
    		  rules: {
    		    email: {
                    required: true,
                    email: true,
                    minlength: 5
    		    },
    		    first_name: {
    		        required: false,
                    minlength: 5
    		    },
    		    last_name: {
    		        required: false,
                    minlength: 5
    		    },
    		    website: {
    		        required: true,
                    minlength: 5,
                    url: true
    		    },
    		    framework: {
        		    required: false,
        		    minlength: 4
    		    },
    		    cities: {
        		    required: true
    		    },
    		    price:{
        		    number: true
    		    }
    		  }
    		});

         

          
          

            // you can also use the nav-pills-[blue | azure | green | orange | red] for a different color of wizard

            $('#wizardCard').bootstrapWizard({
            	tabClass: 'nav nav-pills',
            	nextSelector: '.btn-next',
                previousSelector: '.btn-back',
            	onNext: function(tab, navigation, index) {
            		var $valid = $('#wizardForm').valid();

            		if(!$valid) {
            			$validator.focusInvalid();
            			return false;
            		}
            	},
                onInit : function(tab, navigation, index){

                    //check number of tabs and fill the entire row
                    var $total = navigation.find('li').length;
                    $width = 100/$total;

                    $display_width = $(document).width();

                    if($display_width < 600 && $total > 3){
                       $width = 50;
                    }

                    navigation.find('li').css('width',$width + '%');
                },
                onTabClick : function(tab, navigation, index){
                    // Disable the posibility to click on tabs
                    return false;
                },
                onTabShow: function(tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index+1;

                    var wizard = navigation.closest('.card-wizard');

                    // If it's the last tab then hide the last button and show the finish instead
                    if($current >= $total) {
                        $(wizard).find('.btn-next').hide();
                        $(wizard).find('.btn-finish').show();
                    } else if($current == 1){
                        $(wizard).find('.btn-back').hide();
                    } else {
                        $(wizard).find('.btn-back').show();
                        $(wizard).find('.btn-next').show();
                        $(wizard).find('.btn-finish').hide();
                    }
                }

            });

        });
        
    	
       </script>

    
    	

</html>
