<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Kết quả tìm kiếm</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="add.php" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

    </div>
    <div class="col-md-4">
        <form id="search" action="${pageContext.request.contextPath}/admin/user/search" method="get">
        	<div class="input-group form">
	            <input type="text" name="search" class="form-control" value='<c:if test="${not empty search}">${search}</c:if>' placeholder="Search...">
	            <span class="input-group-btn">
	     			<button class="btn btn-primary" type="submit">Search</button>
	   			</span>
        	</div>
        </form>
        <script type="text/javascript">
	        $(document).ready(function () {
	    		$('#search').validate({
	    			rules: {
	    				"search": {
	    					required: true,
	    				},
	    			},
	    			messages: {
	    			  "search": {
	    				required: "Vui lòng không để trống!",
	    			  },
	    			},
	    		});
	    	});	
       	</script>
    </div>
</div>

<div class="row">
    <div class="panel-body">
    	<c:if test="${not empty msg}">
    		<h4 class="text-danger">${msg}</h4>
    	</c:if>
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Fullname</th>
                    <th>Enable</th>
                    <th>Role</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty listUser}">
            		<c:forEach items="${listUser}" var="objUser">
            			<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/user/delete/${objUser.id}/${currentPage}"></c:set>
            			<c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/user/edit/${objUser.id}/${currentPage}"></c:set>
            			<tr class="odd gradeX">
		                    <td>${objUser.id}</td>
		                    <td>${objUser.username}</td>
		                    <td>${objUser.fullname}</td>
		                    <td>${objUser.enable}</td>
		                    <td>${objUser.name}</td>
		                    <td class="center text-center">
		                    	<c:if test="${objUser.id != 1}">
			                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
			                        <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
		                    	</c:if>
		                    	<c:if test="${objUser.id == 1}">
			                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                    	</c:if>
		                    </td>
	               		 </tr>
            		</c:forEach>
            	</c:if>
            	<c:if test="${empty listUser}">
            		<tr>
            			<td colspan="6">Không có dữ liệu</td>
            		</tr>
            	</c:if>
            </tbody>
        </table>

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->
<script>
    document.getElementById("user").classList.add('active-menu');
</script>