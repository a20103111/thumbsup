<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
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
<link href="<%=basePath%>time/css/lq.datetimepick.css" rel="stylesheet" />

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
<script src="<%=basePath%>tbumbjs/echarts.min.js" type="text/javascript"></script>
<script src="<%=basePath%>tbumbjs/radialIndicator.js"
	type="text/javascript"></script>
	<!--  Date Time Picker Plugin is included in this js file -->

<script type="text/javascript" src="<%=basePath%>jedate/jedate.js"></script>

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
		url:"getThumbpsPageSession.do",
		dataType:"json",
		success:function(json){
			var p="";
			pageinitNum=json.pageNum;
			
			if(json.hasPreviousPage==true){
				
				p+="<li ><a onclick='selectThumbsByKey("+pagePre(json.pageNum)+")' href='#'>«</a></li>";
				
				
			}
			else{
			p+="<li  class='disabled'><a  href='#'>«</a></li>";
			}
			
		
			
			for(var i=1;i<=json.pages;i++){
				
				if(i==json.pageNum){
					p+= "<li class='active'>"
						+"<a onclick='selectThumbsByKey("+i+")' href='#'>"
						+i
						+"</a></li>";
						continue;
				}
					
				p+= "<li>"
					+"<a onclick='selectThumbsByKey("+i+")' href='#'>"
					+i
					+"</a></li>";
				
			}
		
		if(json.hasNextPage==true){
				p+="<li><a onclick='selectThumbsByKey("+pageNext(json.pageNum)+")' href='#'>»</a></li>";
			}
			else{
				p+="<li class='disabled'><a  href='#'>»</a></li>";
				
			}
		
			$("#pageul").html(p);
		}
	});
	
	
	
}
function avag(ClassId,createTime,TeacherName){
	$("#avag").empty();
	var progObj = radialIndicator('#avag' , {
		radius:150, //定义圆形指示器的内部的圆的半径。
		barBgColor:"#CCC", //定义圆形指示器的刻度条的背景颜色。
		barColor:{0 : '#FF0000', 5 : '#408FCC', 10 : '#7DC67D'}, //指示器数值样式
		percentage:false, //设置为true显示圆形指示器的百分比数值。
		// initValue:$("#indicatorVue").val(), //圆形指示器初始化的值。
		displayNumber:true,
		format: '平均 ## 分',
		minValue:0, //圆形指示器的最小值。
		maxValue:10
		});
	
	
	$.ajax({
		
			async:true,
			type:"post",
			url:"getAvag.do",
			data:{ClassId:ClassId,createTime:createTime,TeacherName:TeacherName},
			dataType:"json",
			success:function(json){
				//var tbody = $("#home").children().children();
				//var tbody = place;
				
				progObj.animate(json.avag); //启动动画
				}
				
		
	});
}
function  getCount(ClassId,createTime,TeacherName){
	
	var myChart = echarts.init(document.getElementById('echarts'));
	
	myChart.showLoading();// 加载动画
	$.ajax({
		
		async:true,
		type:"post",
		url:"getCount.do",
		data:{ClassId:ClassId,createTime:createTime,TeacherName:TeacherName},
		dataType:"json",
		success:function(json){
			
			//var tbody = $("#home").children().children();
			//var tbody = place;
			var array = [];

			for(i = 0 ;i<5;i++ ){
			//alert(str.name[i]+"===========》"+str.id[i]);
			var map ={};
			map.name = json.names[i];
			map.value = json.numbers[i];
			array[i]=map;
			}
			myChart.hideLoading();
	   // 填入数据
	  var	option = {
							    title : {
							        text: '点赞分数比例',
							        x:'center'
							    },
							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/>{b} : {c} ({d}%)"
							    },
							    legend: {
							        orient: 'vertical',
							        left: 'left',
							        data: json.names
							    },
							    series : [
							        {
							            name: '比例',
							            type: 'pie',
							            radius : '55%',
							            center: ['50%', '60%'],
							            data: array,
							            itemStyle: {
							                emphasis: {
							                    shadowBlur: 10,
							                    shadowOffsetX: 0,
							                    shadowColor: 'rgba(0, 0, 0, 0.5)'
							                }
							            }
							        }
							    ]
							};
	   
	  myChart.setOption(option);//启动动画
			}
			
	
});
	
}



	function selectThumbsByKey(pageNum){
		
		$("#thumbsbody").empty();
		$("#pageul").html("");
		
		var ClassId = $("#ClassId").val();
		var createtime = $("#indate").val();
		var TeacherName = $("#TeacherName").val();
		
		
		console.log(ClassId+":"+createtime+""+TeacherName);
		
		if(ClassId==""&&createtime==""&&TeacherName==""){
			
			swal({ title: '请至少输入一个查询条件', 
			 	  type: "warning",
			 	   showConfirmButton: false
			     });
			
			return;
		}
		
		
		
		$.ajax({

			async:true,
			type:"post",
			url:"getAdminThumbsByKey.do",
			data:{classId:ClassId,createTime:createtime,TeacherName:TeacherName,pageNum:pageNum},
			dataType:"json",
			success:function(json){
				//var tbody = $("#home").children().children();
				//var tbody = place;
				var thumbs;
				$.each(json,function(index,content){
					
					thumbs+="<tr>"
	                            +"<td class='text-center'>"+content.studentName+"</td>"
	                            				   +"<td>"+content.classId+"</td>"
	                            				   +"<td>"+content.teacherName+"</td>"
	                            				   +"<td>"+content.cretetime+"</td>"
			                                       +"<td>"+content.score+"</td>" 
			                                       +"<td class='td-actions'>"
		                                           +"<a href='#' rel='tooltip' onclick='remove("+content.teacherId+")' title='删除点赞信息' class='btn btn-danger btn-simple btn-xs'>"
		                                                   +"<i class='fa fa-times'></i>"
		                                           +"</a>"
		                                           +"</td>"  	
			                                        
	                                    +"</tr>";
				});
				
					avag(ClassId,createtime,TeacherName);
					getCount(ClassId,createtime,TeacherName);
					
				
				
				
				$("#thumbsbody").html(thumbs);
				pageUtil();
		}
			
	});
		
	




		}
	function remove(teacherId){
		
		//删除确认提示
		swal({  title: "确定要删除该点赞信息吗？",
		    text: "删除点赞信息后无法恢复",
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
	        		url:"deleteThumbsByPK.do",
	        		data:{teacherId:teacherId},
	        		dataType:"json",
	        		success:function(data){
	        	
	        			if(data=="018"){
	        				
	        				swal("删除成功", "", "success");
	        				selectThumbsByKey(pageinitNum);
	        			}
	        			if(data=="019"){
	        				
	        				swal("删除失败", "", "error");	
	        				selectThumbsByKey(pageinitNum);
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
		
			<jsp:param value="thumbs" name="pages"/>
		
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
					<a class="navbar-brand" href="#">点赞信息管理</a>
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
								<div class="content">
									<form class="form-horizontal">
										<div class="form-group">
											<label class="col-md-3 control-label">输入班号</label>
											
											<div class="col-md-4">
												<input type="text" id="ClassId"
													placeholder="请输入班号" class="form-control">
											</div>

											

										</div>
											<div class="form-group">
											<label class="col-md-3 control-label">班主任姓名</label>
											
											<div class="col-md-4">
												<input type="text" id="TeacherName"
													placeholder="请输入班主任姓名" class="form-control">
											</div>
											
											<div class="col-md-1">
												<button type="button" onclick="selectThumbsByKey()"
													class="btn btn-fill btn-info">查询</button>
											</div>
											</div>
											<div class="form-group">
											<label class="col-md-3 control-label">月份</label>
											
											<div class="col-md-4">
												<input type="text" id="indate" readonly="readonly"
													placeholder="请输入月份" class="form-control">
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
                                <h4 class="title">点赞数据图表与点赞平均分</h4>
                            </div>
                            
                            <div class="content" style="height: 400px;">
                            <div class="col-md-8" id="echarts" style="height:300px;"> </div>
                            <div class="col-md-4" id="avag"></div>
                            </div>
                           
                        
                        </div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">

						<div class="card">
							<div class="header">
								<h4 class="title">点赞信息</h4>
								<p class="category">以下为点赞信息表格</p>
							</div>
							<div class="content table-responsive table-full-width">
								<table class="table">
									<thead>
										<tr>
											<th class="text-center">学生姓名</th>
											<th>班号</th>
											<th>班主任</th>
											<th>点赞时间</th>
											<th>点赞分数</th>
											<th>操作</th>
										
										</tr>
									</thead>
									<tbody id="thumbsbody">

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
<script>
//jeDate.skin('gray');
jeDate({
	dateCell:"#indate",//isinitVal:true,
	format:"YYYY-MM",
	isTime:false, //isClear:false,
	minDate:"2015-10-19 00:00:00",
	maxDate:"2016-11-8 00:00:00"
})
jeDate({
	dateCell:"#dateinfo",
	format:"YYYY年MM月DD日 hh:mm:ss",
	isinitVal:true,
	isTime:true, //isClear:false,
	minDate:"2014-09-19 00:00:00",
	okfun:function(val){alert(val)}
})
</script>
										

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
