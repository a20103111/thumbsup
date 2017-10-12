<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
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
	<link rel="icon" type="image/png" href="../../assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>班级数据</title>

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
    <div class="sidebar" data-color="orange" data-image="../../assets/img/full-screen-image-3.jpg">
        <!--

            Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
            Tip 2: you can also add an image using data-image tag

        -->

        <div class="logo">
            <a href=""#" class="logo-text">
                Creative Tim
            </a>
        </div>
		<div class="logo logo-mini">
			<a href=""#" class="logo-text">
				Ct
			</a>
		</div>

    	<div class="sidebar-wrapper">

            <div class="user">
                <div class="photo">
                    <img src="../picture/default-avatar.png" />
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                        Tania Andrew
                        <b class="caret"></b>
                    </a>
                    <div class="collapse" id="collapseExample">
                        <ul class="nav">
                            <li><a href="#">My Profile</a></li>
                            <li><a href="#">Edit Profile</a></li>
                            <li><a href="#">Settings</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <ul class="nav">
                <li>
                    <a href="../dashboard.html">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a data-toggle="collapse" href="#componentsExamples">
                        <i class="pe-7s-plugin"></i>
                        <p>Components
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="componentsExamples">
                        <ul class="nav">
                            <li><a href="../components/buttons.html">Buttons</a></li>
                            <li><a href="../components/grid.html">Grid System</a></li>
                            <li><a href="../components/icons.html">Icons</a></li>
                            <li><a href="../components/notifications.html">Notifications</a></li>
                            <li><a href="../components/panels.html">Panels</a></li>
                            <li><a href="../components/sweet-alert.html">Sweet Alert</a></li>
                            <li><a href="../components/typography.html">Typography</a></li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#formsExamples">
                        <i class="pe-7s-note2"></i>
                        <p>Forms
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="formsExamples">
                        <ul class="nav">
                            <li><a href="../forms/regular.html">Regular Forms</a></li>
                            <li><a href="../forms/extended.html">Extended Forms</a></li>
                            <li><a href="../forms/validation.html">Validation Forms</a></li>
                            <li><a href="../forms/wizard.html">Wizard</a></li>
                        </ul>
                    </div>
                </li>

                <li class="active">
                    <a data-toggle="collapse" href="#tablesExamples" aria-expanded="true">
                        <i class="pe-7s-news-paper"></i>
                        <p>Tables
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse in" id="tablesExamples">
                        <ul class="nav">
                            <li><a href="regular.html">Regular Tables</a></li>
                            <li class="active"><a href="extended.html">Extended Tables</a></li>
                            <li><a href="bootstrap-table.html">Bootstrap Table</a></li>
							<li><a href="datatables.net.html">DataTables.net</a></li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#mapsExamples">
                        <i class="pe-7s-map-marker"></i>
                        <p>Maps
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="mapsExamples">
                        <ul class="nav">
                            <li><a href="../maps/google.html">Google Maps</a></li>
                            <li><a href="../maps/vector.html">Vector Maps</a></li>
                            <li><a href="../maps/fullscreen.html">Full Screen Map</a></li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="../charts.html">
                        <i class="pe-7s-graph1"></i>
                        <p>Charts</p>
                    </a>
                </li>

                <li>
                    <a href="../calendar.html">
                        <i class="pe-7s-date"></i>
                        <p>Calendar</p>
                    </a>
                </li>

                <li>
                    <a data-toggle="collapse" href="#pagesExamples">
                        <i class="pe-7s-gift"></i>
                        <p>Pages
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="pagesExamples">
                        <ul class="nav">
                            <li><a href="../pages/login.html">Login Page</a></li>
                            <li><a href="../pages/register.html">Register Page</a></li>
                            <li><a href="../pages/lock.html">Lock Screen Page</a></li>
                            <li><a href="../pages/user.html">User Page</a></li>
                            <li><a href="#">More coming soon...</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
    	</div>
    </div>

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
                    <a class="navbar-brand" href="#">Extended Tables</a>
                </div>
                <div class="collapse navbar-collapse">

                    <form class="navbar-form navbar-left navbar-search-form" role="search">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" value="" class="form-control" placeholder="Search...">
                        </div>
                    </form>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="../charts.html">
                                <i class="fa fa-line-chart"></i>
                                <p>Stats</p>
                            </a>
                        </li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-gavel"></i>
                                <p class="hidden-md hidden-lg">
                                    Actions
                                    <b class="caret"></b>
                                </p>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Create New Post</a></li>
                                <li><a href="#">Manage Something</a></li>
                                <li><a href="#">Do Nothing</a></li>
                                <li><a href="#">Submit to live</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Another Action</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <span class="notification">5</span>
                                <p class="hidden-md hidden-lg">
    								Notifications
    								<b class="caret"></b>
    							</p>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                            </ul>
                        </li>

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
                                    <a href="#">
                                        <i class="pe-7s-mail"></i> Messages
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="pe-7s-help1"></i> Help Center
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="pe-7s-tools"></i> Settings
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <i class="pe-7s-lock"></i> Lock Screen
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="text-danger">
                                        <i class="pe-7s-close-circle"></i>
                                        Log out
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

                            

                            <div class="bootstrap-table"><div class="fixed-table-toolbar"><div class="bars pull-left"><div class="toolbar">
                                <!--        Here you can write extra buttons/actions for the toolbar              -->
                            </div></div><div class="columns columns-right pull-right"><button class="btn btn-default" type="button" name="refresh" title="Refresh"><i class="glyphicon fa fa-refresh"></i></button><button class="btn btn-default" type="button" name="toggle" title="Toggle"><i class="glyphicon fa fa-th-list"></i></button><div class="keep-open btn-group" title="Columns"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="glyphicon fa fa-columns"></i> <span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><label><input type="checkbox" data-field="id" value="1" checked="checked"> ID</label></li><li><label><input type="checkbox" data-field="name" value="2" checked="checked"> Name</label></li><li><label><input type="checkbox" data-field="salary" value="3" checked="checked"> Salary</label></li><li><label><input type="checkbox" data-field="country" value="4" checked="checked"> Country</label></li><li><label><input type="checkbox" data-field="city" value="5" checked="checked"> City</label></li><li><label><input type="checkbox" data-field="actions" value="6" checked="checked"> Actions</label></li></ul></div></div><div class="pull-left search"><input class="form-control" type="text" placeholder="Search"></div></div><div class="fixed-table-container" style="padding-bottom: 0px;"><div class="fixed-table-header" style="display: none;"><table></table></div><div class="fixed-table-body"><div class="fixed-table-loading" style="top: 41px;">Loading, please wait...</div><table id="bootstrap-table" class="table table-hover" style="margin-top: 0px;">
                                <thead style="display: table-header-group;"><tr><th class="bs-checkbox " style="width: 36px; " data-field="state"><div class="th-inner "><input name="btSelectAll" type="checkbox"></div><div class="fht-cell"></div></th><th class="text-center" style="" data-field="id"><div class="th-inner ">ID</div><div class="fht-cell"></div></th><th style="" data-field="name"><div class="th-inner sortable both">Name</div><div class="fht-cell"></div></th><th style="" data-field="salary"><div class="th-inner sortable both asc">Salary</div><div class="fht-cell"></div></th><th style="" data-field="country"><div class="th-inner sortable both">Country</div><div class="fht-cell"></div></th><th style="" data-field="city"><div class="th-inner ">City</div><div class="fht-cell"></div></th><th class="td-actions text-right" style="" data-field="actions"><div class="th-inner ">Actions</div><div class="fht-cell"></div></th></tr></thead>
                                <tbody><tr data-index="0"><td class="bs-checkbox"><input data-index="0" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">18</td><td style="">Boris Horton</td><td style="">$35,094</td><td style="">Laos</td><td style="">Saint-Mard</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="1"><td class="bs-checkbox"><input data-index="1" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">1</td><td style="">Dakota Rice</td><td style="">$36,738</td><td style="">Niger</td><td style="">Oud-Turnhout</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="2"><td class="bs-checkbox"><input data-index="2" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">4</td><td style="">Philip Chaney</td><td style="">$38,735</td><td style="">Korea, South</td><td style="">Overland Park</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="3"><td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">11</td><td style="">Chaim Saunders</td><td style="">$5,502</td><td style="">Romania</td><td style="">New Quay</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="4"><td class="bs-checkbox"><input data-index="4" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">12</td><td style="">Josiah Simon</td><td style="">$50,265</td><td style="">Christmas Island</td><td style="">Sint-Jans-Molenbeek</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="5"><td class="bs-checkbox"><input data-index="5" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">3</td><td style="">Sage Rodriguez</td><td style="">$56,142</td><td style="">Netherlands</td><td style="">Baileux</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="6"><td class="bs-checkbox"><input data-index="6" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">9</td><td style="">Illana Nelson</td><td style="">$56,142</td><td style="">Heard Island</td><td style="">Montone</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="7"><td class="bs-checkbox"><input data-index="7" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">14</td><td style="">Shana Mejia</td><td style="">$58,566</td><td style="">Afghanistan</td><td style="">Ballarat</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="8"><td class="bs-checkbox"><input data-index="8" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">5</td><td style="">Doris Greene</td><td style="">$63,542</td><td style="">Malawi</td><td style="">Feldkirchen in Kärnten</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="9"><td class="bs-checkbox"><input data-index="9" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">7</td><td style="">Alden Chen</td><td style="">$63,929</td><td style="">Finland</td><td style="">Gary</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="10"><td class="bs-checkbox"><input data-index="10" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">15</td><td style="">Lana Ryan</td><td style="">$64,151</td><td style="">Martinique</td><td style="">Portobuffolè</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="11"><td class="bs-checkbox"><input data-index="11" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">19</td><td style="">Winifred Ryan</td><td style="">$64,436</td><td style="">Ireland</td><td style="">Ronciglione</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="12"><td class="bs-checkbox"><input data-index="12" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">13</td><td style="">Ila Poole</td><td style="">$67,413</td><td style="">Montenegro</td><td style="">Pontevedra</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="13"><td class="bs-checkbox"><input data-index="13" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">6</td><td style="">Mason Porter</td><td style="">$78,615</td><td style="">Chile</td><td style="">Gloucester</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="14"><td class="bs-checkbox"><input data-index="14" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">17</td><td style="">Connor Wagner</td><td style="">$86,537</td><td style="">Germany</td><td style="">Solihull</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="15"><td class="bs-checkbox"><input data-index="15" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">16</td><td style="">Daquan Bender</td><td style="">$91,906</td><td style="">Sao Tome and Principe</td><td style="">Walhain-Saint-Paul</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="16"><td class="bs-checkbox"><input data-index="16" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">10</td><td style="">Nicole Lane</td><td style="">$93,148</td><td style="">Cayman Islands</td><td style="">Cottbus</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr><tr data-index="17"><td class="bs-checkbox"><input data-index="17" name="btSelectItem" type="checkbox"></td><td class="text-center" style="">8</td><td style="">Colton Hodges</td><td style="">$93,961</td><td style="">Nicaragua</td><td style="">Delft</td><td class="td-actions text-right" style=""><a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)"><i class="fa fa-image"></i></a><a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)"><i class="fa fa-edit"></i></a><a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)"><i class="fa fa-remove"></i></a></td></tr></tbody>
                            </table></div><div class="fixed-table-footer" style="display: none;"><table><tbody><tr></tr></tbody></table></div><div class="fixed-table-pagination"><div class="pull-left pagination-detail"><span class="pagination-info"></span><span class="page-list"><span class="btn-group dropup"><button type="button" class="btn btn-default  dropdown-toggle" data-toggle="dropdown"><span class="page-size">25</span> <span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><a href="javascript:void(0)">8</a></li><li><a href="javascript:void(0)">10</a></li><li class="active"><a href="javascript:void(0)">25</a></li></ul></span> rows visible</span></div><div class="pull-right pagination" style="display: none;"><ul class="pagination"><li class="page-first disabled"><a href="javascript:void(0)">«</a></li><li class="page-pre disabled"><a href="javascript:void(0)">‹</a></li><li class="page-number active"><a href="javascript:void(0)">1</a></li><li class="page-next disabled"><a href="javascript:void(0)">›</a></li><li class="page-last disabled"><a href="javascript:void(0)">»</a></li></ul></div></div></div></div><div class="clearfix"></div>
                        </div><!--  end card  -->
                    </div> <!-- end col-md-12 -->
                </div> <!-- end row -->

            </div>
        </div>

        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Company
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Portfolio
                            </a>
                        </li>
                        <li>
                            <a href="#">
                               Blog
                            </a>
                        </li>
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; 2016 <a href=""#">Creative Tim</a>, made with love for a better web
                </p>
            </div>
        </footer>


    </div>
</div>



<div class="fixed-plugin">
    <div class="dropdown">
        <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
        </a>
        <ul class="dropdown-menu">
            <li class="header-title">Configuration</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Sidebar Image</p>
                    <div class="switch switch-sidebar-image"
                        data-on-label="ON"
                        data-off-label="OFF">
                        <input type="checkbox" checked/>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
			<li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Sidebar Mini</p>
                    <div class="switch  switch-sidebar-mini"
                        data-on-label="ON"
                        data-off-label="OFF">
                        <input type="checkbox"/>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
			<li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Fixed Navbar</p>
                    <div class="switch  switch-navbar-fixed"
                        data-on-label="ON"
                        data-off-label="OFF">
                        <input type="checkbox"/>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Filters</p>
                    <div class="pull-right">
                        <span class="badge filter" data-color="black"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-orange active" data-color="orange"></span>
                        <span class="badge filter badge-red" data-color="red"></span>
                        <span class="badge filter badge-purple" data-color="purple"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">Sidebar Images</li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../picture/full-screen-image-1.jpg">
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../picture/full-screen-image-2.jpg">
                </a>
            </li>
            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../picture/full-screen-image-3.jpg">
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../picture/full-screen-image-4.jpg">
                </a>
            </li>

            <li class="button-container">
                <div class="">
                    <a href="#" target="_blank" class="btn btn-info btn-block">Get Free Demo</a>
                </div>
                <div class="">
                    <a href="#" target="_blank" class="btn btn-info btn-block btn-fill">Buy Now!</a>
                </div>
            </li>

            <li class="header-title">Thank you for 452 shares!</li>

            <li class="button-container">
                <button id="twitter" class="btn btn-social btn-twitter btn-round"><i class="fa fa-twitter"></i> &middot; 182</button>
                <button id="facebook" class="btn btn-social btn-facebook btn-round"><i class="fa fa-facebook-square"> &middot; 270</i></button>
            </li>

        </ul>
    </div>
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


    <script type="text/javascript">
        var $table = $('#bootstrap-table');

        function operateFormatter(value, row, index) {
            return [
                '<a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)">',
                    '<i class="fa fa-image"></i>',
                '</a>',
                '<a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)">',
                    '<i class="fa fa-edit"></i>',
                '</a>',
                '<a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)">',
                    '<i class="fa fa-remove"></i>',
                '</a>'
            ].join('');
        }

        $().ready(function(){
            window.operateEvents = {
                'click .view': function (e, value, row, index) {
                    info = JSON.stringify(row);

                    swal('You click view icon, row: ', info);
                    console.log(info);
                },
                'click .edit': function (e, value, row, index) {
                    info = JSON.stringify(row);

                    swal('You click edit icon, row: ', info);
                    console.log(info);
                },
                'click .remove': function (e, value, row, index) {
                    console.log(row);
                    $table.bootstrapTable('remove', {
                        field: 'id',
                        values: [row.id]
                    });
                }
            };

            $table.bootstrapTable({
                toolbar: ".toolbar",
                clickToSelect: true,
                showRefresh: true,
                search: true,
                showToggle: true,
                showColumns: true,
                pagination: true,
                searchAlign: 'left',
                pageSize: 8,
                clickToSelect: false,
                pageList: [8,10,25,50,100],

                formatShowingRows: function(pageFrom, pageTo, totalRows){
                    //do nothing here, we don't want to show the text "showing x of y from..."
                },
                formatRecordsPerPage: function(pageNumber){
                    return pageNumber + " rows visible";
                },
                icons: {
                    refresh: 'fa fa-refresh',
                    toggle: 'fa fa-th-list',
                    columns: 'fa fa-columns',
                    detailOpen: 'fa fa-plus-circle',
                    detailClose: 'fa fa-minus-circle'
                }
            });

            //activate the tooltips after the data table is initialized
            $('[rel="tooltip"]').tooltip();

            $(window).resize(function () {
                $table.bootstrapTable('resetView');
            });


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
