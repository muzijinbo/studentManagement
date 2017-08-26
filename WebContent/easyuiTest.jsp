<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>河北重大需求征集系统</title>
    <link href="css/index.css" rel="stylesheet" />
    <link href="css/themes/default/easyui.css" rel="stylesheet" />
    <link href="css/themes/icon.css" rel="stylesheet" />
    <link href="css/demo.css" rel="stylesheet" />
    <script src="scripts/jquery.min.js"></script>
    <script src="scripts/jquery.easyui.min.js"></script>
</head>


<body>
	<div id="lay" class="easyui-layout" style="width:1050px;height:1000px" >
	
		<div region="north" title="用户查询"  style="height:1000px;text-align:center;"  >
		        <form id="sec" >
		        	<table id="conditionTable1" style="margin:auto;">
			           
						<tr>
							<td>	
								<a id="addCondition" class="icon-add" style="display:block;  href="javascript:void(0);">+</a>
							</td>
							<td>
								<a id="addCondition2" class="icon-add" style="display:block; width: 100%;height: 100%;  href="javascript:void(0);">+</a>
							
<!-- 								<a id="addCondition" class="icon-remove" style="display:block; width: 100%;height: 100%; href="javascript:void(0);">-</a>
 -->							
							</td>
						</tr>
						<tr id="1">
							<td>
								<select name="condition1" id="conditionName1" style="width:200px;" class="easyui-combobox">
											<option value="0,机构全称">机构全称</option>
											<option value="0,归口管理部门">归口管理部门</option>
											<option value="0,所在地域">所在地域</option>
											<option value="0,法人代表">法人代表</option>
											<option value="0,联系人">联系人</option>
											<option value="0,机构属性">机构属性</option>
											<option value="0,技术需求名称">技术需求名称</option>
											<option value="0,技术需求所属领域">技术需求所属领域</option>

								</select>&nbsp;&nbsp;
								
								<input type="text" id="conditionValue1" style="width:200px;" class="easyui-textbox">&nbsp;
								<select  class="easyui-combobox" style="width:100px;"
										name="searchMethod1" id="searchMethod1">
										<option value="精确">精确</option>
										<option value="模糊">模糊</option>
								</select>
							</td>
							
						</tr>
						
		            </table>      
		        </form>
		</div>
    </div>  
</body>
<script type="text/javascript">
$(function() {
	onReady();
});
	var rowIndex = 3;
	$("#addCondition").click(
			function() {
				//alert("按钮已点击");
				//克隆第一行并将其追加到表格的尾部
				//$("tr:eq(1)").clone().appendTo("#conditionTable");
				//点击的次数是奇数就在左边的表添加一行
				if (rowIndex > 8) {
					alert("最多可添加8个查询条件");
				} else {
					var appendStr = "<tr id='"+rowIndex+"'><td><select id='bool"+rowIndex+"'><option value='0'>并且</option><option value='1'>或者</option><option value='2'>不含</option></select>&nbsp;<select id='conditionName"+rowIndex+"'><option value='机构全称'>机构全称</option><option value='归口管理部门'>归口管理部门</option><option value='所在地域'>所在地域</option><option value='法人代表'>法人代表</option><option value='联系人'>联系人</option><option value='机构属性'>机构属性</option><option value='技术需求名称'>技术需求名称</option><option value='技术需求所属领域'>技术需求所属领域</option></select>&nbsp;<input type='text' id='conditionValue"+rowIndex+"'>&nbsp;<select id='searchMethod"+rowIndex+"'><option value='精确'>精确</option><option value='模糊'>模糊</option></select></td></tr>";
					if (rowIndex % 2 == 1) {
						$("#conditionTable1").append(appendStr);
					} else {
						$("#conditionTable2").append(appendStr);
					}
					rowIndex++;
				}
	});
</script>
</html>