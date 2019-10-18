<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Quản lý User</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
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
            			<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/user/delete/${objUser.id}"></c:set>
            			<c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/user/edit/${objUser.id}"></c:set>
            			<tr class="odd gradeX">
		                    <td>${objUser.id}</td>
		                    <td>${objUser.username}</td>
		                    <td>${objUser.fullname}</td>
		                    <td>${objUser.enable}</td>
		                    <td>${objUser.name}</td>
		                    <td class="center text-center">
		                    	<c:choose>
		                    		<c:when test="${inforUser.id == 5}">
		                    			<c:choose>
		                    				<c:when test="${inforUser.id == objUser.id}">
		                    					<a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                    				</c:when>
		                    				<c:otherwise>
		                    					<a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
                								<a onclick="return confirm('Bạn có chắc chắn muốn xóa không ?')" href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-pencil "></span> Xóa</a>
		                    				</c:otherwise>
		                    			</c:choose>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<c:if test="${inforUser.id == objUser.id}">
		                    				<a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                    			</c:if>
		                    		</c:otherwise>
		                    	</c:choose>
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

        <c:if test="${numberOfPage > 1}">
        <!-- Pagination -->
    <nav class="text-center" aria-label="..."> 
        <ul class="pagination">
        	<c:set var="disabled" value="disabled"></c:set>
        	<c:choose>
        		<c:when test="${currentPage - 1 >= 1}">
        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/user/index/${currentPage -1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
        		</c:when>
        		<c:otherwise>
        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/user/index/1" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
        		</c:otherwise>
        	</c:choose>
            <c:forEach begin="1" end="${numberOfPage}" var="i">
            	<c:choose>
            		<c:when test="${i eq currentPage}">
            			<li class="active"><a href="${pageContext.request.contextPath}/admin/user/index/${i}">${i}</a></li>
            		</c:when>
            		<c:otherwise>
            			<li><a href="${pageContext.request.contextPath}/admin/user/index/${i}">${i}</a></li>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            <c:choose>
        		<c:when test="${currentPage + 1 <= numberOfPage}">
        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/user/index/${currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
        		</c:when>
        		<c:otherwise>
        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/user/index/${numberOfPage}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
        		</c:otherwise>
        	</c:choose>
        </ul>
    </nav>
    <!-- /.pagination -->
	</c:if>

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->
<script>
    document.getElementById("user").classList.add('active-menu');
</script>