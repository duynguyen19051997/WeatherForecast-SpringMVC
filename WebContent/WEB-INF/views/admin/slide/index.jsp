<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Quản lý Slide</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/admin/slide/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

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
                    <th>Slide</th>
                    <th>Sort</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty listSlide}">
            		<c:forEach items="${listSlide}" var="objSlide">
            			<c:set value="${pageContext.request.contextPath}/admin/slide/edit/${objSlide.id}" var="urlEdit"></c:set>
            			<c:set value="${pageContext.request.contextPath}/admin/slide/delete/${objSlide.id}" var="urlDelete"></c:set>
            			<tr class="odd gradeX">
		                    <td>${objSlide.id}</td>
		                    <td class="center text-center">
		                    	<c:if test="${not empty objSlide.slide}">
		                    		<img width="50px" height="50px" src="${pageContext.request.contextPath}/pathUrl/files/${objSlide.slide}"/>
		                    	</c:if>
		                    </td>
		                    <td>${objSlide.sort}</td>
		                    <td class="center text-center">
		                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                        <a onclick="return confirm('Bạn có chắc chắn muốn xóa không ?')" href="${urlDelete}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
		                    </td>
		                </tr>
            		</c:forEach>
            	</c:if>
                <c:if test="${empty listSlide}">
                	<tr>
                		<td colspan="4" style="text-align: center;">Không có dữ liệu</td>
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
	        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/slide/index/${currentPage -1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
	        		</c:when>
	        		<c:otherwise>
	        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/slide/index/1" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
	        		</c:otherwise>
	        	</c:choose>
	             <c:forEach begin="1" end="${numberOfPage}" var="i">
	            	<c:choose>
	            		<c:when test="${i eq currentPage}">
	            			<li class="active"><a href="${pageContext.request.contextPath}/admin/slide/index/${i}">${i}</a></li>
	            		</c:when>
	            		<c:otherwise>
	            			<li><a href="${pageContext.request.contextPath}/admin/slide/index/${i}">${i}</a></li>
	            		</c:otherwise>
	            	</c:choose>
	            </c:forEach>
	            <c:choose>
	        		<c:when test="${currentPage + 1 <= numberOfPage}">
	        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/slide/index/${currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
	        		</c:when>
	        		<c:otherwise>
	        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/slide/index/${numberOfPage}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
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
    document.getElementById("slide").classList.add('active-menu');
</script>