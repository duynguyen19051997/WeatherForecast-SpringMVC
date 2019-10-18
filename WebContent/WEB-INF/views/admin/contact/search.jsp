<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Quản lý liên hệ</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
    </div>
    <div class="col-md-4">
        <form id="search" action="${pageContext.request.contextPath}/admin/contact/search" method="get">
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
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Nội dung</th>
                    <th width=180px>Chức năng</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty listContact}">
            		<c:forEach items="${listContact}" var="objContact">
            			<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/contact/delete/${objContact.cid}/${currentPage}"></c:set>
            			<c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/contact/edit/${objContact.cid}/${currentPage}"></c:set>
            			<tr class="odd gradeX">
		                    <td>${objContact.cid}</td>
		                    <td>${objContact.fullname}</td>
		                    <td>${objContact.email}</td>
		                    <td>${objContact.subject}</td>
		                    <td>${objContact.content}</td>
		                    <td class="center text-center">
		                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                        <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
		                    </td>
	               		 </tr>
            		</c:forEach>
            	</c:if>
            	<c:if test="${empty listContact}">
            		<tr>
            			<td colspan="6" style="text-align: center;">Từ khóa bạn tìm kiếm không có</td>
            		</tr>
            	</c:if>
            </tbody>
        </table>

        <!-- Pagination -->
    <%-- <nav class="text-center" aria-label="..."> 
        <ul class="pagination">
        <c:set var="disabled" value="disabled"></c:set>
        	<c:choose>
        		<c:when test="${currentPage - 1 >= 1}">
        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/contact/index/${currentPage -1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
        		</c:when>
        		<c:otherwise>
        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/index/1" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
        		</c:otherwise>
        	</c:choose>
            <c:forEach begin="1" end="${numberOfPage}" var="i">
            	<c:choose>
            		<c:when test="${i eq currentPage}">
            			<li class="active"><a href="${pageContext.request.contextPath}/admin/contact/index/${i}">${i}</a></li>
            		</c:when>
            		<c:otherwise>
            			<li><a href="${pageContext.request.contextPath}/admin/contact/index/${i}">${i}</a></li>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            <c:choose>
        		<c:when test="${currentPage + 1 <= numberOfPage}">
        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/contact/index/${currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
        		</c:when>
        		<c:otherwise>
        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/contact/index/${numberOfPage}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
        		</c:otherwise>
        	</c:choose>
        </ul>
    </nav> --%>
    <!-- /.pagination -->

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->
<script>
    document.getElementById("contact").classList.add('active-menu');
</script>