<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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


<!--     Fonts and icons     -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
<link href='<%=basePath%>css/685fd913f1e14aebad0cc9d3713ee469.css'
	rel='stylesheet' type='text/css'>
<link href="<%=basePath%>css/pe-icon-7-stroke.css" rel="stylesheet" />
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
<script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath%>layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath%>js/sweetalert2.js" type="text/javascript"></script>
<script src="<%=basePath%>tbumbjs/Classes.js" type="text/javascript"></script>

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
		url:"getTeacherPageSession.do",
		dataType:"json",
		success:function(json){
			var p="";
			pageinitNum=json.pageNum;
			
			if(json.hasPreviousPage==true){
				
				p+="<li ><a onclick='getAllTeachers("+pagePre(json.pageNum)+")' href='#'>«</a></li>";
				
			}
			else{
			p+="<li  class='disabled'><a  href='#'>«</a></li>";
			}
			
			for(var i=1;i<=json.pages;i++){
				
				if(i==json.pageNum){
					p+= "<li class='active'>"
						+"<a onclick='getAllTeachers("+i+")' href='#'>"
						+i
						+"</a></li>";
						continue;
				}
					
				p+= "<li>"
					+"<a onclick='getAllTeachers("+i+")' href='#'>"
					+i
					+"</a></li>";
				
			}
			
		if(json.hasNextPage==true){
				p+="<li><a onclick='getAllTeachers("+pageNext(json.pageNum)+")' href='#'>»</a></li>";
			}
			else{
				p+="<li class='disabled'><a  href='#'>»</a></li>";
				
			}
			
			$("#pageul").html(p);
		}
	});
	
	
	
}



function getAllTeachers(pageInfo){
	
	$.ajax({

		async:true,
		type:"post",
		url:"getAllTeachers.do",
		data:{pageNum:pageInfo},
		dataType:"json",
		success:function(json){
			//var tbody = $("#home").children().children();
			//var tbody = place;
			var teachers;
			$.each(json,function(index,content){
				
				teachers+="<tr>"
                            +"<td class='text-center'>"+content.teacherId+"</td>"
                            				   +"<td>"+content.teacherName+"</td>"
		                                       +"<td>"+content.teacherPhone+"</td>"
		                                       +"<td>"+content.teacherAccount+"</td>"
	                                           +"<td class='td-actions text-right'>"
	                                             
	                                              +" <a href='#' onclick='update("+content.teacherId+")' rel='tooltip' title='修改学生' class='btn btn-success btn-simple btn-xs'>"
	                                                  +"<i class='fa fa-edit'></i>"
	                                               +"</a>"
	                                              +"<a href='#' rel='tooltip' onclick='remove("+content.teacherId+")' title='删除班主任' class='btn btn-danger btn-simple btn-xs'>"
	                                                   +"<i class='fa fa-times'></i>"
	                                              +"</a>"
	                                           +"</td>"  	
                                    +"</tr>";
			});
			
			$("#teachersbody").html(teachers);
			pageUtil();	
		
	}
		
});
	
}
getAllTeachers(1);

function getTeacherByKey(){
	
	$("#teachersbody").empty();
	var TeacherName = $("#TeacherName").val();
	
	if(TeacherName==""||TeacherName==null){
		
		return getAllTeachers(1);
	}
	console.log(TeacherName);
	$.ajax({

		async:true,
		type:"post",
		url:"getTeacherByKey.do",
		data:{TeacherName:TeacherName},
		dataType:"json",
		success:function(json){
			//var tbody = $("#home").children().children();
			//var tbody = place;
			var teachers;
			$.each(json,function(index,content){
				
				teachers+="<tr>"
                            +"<td class='text-center'>"+content.teacherId+"</td>"
                            				   +"<td>"+content.teacherName+"</td>"
		                                       +"<td>"+content.teacherPhone+"</td>"
		                                       +"<td>"+content.teacherAccount+"</td>"
	                                           +"<td class='td-actions text-right'>"
	                                             
	                                              +" <a href='#' onclick='update("+content.teacherId+")' rel='tooltip' title='修改学生' class='btn btn-success btn-simple btn-xs'>"
	                                                  +"<i class='fa fa-edit'></i>"
	                                               +"</a>"
	                                              +"<a href='#' rel='tooltip' onclick='remove("+content.teacherId+")' title='删除班主任' class='btn btn-danger btn-simple btn-xs'>"
	                                                   +"<i class='fa fa-times'></i>"
	                                              +"</a>"
	                                           +"</td>"  	
                                    +"</tr>";
			});
			
			$("#teachersbody").html(teachers);
			$("#pageul").html("");
		
	}
		
});
	
}


//更新班级
function update(TeacherId){

	layer.open({
		  type: 2,
		  title: '修改班主任',
		  skin: 'layui-layer-lan',
		  maxmin: true,
		  shadeClose: true, //点击遮罩关闭层
		  area : ['750px' , '620px'],
		  content: 'getTeacherByPK.do?TeacherId='+TeacherId+'&flag=update'
		  });

}


//删除班级
function remove(TeacherId){
	
	

	//删除确认提示
	swal({  title: "确定要删除该班主任吗？",
	    text: "删除班主任后无法恢复",
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
        		url:"deleteTeacherByPK.do",
        		data:{TeacherId:TeacherId},
        		dataType:"json",
        		success:function(data){
        	
        			if(data=="017"){
        				
        				swal("删除成功", "", "success");
        				getAllTeachers(pageinitNum);
        			}
        			if(data=="018"){
        				
        				swal("删除失败", "", "error");	
        				getAllTeachers(pageinitNum);
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
	

function add(){
	
	layer.open({
		  type: 2,
		  title: '添加班主任',
		  skin: 'layui-layer-lan',
		  maxmin: true,
		  shadeClose: true, //点击遮罩关闭层
		  area : ['750px' , '620px'],
		  content: 'toAddTeahcer.do'
		  });

}




</script>
</head>
<body>

	<c:if test="${not empty msg}">
		<script>
	if("${msg}"=="015"){
		
		swal({ title: '修改成功',
		 	  type: "success",
		 	   timer: 1500,
		 	   showConfirmButton: false
		     });
	}
	if("${msg}"=="016"){
		
		swal({ title: '修改失败', 
		 	  type: "warning",
		 	   timer: 1500,
		 	   showConfirmButton: false
		     });
		
		
		
	}
if("${msg}"=="013"){
		
		swal({ title: '新增班主任成功',
		 	  type: "success",
		 	   timer: 1500,
		 	   showConfirmButton: false
		     });
	}
if("${msg}"=="014"){
	
	swal({ title: '新增班主任失败',
	 	  type: "success",
	 	   timer: 1500,
	 	   showConfirmButton: false
	     });
}
	
	</script>


	</c:if>
	<div class="wrapper">
		<jsp:include page="../adminsidebar.jsp">
		
		<jsp:param value="teacher" name="pages"/>
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
					<a class="navbar-brand" href="#">学生信息管理</a>
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
				</div>
			</div>
		</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="content">
									<form class="form-horizontal">
										<div class="form-group">
											<label class="col-md-3 control-label">输入班主任姓名</label>
											<div class="col-md-4">
												<input type="text" id="TeacherName" placeholder="请输入需要查询的班主任姓名"
													class="form-control">
											</div>
											<div class="col-md-1">
												<button type="button" onclick="getTeacherByKey()"
													class="btn btn-fill btn-info">&nbsp;查询&nbsp;</button>
											</div>
											<div class="col-md-1">
												<button type="button" onclick="add()"
													class="btn btn-fill btn-info">&nbsp;添加班主任&nbsp;</button>
											</div>
										</div>


									</form>
								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-12">

							<div class="card">
								<div class="header">
									<h4 class="title">班主任信息</h4>
									<p class="category">以下为班主任信息表格</p>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table">
										<thead>
											<tr>
												<th class="text-center">id</th>
												<th>班主任姓名</th>
												<th>班主任手机号</th>
												<th>班主任帐号</th>
												
												<th class="text-right">操作</th>
											</tr>
										</thead>
										<tbody id="teachersbody">

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
						</div>
						<!-- end col-md-12 -->
					</div>
					<!-- end row -->

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
	</div>




</body>



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

        function onFinishWizard(){
            //here you can do something, sent the form to server via ajax and show a success message with swal

            swal("Good job!", "You clicked the finish button!", "success");
        }
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
