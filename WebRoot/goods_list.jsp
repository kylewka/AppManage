<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@include file="defaultHeader.jsp"%>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="css/easyui.css">
<link rel="stylesheet" type="text/css" href="css/easyUi/icon.css">
<link rel="stylesheet" type="text/css" href="css/color.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
    <style> 
        .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 15%; 
            left: 33%; 
            width: 32%; 
            height: 60%; 
            padding: 20px; 
            border: 10px solid orange; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style> 
<body style="width: 100%;height: 100%">
	<table id="dg" title="Download系统工具" class="easyui-datagrid" style="width:100%;height:500px"
            url="getGoodsList"
            toolbar="#toolbar" pagination="false"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="id" width="9%">版本号</th>
                <th field="location" width="9%">文件类型</th>
                <th field="name" width="13%">文件名称</th>
                <th field="size" width="9%">文件大小</th>
                <th field="url" width="60%">下载链接</th>                
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <button class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newGoods()">添加</button>
        <button class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editGoods()">编辑</button>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delGoods()">删除</a>        
    	<a href="javascript:void(0)" class="easyui-linkbutton"  plain="true" >文件类型</a>
		<select id="dd" class="easyui-combobox" name="location" style="width:100px;" data-options="required:true" onchange="selectLocation()">
			<option selected="selected">全部</option>	
			<option value="应用程序">应用程序</option>
			<option value="开发人员工具">开发人员工具</option>
			<option value="操作系统">操作系统</option>
			<option value="服务器">服务器</option>
		</select>
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="select()">查询</a>
    </div>
	<div class="nodata none"></div>
	<div class="common_page" id="pageBox"></div>		

	<div id="dlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
			<div style="margin-bottom:10px">
                <input name="id" class="easyui-textbox"  label="版本号:" required="required" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
            	 <input name="location" class="easyui-textbox"  label="文件类型:" required="required" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="name" class="easyui-textbox"  label="文件名称:" required="required" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="size" class="easyui-textbox"  label="文件大小:" required="required" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="url" class="easyui-textbox"  label="url:" required="required" style="width:100%">
            </div>           
            
        </form>
    </div>
     <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6"  onclick="saveGoods()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
    <body> 
        <p style="font-size:15px;margin-left:5px;color:black">声明：<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">请点这里</a></p> 
        <div id="light" class="white_content"><span>声明：本站资源均来自于官方原版，ed2k可视为P2P下载链接。由于网络环境和下载工具的不确定性，本站不保证所有人都可以下载成功，如果失败可以更换网络或者下载工具重复尝试。下载完成后务必进行SHA1校验（推荐使用iHasher），与网站核对一致后再使用。所有操作系统默认均为试用版，如有正版密钥可以有效激活，本站不提供任何激活和相关服务。请在下载完成后再考虑自愿为本站打赏或捐助，下载速度与捐助无关。</span> 
              <br>
              <img  src="images/home_logo.png" />
              <br>
              <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">点这里关闭本窗口</a></div>        
        <div id="fade" class="black_overlay"></div> 
              <span style="font-size:15px;margin-left:5px;color:black">推荐工具</span><br> 
              <p style="font-size:10px;margin-left:5px">百度<a href="https://www.baidu.com" target="_blank">https://www.baidu.com/</a></p> 
              <p style="font-size:10px;margin-left:5px">迅雷<a href="https://dl.xunlei.com" target="_blank">https://dl.xunlei.com/</a></p>
              <p style="font-size:10px;margin-left:5px">电驴<a href="http://www.easymule.com/zh-cn/" target="_blank">http://www.easymule.com/zh-cn/</a></p> 
              <p style="font-size:10px;margin-left:5px">FDM<a href="https://www.freedownloadmanager.org" target="_blank">https://www.freedownloadmanager.org</a></p>
              <p style="font-size:10px;margin-left:5px">IDM<a href="http://www.internetdownloadmanager.com/" target="_blank">http://www.internetdownloadmanager.com/</a></p> 
              <br></br>
              <p style="font-size:10px;margin-left:5px">网站文件内容来自<a href="https://msdn.itellyou.cn/" target="_blank">https://msdn.itellyou.cn/</a></p> 
              
    </body>

	<script>
	
	
	function newGoods(){
		  $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加文件信息');
          $('#fm').form('clear');
          url = "addGoods";
	}
	function saveGoods(){
		
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
           		$('#dlg').dialog('close');        // close the dialog
            	$('#dg').datagrid('reload');    // reload the user data
            }
        });
    }
	function editGoods(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','更改宿舍信息？');
            $('#fm').form('load',row);
            url = "updateGoods?id="+row.id;
        }
    }
	
	function delGoods(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('确认','确定删除吗',function(r){
                if (r){
                    $.post("delGoods",{id:row.id},function(result){
                        if (result.success){
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    },'json');
                }
            });
        }
    }
	
	function selectlocation(){
		var cat = $('#cc option:selected').text();
		if(cat == '全部'){
			cat = '';
		}
		$('#dg').datagrid('options').queryParams ={location:cat}
		$('#dg').datagrid('reload');	
	}
	

	function select(){
	var f=$("#dd").val();
	console.log(f);
	if(f!="全部")
		{
	$.ajax({
    type: "post",
    url: "selectfloor",
    data: {floor:f},
    dataType: "json",
    success: function(result){
    $('#dg').datagrid('loadData',result);
    }
});}
	else{
		$.ajax({
		    type: "post",
		    url: "getGoodsList",
		    data: {},
		    dataType: "json",
		    success: function(result){
		    $('#dg').datagrid('loadData',result);
		    }
		});
	}
	}
	</script>
</body>
</html>