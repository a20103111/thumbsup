<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />

<!--  Light Bootstrap Dashboard core CSS    -->
<link href="<%=basePath%>css/light-bootstrap-dashboard.css"
	rel="stylesheet" />
<link href="<%=basePath%>time/css/lq.datetimepick.css" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="<%=basePath%>css/demo.css" rel="stylesheet" />


<!--     Fonts and icons     -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
<link href='<%=basePath%>css/685fd913f1e14aebad0cc9d3713ee469.css'
	rel='stylesheet' type='text/css'>
<link href="<%=basePath%>css/pe-icon-7-stroke.css" rel="stylesheet" />
<link
	href="<%=basePath%>bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css">
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
<script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>


<!--  Forms Validations Plugin -->
<script src="<%=basePath%>js/jquery.validate.min.js"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="<%=basePath%>js/moment.min.js"></script>

<!--  Date Time Picker Plugin is included in this js file -->

<script src="<%=basePath%>time/js/selectUi.js"></script>
<script src="<%=basePath%>time/js/lq.datetimepick.js"></script>


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




</head>
<body>
	<div class="wrapper">


		<div class="main-panel">



			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">

							<div class="card">
								<div class="header">修改班级信息</div>
								<div class="content">
									<form class="form-horizontal" action="updateSingeClassByPK.do"
										target="_parent" method="post">
										<div class="form-group">
											<label class="col-md-3 control-label">班号</label>
											<div class="col-md-9">
												<input type="text" name="classId" readonly="readonly"
													value=" ${classes.tclass.classId}" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">班名</label>
											<div class="col-md-9">
												<input type="text" name="className" required="required"
													value=" ${classes.tclass.className}" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">开班时间</label>
											<div class="col-md-9">
												<input type="text" name="classCreatetime" id="createtime"
													required="required"
													value="${classes.tclass.classCreatetime}"
													class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-3 control-label">结课时间</label>
											<div class="col-md-9">
												<input type="text" name="classEndtime" id="endtime" required="required"
													value="${classes.tclass.classEndtime}" class="form-control">
											</div>
										</div>

											<div class="form-group">
											<label class="col-md-3 control-label">结课时间</label>
											<div class="col-md-9">
													<select name="classType" class="selectpicker" data-title="Single Select" data-style="btn-default btn-block" data-menu-style="dropdown-blue" tabindex="-98"><option class="bs-title-option" value="">班级类型</option>
                                                <option value="1">正常班</option>
                                               	<option value="2">快班</option>
                                               	<option value="3">普通班</option>
                                               	
                                               	
                                            </select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-3"></label>
											<div class="col-md-9">
												<button type="submit" class="btn btn-fill btn-info">修改</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- end card -->

						</div>


					</div>
				</div>
			</div>




		</div>
	</div>



	<script type="text/javascript">
		$().ready(function() {

			// Init Sliders
			demo.initFormExtendedSliders();

			// Init DatetimePicker
			demo.initFormExtendedDatetimepickers();
		});
	</script>
	<script>
		$("#createtime").on("click", function(e) {
			e.stopPropagation();
			$(this).lqdatetimepicker({
				css : 'datetime-day',
				dateType : 'D',
				selectback : function() {

				}
			});

		});

		$("#endtime").on("click", function(e) {
			e.stopPropagation();
			$(this).lqdatetimepicker({
				css : 'datetime-day',
				dateType : 'D',
				selectback : function() {

				}
			});

		});
	</script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-46172202-1', 'auto');
		ga('send', 'pageview');
	</script>
</body>
</html>