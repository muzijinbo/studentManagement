<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生成绩管理系统</title>
    <link href="css/index.css" rel="stylesheet" />
    <link href="css/themes/default/easyui.css" rel="stylesheet" />
    <link href="css/themes/icon.css" rel="stylesheet" />
    <link href="css/demo.css" rel="stylesheet" />
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <script src="scripts/jquery.easyui.min.js"></script>
    <script>
        $(function () {
        	
            bindEvent();
        });
        function bindEvent() {
            $(".btn_menu").click(function () {
                var title = $(this).text();
                var url = $(this).attr("url");
                var isSelect = $("#container").tabs('exists', title);
                if (isSelect) {
                    $("#container").tabs('select', title);
                    return;
                }
                $("#container").tabs('add', {
                    title: title,
                    content: CreateContent(url),
                    closable: true
                });
            });
        }

        function CreateContent(url) {
        	alert(url);
            var strHtml = '<iframe src="' + url + '" scrolling="yes" frameborder="0" fit="true" style="height:100%;width:100%;"></iframe>';
            return strHtml;
        }
    </script>    
</head>
<body>
		
    <div id="layout_div" class="easyui-layout" >
    
        <div data-options="region:'north',border:false" style="overflow:hidden; height:70px;background:#338FCC;padding:10px;padding-left:30px;">
            <div style="float:left; height:70px;">
                <img src="images/logo_1.png" height="60" style="margin-top:-10px;" />
            </div>
            <div style="color:#fff  ;font-size:3em; float:left;margin-left:30px;">
              	学生成绩管理系统
            </div>
            <div style="float:right;height:70px; margin-right:50px;">
                <span>您好，User！</span>
                <span><a href="#">注销</a></span>
            </div>
        </div>
        <div data-options="region:'west',split:false,title:'菜单',collapsible:false" style="width:170px;">
            <div id="menu" class="easyui-accordion" fit="true">
                <!-- a标签url属性中填写（/控制器名称/视图名称） -->
                <div    title="班级部分" data-options="iconCls:'icon-print'" style="display: none overflow:auto;padding:10px;">
                    <ul class="easyui-tree">
                    	<li><a href="javascript:;" class="btn_menu" url="views/listBanji.jsp">班级管理</a></li>	
                    </ul>
                </div>
                <div    title="课程部分" data-options="iconCls:'icon-print'" style="display: none overflow:auto;padding:10px;">
                    <ul class="easyui-tree">
                    	<li><a href="javascript:;" class="btn_menu" url="views/listCourse.jsp">课程管理</a></li>	
                    </ul>
                </div>
                <div    title="成绩部分" data-options="iconCls:'icon-print'" style="display: none overflow:auto;padding:10px;">
                    <ul class="easyui-tree">
                    	<li><a href="javascript:;" class="btn_menu" url="views/listScore.jsp">成绩管理</a></li>	
                    </ul>
                </div>
                <div    title="学生部分" data-options="iconCls:'icon-print'" style="display: none overflow:auto;padding:10px;">
                    <ul class="easyui-tree">
                    	<li><a href="javascript:;" class="btn_menu" url="views/listStudent.jsp">学生管理</a></li>	
                    </ul>
                </div>
              
            </div>
        </div>
        <div data-options="region:'south',border:false" style="height:50px; font-size:15px; color:#fff; background:#338FCC;padding:10px; text-align:center">
          	 学生成绩录入管理系统 &nbsp;&nbsp;&nbsp;   欢迎您的使用！！
        </div>
        <div data-options="region:'center'" style="overflow:hidden ">
            <div class="easyui-tabs" fit="true" id="container"  >
                <div title="主页" style="padding:10px">
                    欢迎使用
                    <!--<iframe src="/list.html" scrolling="no" frameborder="0" height="1000" width="1100" style="overflow:hidden; margin-bottom:10px;"></iframe>-->
                </div>
            </div>
        </div>
    </div>
</body>

</html>
