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

<body style="width: 100%;height: 100%">
	<table id="dg" title="用户信息管理" class="easyui-datagrid" style="width:100%;height:400px"
            url="getUserList"
            toolbar="#toolbar" pagination="false"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="id" hidden="hidden" width="10%">id</th>
                <th field="name" width="50%">用户名</th>
                <th field="pwd" width="50%">密码</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <button class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加</button>
        <button class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</button>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delUser()">删除</a>
    </div>
	<div class="nodata none"></div>
	<div class="common_page" id="pageBox"></div>		

	<div id="dlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">

            <div style="margin-bottom:10px">
                <input name="name" class="easyui-textbox"  label="姓名:" required="required" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="pwd" class="easyui-textbox"  label="密码:" required="required" style="width:100%">
            </div>
        </form>
    </div>
     <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6"  onclick="saveUser()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
	<script>

	function newUser(){
		  $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加用户');
          $('#fm').form('clear');
          url = "addUser";
	}
	function saveUser(){
		
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
	function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','更改用户？');
            $('#fm').form('load',row);
            url = "updateUser?id="+row.id;
        }
    }
	
	function delUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('确认','确定删除吗',function(r){
                if (r){
                    $.post("delUser",{id:row.id},function(result){
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
	</script>
</body>
</html>