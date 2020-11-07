/**
 /**
 * Created by Yyz on 2018/1/29.
 */
//页面自适应
//lay 插件创建
var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,laypage = layui.laypage;

//上下分层页面自适应
function resizeBody(){
	
}

$(document).ready(function(){
	resizeBody();
})

window.onresize=function(){
	resizeBody();
}



//获取链接参数
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null&&r!="undefined") return unescape(r[2]); return null;
}

//获取当前时间。格式为yyyy-MM-dd hh:mm:ss
function getNowFormatDate(type) {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var hour=date.getHours()
    var Minutes=date.getMinutes()
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    var currentdate1=date.getFullYear() + seperator1 + month + seperator1 + strDate
    var currentdate2=date.getFullYear() + seperator1 + month
    var currentdate3=date.getFullYear() + seperator1 + month + seperator1 + strDate+" "+hour+seperator1+Minutes
    return type=="date"?currentdate1:"month"?currentdate2:"datetime"?currentdate3:currentdate;
}

//判断是否有值并返回
function isEmpty(val){
    if ((val==null || typeof(val)=="undefined"|| val=="undefined"|| val=="null")|| (typeof(val)=="string"&&val==""&&val!="undefined"&&val!="null")){
        return "-";
    }else{
        return val;
    }
}

//计算时间差
function formatDuring(mss) {
    var days = parseInt(mss / (1000 * 60 * 60 * 24));
    var hours = parseInt((mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = parseInt((mss % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = (mss % (1000 * 60)) / 1000;
    if(days==0){
        if(hours==0){
            if(minutes==0){
                if(seconds==0){
                    return "暂无"
                }else{
                    return seconds + "秒";
                }
            }else{
                return minutes + "分钟" + seconds + "秒";
            }
        }else{
            return hours + "小时" + minutes + "分钟" + seconds + "秒";
        }
    }else{
        return days + "天" + hours + "小时" + minutes + "分钟" + seconds + "秒";
    }
}


//截取时间段
function subTime(type,date){
    if(type=="year"){
        return date.substring(0,10)
    }else if(type=="month"){
        return date.substring(5,10)
    }else if(type=="hours"){
        return date.substring(11)
    }else if(type=="datetime"){
        return date.substring(0,16)
    }
}


//ajax请求
function ajax_(url,data,callback,async){
    data=data?data:""
    $.ajax({
        type: "post",
        url: _ctx+url,
        data:data,
        async: async,
        dataType:'json',
        success: function(result){
                callback(result);
        },
        error: function(error){

        }
    })
}


///补0函数
function toDou(num){
	if(num<10){
		return "0"+num;
	}else{
		return num;
	}
}

//加载分页函数
function loadPage(url,data,callback,rowsnum){
	//url  数据请求链接
	//data 数据求情参数
	//callback  回调函数
	//rowsnum   每页限制
	data=data?data:"";
	rowsnum=rowsnum?rowsnum:12
	    $.ajax({
	        type: "post",
	        url: _ctx+url,
	        data:data,
	        dataType:'json',
	        success: function(result){
	        	$("#pageBox").empty();
	    		if(result.total>0){
	    			laypage.render({
	    			    elem: 'pageBox' //注意，这里的 test1 是 ID，不用加 # 号
	    			    ,count: result.total //数据总数，从服务端得到
	    			    ,theme: '#0275d8'
	    			    ,limit:rowsnum
	    		    	,jump: function(obj, first){
	    		    		callback(obj.curr,obj.limit);
	    		    	    
	    		    	  }
	    			  });
	    		}else{
	    			$(".goodsOLList").empty();
	    		}
	        },
	        error: function(error){

	        }
	    })
}

//列表选择带回通用方法

function currencySelect(json){
    top.selectColumns=json.columns;
    top.selectUrl=json.url;
    top.selectNames=json.selectNames.val();
    top.selectIds=json.selectIds.val();
    top.checkField=json.checkField;
    top.checkName=json.checkName;
    top.selectSingle=json.single;
    top.queryParams=json.queryParams;
    
    top.layer.open({
        type: 2 //此处以iframe举例
        ,title: '选择'
        ,area: ['700px', '600px']
        ,shadeClose: false //点击遮罩关闭
        ,maxmin: true
        ,content: _ctx+'/a/storage/ygkjInventory/selectReturn'
        ,name:'user'
        ,btn: ['确定', '关闭'],
        yes: function(index, layero){
            var iframeWin = layero.find('iframe')[0].contentWindow; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
            
            json.selectNames.val(iframeWin.returnUserName())
            json.selectIds.val(iframeWin.returnUserId())
            //回调函数
            if(json.single){
            	json.callback&&json.callback(iframeWin.returnRow())    //回调函数，参数为选中的该条数据，只适用于单选
            }else{
            	json.callback&&json.callback()   //通用回调函数，不带数据
            }
            top.layer.close(index);//关闭对话框。
        },
        cancel: function(index){
        }
    })
}

//加载bootstrap 表格函数
function loadTable(name,url,columns,json){
	//name  列表容器名称 id
	//url  数据请求链接
	//columns  列表加载内容
	//json  其他列表设置
    $("#"+name).bootstrapTable({
        url:_ctx+url,
        dataType:'json',
        method: 'get',      
        striped: false,     //隔行变色 
        showExport: false,
        exportDataType: "all",
        pagination: true,     
        sortable: true,      
        sortOrder: "asc",     
        queryParams:json?(json.queryParams?json.queryParams:queryParams):queryParams,		//请求参数
        sidePagination: "server",   
        pageNumber:1,      
        pageSize: 10,      
        pageList: [10, 25, 50, 100],  
        search:false,    
        searchOnEnterKey:true,
        strictSearch: false,
        showHeader:true,
        showColumns: false,     
        showRefresh: false,     
        minimumCountColumns: 2,    
        showToggle:false,     
        cardView: false,     
        clickToSelect:true, 
        singleSelect:json&&json.singleSelect,//单选多选
        columns:columns,
        onLoadSuccess: function(data){//加载成功函数
            /*if(data.rows&&data.rows.length==0){
                $('.no-records-found>td').html("<div class='center fff'><img style='width:250px' src='/images/no-data.png' alt=''/></div>")
            }*/
            json&&json.onLoadSuccess&&json.onLoadSuccess(data);//加载成功函数回调
        },
        onClickRow:json&&json.onClickRow,//行点击事件
        onLoadError: function(data){  //
        }

    });
}

function queryParams(params){
    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        rows: params.limit,   //页面大小
        page: params.offset/params.limit+1
    };
    return temp;
}

function mapSelect(lngName,latName){
	//lngName   经度input  id名  
	//latName   纬度input  id名 
	top.layer.open({
        type: 2 //此处以iframe举例
        ,title: '选择'
        ,area: ['700px', '600px']
        ,shadeClose: false //点击遮罩关闭
        ,maxmin: true
        ,content: _ctx+'/a/sys/map/returnlal?lng='+$('#'+lngName).val()+"&lat="+$('#'+latName).val()
        ,name:'user'
        ,btn: ['确定', '关闭'],
        yes: function(index, layero){
            var iframeWin = layero.find('iframe')[0].contentWindow; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
            $('#'+lngName).val(top.tLng);
            $('#'+latName).val(top.tLat);
            top.layer.close(index);//关闭对话框。
        },
        cancel: function(index){
        }
    })
}

////////////////////////////////////表格数据显示//////////////////////////////////////////////////
function DatagridSet(obj, dataCount) {
    var p = obj.datagrid('getPager');
    if(p.data("pagination")){
        var pagesize = p.data("pagination").options.pageSize;
        $(p).pagination({
            pageList: [10,15,20,50,100],
            showPageList:true,
            links: 5,
            pageSize: pagesize,//每页显示的记录条数，默认为10
            layout: ['list','sep','first', 'prev', 'links', 'next', 'last'],
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条   共 {total} 条'
        });
	}

//    var pagesize = obj.datagrid('getPager').data("pagination").options.pageSize;
    var datagrid = obj.closest(".datagrid");
    var view = datagrid.find(".datagrid-view");
    if (dataCount == 0) {
        if (datagrid.find(".nodata-box").length == 0)
            view.after("<div class='nodata-box'><p class='nodata'></p></div>");
    }
    else {
        datagrid.find(".nodata-box").remove();
    }
    if (dataCount <= pagesize) {
        datagrid.find(".datagrid-pager table").hide();
        $(".datagrid-pager.pagination .pagination-info").css("top","0px")
    }
    else {
        datagrid.find(".datagrid-pager table").show();
        $(".datagrid-pager.pagination .pagination-info").css("top","5px")
    }
    datagrid.find(".ico_noread").parents(".datagrid-row").addClass('bold');
    setTimeout(function () { obj.datagrid("resize", function () { }); }, 50);
}
$(document).ready(function(){
	$(".datagrid-header-check").append("<b onclick='$(this).siblings(\"input\").click()' style=\"font-size:12px\">全选</b>");
});
