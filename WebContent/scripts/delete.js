$(function(){
		 $(".Delete").click(function(){
			var b_name = $(this).next(":input").val();
			var flag = confirm("确定要删除"+ b_name +"的记录吗？");
			
	
			if(flag){
				var $tr = $(this).parent().parent();
				//删除, 使用 ajax 的方式
				var url = this.href;
				var args = {"time":new Date()};
				var args = "lijin";
				$.post(url, args, function(data){
					//若 data 的返回值为 1, 则提示 删除成功, 且把当前行删除
					if(data == "1"){
						alert("删除成功!");
						$tr.remove();
					}else{
						//若 data 的返回值不是 1, 提示删除失败. 
						alert("删除失败!");
					}
				});	
			}
			return false; 
		});
	})