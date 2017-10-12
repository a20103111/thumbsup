/**
 * 	班级管理功能使用到的Js
 */

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
	console.log(pageinitNum);
	
	$.ajax({
		
		async:true,
		type:"post",
		url:"getPageSession.do",
		dataType:"json",
		success:function(json){
			var p="";
			pageinitNum=json.pageNum;
			
			if(json.hasPreviousPage==true){
				
				p+="<li ><a onclick='getClasses("+pagePre(json.pageNum)+")' href='#'>«</a></li>";
				
				
			}
			else{
			p+="<li  class='disabled'><a  href='#'>«</a></li>";
			}
			
			console.log(pageinitNum);
			
			for(var i=1;i<=json.pages;i++){
				
				if(i==json.pageNum){
					p+= "<li class='active'>"
						+"<a onclick='getClasses("+i+")' href='#'>"
						+i
						+"</a></li>";
						continue;
				}
					
				p+= "<li>"
					+"<a onclick='getClasses("+i+")' href='#'>"
					+i
					+"</a></li>";
				
			}
			console.log(pageinitNum);
		if(json.hasNextPage==true){
				p+="<li><a onclick='getClasses("+pageNext(json.pageNum)+")' href='#'>»</a></li>";
			}
			else{
				p+="<li class='disabled'><a  href='#'>»</a></li>";
				
			}
			console.log(pageinitNum);
			$("#pageul").html(p);
		}
	});
	
	
	
}
function getClasses(pageInfo){
	
	$.ajax({

		async:true,
		type:"post",
		url:"getAllClass.do",
		data:{pageNum:pageInfo},
		dataType:"json",
		success:function(json){
			//var tbody = $("#home").children().children();
			//var tbody = place;
			var classes;
			$.each(json,function(index,content){
				
				classes+="<tr>"
                            +"<td class='text-center'>"+content.classId+"</td>"
                            				   +"<td>"+content.className+"</td>"
		                                       +"<td>"+content.classNumbers+"</td>"
		                                       +"<td>"+content.classCreatetime+"</td>"
	                                            +"<td class='text-right'>"+content.classEndtime+"</td>"
	                                            +"<td class='text-right'>"+content.typeName+"</td>"
	                                           +"<td class='td-actions text-right'>"
	                                              +"<a id='check' onclick='check("+content.classId+")' href='#' rel='tooltip' title='查看班级' class='btn btn-info btn-simple btn-xs'>"
	                                                   +" <i class='fa fa-user'></i>"
	                                              +"  </a>"
	                                              +" <a href='#' onclick='update("+content.classId+")' rel='tooltip' title='修改班级' class='btn btn-success btn-simple btn-xs'>"
	                                                  +"<i class='fa fa-edit'></i>"
	                                               +"</a>"
	                                              +"<a href='#' rel='tooltip' onclick='remove("+content.classId+")' title='删除班级' class='btn btn-danger btn-simple btn-xs'>"
	                                                   +"<i class='fa fa-times'></i>"
	                                              +"</a>"
	                                           +"</td>"  	
                                    +"</tr>";
			});
			
			$("#classesbody").html(classes);
			pageUtil();	
		
	}
		
});

	
}


//一进入页面执行的方法
getClasses(1);




function selectClass(){
	
	var classid = $("#select").val();
	
	if(classid==""||classid==null){
		//输入框为空查询所有班级
		
		getClasses(1);
		
		
	}
	else{
		
		$.ajax({
			async:true,
			type:"post",
			url:"SingleClassByIdInput.do",
			data:{classId:classid},
			dataType:"json",
			success:function(data){
				var classes;
					classes+="<tr>"
                        +"<td class='text-center'>"+data.tclass.classId+"</td>"
                        				   +"<td>"+data.tclass.className+"</td>"
	                                       +"<td>"+data.tclass.classNumbers+"</td>"
	                                       +"<td>"+data.tclass.classCreatetime+"</td>"
                                            +"<td class='text-right'>"+data.tclass.classEndtime+"</td>"
                                            +"<td class='text-right'>"+data.tclasstype.typeName+"</td>"
                                           +"<td class='td-actions text-right'>"
                                              +"<a id='check' onclick='check("+data.tclass.classId+")' href='#' rel='tooltip' title='查看班级' class='btn btn-info btn-simple btn-xs'>"
                                                   +" <i class='fa fa-user'></i>"
                                              +"  </a>"
                                              +" <a href='#' onclick='update("+data.tclass.classId+")' rel='tooltip' title='修改班级' class='btn btn-success btn-simple btn-xs'>"
                                                  +"<i class='fa fa-edit'></i>"
                                               +"</a>"
                                              +"<a href='#' rel='tooltip' onclick='remove("+data.tclass.classId+")' title='删除班级' class='btn btn-danger btn-simple btn-xs'>"
                                                   +"<i class='fa fa-times'></i>"
                                              +"</a>"
                                           +"</td>"  	
                                +"</tr>";
				
				$("#classesbody").html(classes);
				$("#pageul").html("");
			}
		});
	}
}

//查看班级
function check(classId){

			layer.open({
				  type: 2,
				  title: '查看班级',
				  skin: 'layui-layer-lan',
				  maxmin: true,
				  shadeClose: true, //点击遮罩关闭层
				  area : ['750px' , '490px'],
				  content: 'SingleClassById.do?classId='+classId
				  });
		
	
	
}


//更新班级
function update(classId){

	layer.open({
		  type: 2,
		  title: '查看班级',
		  skin: 'layui-layer-lan',
		  maxmin: true,
		  shadeClose: true, //点击遮罩关闭层
		  area : ['750px' , '620px'],
		  content: 'SingleClassById.do?classId='+classId+'&flag=update'
		  });

}


//删除班级
function remove(classId){
	
	var pageNum=1;

	//删除确认提示
	swal({  title: "确定要删除该班级吗？",
	    text: "删除班级后无法恢复",
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
        		url:"deleteClassByPK.do",
        		data:{classId:classId},
        		dataType:"json",
        		success:function(data){
        	
        			if(data=="003"){
        				
        				swal("删除成功", "", "success");
        				getClasses(pageinitNum);
        			}
        			if(data=="004"){
        				
        				swal("删除失败", "", "error");	
        				getClasses(pageinitNum);
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
		  title: '添加班级',
		  skin: 'layui-layer-lan',
		  maxmin: true,
		  shadeClose: true, //点击遮罩关闭层
		  area : ['750px' , '620px'],
		  content: 'addClass.do'
		  });

}

