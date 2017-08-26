<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/delete.js">
	
</script>
</head>
<body>
	<h4>班级列表</h4>
		<s:if test="#request.allBanji == null ||  #request.allBanji.size() == 0">
		没有任何员工信息！
	</s:if>
	<s:else>
		<table border="1" cellpadding="10" cellspacing="0" target="banji-list.jsp">
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>delete</td>
			</tr>
			<s:iterator value="#request.allBanji">
				<tr>
					<td>${b_id}</td>
					<td>${b_name}</td>
					<td><a href="banji-delete?id=${b_id}" class="Delete">删除</a>
						<input type="hidden" value="${b_name }"/>
					</td>
				</tr>
			</s:iterator>
		</table>
	</s:else>
</body>
</html>