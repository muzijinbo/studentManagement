<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>成绩管理</title>
	    <link href="../css/themes/default/easyui.css" rel="stylesheet" />
	    <link href="../css/themes/icon.css" rel="stylesheet" />
	    <link href="../css/themes/color.css" rel="stylesheet" />
	    <script src="../scripts/jquery-1.9.1.min.js"></script>
	    <script src="../scripts/jquery.easyui.min.js"></script>
	    <script src="../scripts/easyui-lang-zh_CN.js"></script>
	    <script type="text/javascript">
	  //js方法：序列化表单 			
		function serializeForm(form){
			var obj = {};
			$.each(form.serializeArray(),function(index){
				if(obj[this['name']]){
					obj[this['name']] = obj[this['name']] + ','+this['value'];
				} else {
					obj[this['name']] =this['value'];
				}
			});
			return obj;
		}
	        $(function () {
	        	/**
				 *  提交表单方法
				 */
				$('#btn1').click(function(){
						if($('#myform').form('validate')){
							$.ajax({
								type: 'post' ,
								url: 'score-save' ,
								cache:false ,
								data:$('#myform').serialize() ,
								dataType:'json' ,
								success:function(result){
									var jdata = eval("(" + result + ")");
									alert(jdata);/* ************************************************ */
									//1 关闭窗口
									$('#mydialog').dialog('close');
									//2刷新datagrid 
									$('#score').datagrid('reload');
									//3 提示信息
									 $.messager.show({
										title:jdata.status , 
										msg:jdata.message
									}); 
									//alert(result.status);
								} ,
								error:function(result){
									$.meesager.show({
										title:result.status , 
										msg:result.message
									});
								}
							});
						} else {
							$.messager.show({
								title:'提示信息!' ,
								msg:'数据验证不通过,不能保存!'
							});
						}
				});
	        	/**
				 * 关闭窗口方法
				 */
				$('#btn2').click(function(){
					$('#mydialog').dialog('close');
				});
	        	var pars = {	         
	                	/* id:$("#b_id").val()   */               
	                }; 
	            loadData(pars);	          
	            alter("成功");
	           /*  $("#btnSerach").click(function () {
	            	alert($("#b_id").val());
	                loadData(pars);
	            });  */
	        });
	         function loadData(pars) {
	            $('#score').datagrid({	                
	                url: '../score-list',
	                //width: 1000,
	                //height: 400,
	                width: ($(window).width()*0.90), 
	                height:($(window).height()*0.99)-100, 
	                //fit:true,
	                fitColumns: true, //列自适应
	                nowrap: false,
	                idField: 'b_id',//主键列的列名
	                loadMsg: '正在加载信息...',
	                pagination: true,//是否有分页
	                singleSelect: false,//是否单行选择
	                pageSize: 10,//每页多少条数据
	                pageNumber: 1,//默认的页
	                pageList: [10, 20, 30],
	                queryParams: pars,//往后台传递参数
	                columns: [[
	                    { field: 'f_id', title: '班级编号', align: 'center' ,checkbox:true },
	                    {
	                        field: 'student',
	                        title: '学生', 
	                        align: 'center', 
	                        width: 100,
	                        formatter:function(value,row,index){
								return row.student.s_name;
	                         }
						  
	                    }, 
	                    {
	                        field: 'course',
	                        title: '课程', 
	                        align: 'center', 
	                        width: 100,
	                        formatter:function(value,row,index){
								return row.course.c_name;
	                         }
						  
	                    },                             
	                    { field: 'score', title: '分数', align: 'center'  },
		                  
	                    
	                ]], 
	                toolbar: [{
		                text:'添加',
	            		iconCls: 'icon-add',
	            		handler: function(){
		     
		            		$('#mydialog').dialog({
								title:'新增用户' 
							});
		            		$('#myform').get(0).reset();
		            		$('#mydialog').dialog('open');
		            	}
	            	},'-',{
	            		 text:'删除用户',
	            		iconCls: 'icon-remove',
	            		handler:function(){
							var arr =$('#score').datagrid('getSelections');
							if(arr.length <=0){
								$.messager.show({
									title:'提示信息!',
									msg:'至少选择一行记录进行删除!'
								});
							} else {
								
								$.messager.confirm('提示信息' , '确认删除?' , function(r){
										if(r){
												var ids = '';
												for(var i =0 ;i<arr.length;i++){
													ids += arr[i].b_id + ',' ;	
												}
												ids = ids.substring(0 , ids.length-1);
												$.post('score-delete' , {ids:ids} , function(result){
													//1 刷新数据表格 
													$('#score').datagrid('reload');
													//2 清空idField   
													$('#score').datagrid('unselectAll');
													//3 给提示信息 
													$.messager.show({
														title:'提示信息!' , 
														msg:'操作成功!'
													});
												});
										} else {
											return ;
										}
								});
							}
						}
	            	},'-',{
	            		 text:'编辑',
	            		iconCls: 'icon-edit',
	            		handler:function(){
							flag = 'edit';
							var arr =$('#score').datagrid('getSelections');
							if(arr.length != 1){
								$.messager.show({
									title:'提示信息!',
									msg:'只能选择一行记录进行修改!'
								});
							} else {
								$('#mydialog').dialog({
									title:'修改用户'
								});
								$('#mydialog').dialog('open'); //打开窗口
								$('#myform').get(0).reset();   //清空表单数据 
								$('#myform').form('load',{	   //调用load方法把所选中的数据load到表单中,非常方便
									b_id:arr[0].b_id,
									b_name:arr[0].b_name ,
								});
							}
						
						}
	            	}]

	            });
	        }; 
	        
				
				
				
	    </script>
	   <!--  <style>
	        body{
	            font-size:12px;
	            overflow-y:hidden;
	        }
	        input{
	            width:100px;            
	        }
	        select{
	            width:104px;
	        }
	        #sec{	        
	            width:1000px;	            
	        }
	        #sec td{
	            width:100px;
	            height:20px;
	            text-align:right
	        }
	    </style> -->
	</head>
	<body>
		<div id="lay" class="easyui-layout" style="width:1050px;height:470px" >
	
			 <div region="north" title="课程查询"  style="height:70px;" >
		        <form id="sec"  >
		            <tr>    
		                <td>课程名称:</td>
		                <td>		                	
		                	<input type="text" class="easyui-textbox" id="UserName" name="UserName"  />
		                </td>
		                <td>课程编号</td>
		                <td><input type="text" class="easyui-textbox" id="n_name" name="n_name" value="" /></td>        
		                  <td>
		                   <a href="javascript:void(0)" id="btnSerach" class="easyui-linkbutton c1" style="width:70px">查询</a>
		                  </td>           
		            </tr>       
		        </form>
		    </div>
		    <div region="center" >
				    <table id="score" >  
				    </table>
			 </div>
    	</div>  
	    <div id="mydialog" title="新增课程" modal=true  draggable=false class="easyui-dialog" closed=true style="width:300px;">
	    		<form id="myform" action="score-save" method="post">   				
	    				<table>    					
	    					<tr>
	    						<td>课程名称:</td>
	    						<td>
	    							<input type="text" name="b_name" class="easyui-validatebox" required=true validType="equalLength[4]" missingMessage="班级名称必填!" value="" />
	    							<input type="hidden" name="b_id" class="easyui-validatebox" required=true validType="equalLength[4]"/>	
	    						</td>
	    					</tr>    					
	    					<tr align="center">
	    						<td colspan="2">
	    							<!-- <button type="submit" class="easyui-linkbutton" >添加</button> -->
	    					<a id="btn1" class="easyui-linkbutton">提交</a>
	    							<a id="btn2" class="easyui-linkbutton">关闭</a>
	    						</td>
	    					</tr>   					 					    					    					    					    					    					    					    					
	    				</table>
	    		</form> 			
 			</div>
	</body>
</html>



