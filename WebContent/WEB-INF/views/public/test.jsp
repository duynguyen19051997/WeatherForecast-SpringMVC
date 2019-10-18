<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="${pageContext.request.contextPath}/publicUrl/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/publicUrl/js/jquery.validate.min.js"></script>
</head>
<body>
	<form id="searchform" action="" method="get">
		<input type="text" name="search" value="">
		<input type="submit" name="submit" value="submit">
	</form>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#searchform').validate({
				rules:{
					search:{
						required: true
					}
				},
				name:{
					search:{
						required:'Nhap'
					}
				}
			})
		});
	</script>
</body>
</html>